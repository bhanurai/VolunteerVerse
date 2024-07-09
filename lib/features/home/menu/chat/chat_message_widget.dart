import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final FlutterSoundPlayer player;
  final void Function()? onDelete;

  ChatMessageWidget(
      {required this.message, required this.player, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(message.imageUrl),
      ),
      title: Text(message.name),
      subtitle: message.isVoice
          ? IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                player.startPlayer(fromURI: message.message);
              },
            )
          : Text(message.message),
      trailing: onDelete != null
          ? IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            )
          : null,
    );
  }
}
