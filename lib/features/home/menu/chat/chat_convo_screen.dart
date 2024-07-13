import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'chat_message.dart';
import 'chat_message_widget.dart';

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
    print('Loaded messagesString: $messagesString');

    if (messagesString != null && messagesString.isNotEmpty) {
      setState(() {
        _messages = (json.decode(messagesString) as List)
            .map((data) => ChatMessage.fromJson(data))
            .toList();
      });
      print('Loaded messages: $_messages');
    }

    if (_messages.isEmpty) {
      setState(() {
        _messages = [
          ChatMessage(
            name: 'Admin',
            message: 'Welcome to the ${widget.chatName}!',
            imageUrl: 'assets/images/logo.png',
            isVoice: false,
            isUser: false,
            time: _formatCurrentTime(),
          ),
          ChatMessage(
            name: 'Gita Rana',
            message: 'Thank you! Looking forward to contributing.',
            imageUrl: 'assets/images/food.png',
            isVoice: false,
            isUser: false,
            time: _formatCurrentTime(),
          ),
          ChatMessage(
            name: 'Ramesh Singh',
            message: 'Thank you! I m very existing to work with you guys.',
            imageUrl: 'assets/images/food.png',
            isVoice: false,
            isUser: false,
            time: _formatCurrentTime(),
          ),
        ];
      });
      print('Set default messages: $_messages');
      saveMessages();
    }
  }

  Future<void> saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String messagesString =
        json.encode(_messages.map((msg) => msg.toJson()).toList());
    await prefs.setString('messages_${widget.chatName}', messagesString);
    print('Saved messagesString: $messagesString');
  }

  String _formatCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          name: 'You',
          message: _controller.text,
          imageUrl: 'assets/images/me.jpg',
          isVoice: false,
          isUser: true,
          time: _formatCurrentTime(),
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
            imageUrl: 'assets/images/me.jpg',
            isVoice: true,
            isUser: true,
            time: _formatCurrentTime(),
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

  void _confirmDeleteMessage(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Message'),
          content: Text('Are you sure you want to delete this message?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteMessage(index);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                print('Building message at index $index: ${_messages[index]}');
                return GestureDetector(
                  onLongPress: _messages[index].isUser
                      ? () => _confirmDeleteMessage(index)
                      : null,
                  child: ChatMessageWidget(
                    message: _messages[index],
                    player: _player,
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
