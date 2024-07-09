import 'package:flutter/material.dart';
import 'chat_convo_screen.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            title: Text('Blood Donation Group'),
            subtitle: Text('Needed 20+ volunteers for blood donation'),
            trailing: Text('9:40 AM'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatConvoScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
