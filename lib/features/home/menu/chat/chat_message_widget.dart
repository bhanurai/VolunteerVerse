import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final FlutterSoundPlayer player;

  ChatMessageWidget({required this.message, required this.player});

  @override
  Widget build(BuildContext context) {
    bool isUser = message.isUser;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      padding: EdgeInsets.all(10.0),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isUser ? Colors.blue : Colors.black,
              ),
            ),
            message.isVoice
                ? IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      player.startPlayer(fromURI: message.message);
                    },
                  )
                : Text(message.message),
            SizedBox(height: 5),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
