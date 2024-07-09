import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';

class ChatConvoScreen extends StatefulWidget {
  final String chatName;

  ChatConvoScreen({required this.chatName});

  @override
  _ChatConvoScreenState createState() => _ChatConvoScreenState();
}

class _ChatConvoScreenState extends State<ChatConvoScreen> {
  final TextEditingController _controller = TextEditingController();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    requestMicrophonePermission();
    initializeSound();
    loadMessages();
  }

  @override
  void dispose() {
    _controller.dispose();
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  Future<void> requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
  }

  Future<void> initializeSound() async {
    await _recorder.openRecorder();
    await _player.openPlayer();
  }

  Future<void> loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? messagesString = prefs.getString('messages_${widget.chatName}');
    if (messagesString != null) {
      setState(() {
        _messages = (json.decode(messagesString) as List)
            .map((data) => ChatMessage.fromJson(data))
            .toList();
      });
    } else {
      // Adding some pre-existing messages
      setState(() {
        _messages = [
          ChatMessage(
            name: 'Admin',
            message: 'Welcome to the Blood Donation Group!',
            imageUrl: 'assets/blood_donation_group_icon.png',
            isVoice: false,
          ),
          ChatMessage(
            name: 'Admin',
            message: 'Feel free to ask any questions.',
            imageUrl: 'assets/blood_donation_group_icon.png',
            isVoice: false,
          ),
          ChatMessage(
            name: 'User1',
            message: 'Thank you! Looking forward to contributing.',
            imageUrl: 'assets/your_image.png',
            isVoice: false,
          ),
        ];
      });
      saveMessages();
    }
  }

  Future<void> saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String messagesString =
        json.encode(_messages.map((msg) => msg.toJson()).toList());
    prefs.setString('messages_${widget.chatName}', messagesString);
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          name: 'You',
          message: _controller.text,
          imageUrl: 'assets/your_image.png',
          isVoice: false,
        ));
        _controller.clear();
      });
      saveMessages();
    }
  }

  Future<void> _startRecording() async {
    try {
      Directory tempDir = await Directory.systemTemp.createTemp();
      String filePath = '${tempDir.path}/temp.aac';
      await _recorder.startRecorder(toFile: filePath, codec: Codec.aacADTS);
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print('Failed to start recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      String? filePath = await _recorder.stopRecorder();
      setState(() {
        _isRecording = false;
      });
      if (filePath != null) {
        setState(() {
          _messages.add(ChatMessage(
            name: 'You',
            message: filePath,
            imageUrl: 'assets/your_image.png',
            isVoice: true,
          ));
        });
        saveMessages();
      }
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }

  void _deleteMessage(int index) {
    setState(() {
      _messages.removeAt(index);
    });
    saveMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_messages[index].message),
                  onDismissed: (direction) {
                    _deleteMessage(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Message deleted"),
                    ));
                  },
                  child: ChatMessageWidget(
                    message: _messages[index],
                    player: _player,
                    onDelete: () => _deleteMessage(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
                IconButton(
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                  onPressed: _isRecording ? _stopRecording : _startRecording,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String name;
  final String message;
  final String imageUrl;
  final bool isVoice;

  ChatMessage({
    required this.name,
    required this.message,
    required this.imageUrl,
    required this.isVoice,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'imageUrl': imageUrl,
        'isVoice': isVoice,
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      name: json['name'],
      message: json['message'],
      imageUrl: json['imageUrl'],
      isVoice: json['isVoice'],
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final FlutterSoundPlayer player;
  final VoidCallback onDelete;

  ChatMessageWidget({
    required this.message,
    required this.player,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(message.imageUrl),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                message.isVoice
                    ? IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () async {
                          await player.startPlayer(
                            fromURI: message.message,
                            codec: Codec.aacADTS,
                            whenFinished: () {
                              player.stopPlayer();
                            },
                          );
                        },
                      )
                    : Text(message.message),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
