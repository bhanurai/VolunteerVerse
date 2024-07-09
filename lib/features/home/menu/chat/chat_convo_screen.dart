import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:io';

class ChatConvoScreen extends StatefulWidget {
  @override
  _ChatConvoScreenState createState() => _ChatConvoScreenState();
}

class _ChatConvoScreenState extends State<ChatConvoScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      name: 'Jasmin Shrestha',
      message:
          'Dear Volunteers, We are thrilled to announce our upcoming Blood Donation Drive...',
      imageUrl: 'assets/images/logo.png',
      isVoice: false,
    ),
    ChatMessage(
      name: 'Liam Lone',
      message:
          'Hi Emma! I think we\'re pretty much set. I\'ve confirmed the venue and time...',
      imageUrl: 'assets/images/logo.png',
      isVoice: false,
    ),
    ChatMessage(
      name: 'Aiden Lara',
      message:
          'That\'s great news, Liam! I\'ve been working on the flyers and social media posts...',
      imageUrl: 'assets/images/logo.png',
      isVoice: false,
    ),
    ChatMessage(
      name: 'Harry Loren',
      message:
          'Awesome work, Sophia! Maybe we could do a quick video message too?',
      imageUrl: 'assets/images/logo.png',
      isVoice: false,
    ),
  ];
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _recorder.openRecorder();
    requestMicrophonePermission();
  }

  @override
  void dispose() {
    _controller.dispose();
    _recorder.closeRecorder();
    super.dispose();
  }

  Future<void> requestMicrophonePermission() async {
    await Permission.microphone.request();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          name: 'You',
          message: _controller.text,
          imageUrl: 'assets/images/logo.png',
          isVoice: false,
        ));
        _controller.clear();
      });
    }
  }

  void _startRecording() async {
    Directory tempDir = await Directory.systemTemp.createTemp();
    String filePath = '${tempDir.path}/temp.aac';
    await _recorder.startRecorder(toFile: filePath, codec: Codec.aacADTS);
    setState(() {
      _isRecording = true;
    });
  }

  void _stopRecording() async {
    String? filePath = await _recorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
    if (filePath != null) {
      setState(() {
        _messages.add(ChatMessage(
          name: 'You',
          message: filePath,
          imageUrl: 'assets/image/me.jpg',
          isVoice: true,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donation Group'),
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
                return ChatMessageWidget(
                  message: _messages[index],
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
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final FlutterSoundPlayer _player = FlutterSoundPlayer();

  ChatMessageWidget({required this.message}) {
    _player.openPlayer();
  }

  @override
  void dispose() {
    _player.closePlayer();
  }

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
                        onPressed: () {
                          _player.startPlayer(
                              fromURI: message.message, codec: Codec.aacADTS);
                        },
                      )
                    : Text(message.message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
