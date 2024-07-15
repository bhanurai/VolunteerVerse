import 'package:flutter/material.dart';
import 'chat_convo_screen.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<String> _chatNames = [
    'Bagmati Cleanup',
    'Tudhikhel Cleanup',
  
  ];
  List<String> _filteredChatNames = [];

  @override
  void initState() {
    super.initState();
    _filteredChatNames = _chatNames;
  }

  void _filterChats(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredChatNames = _chatNames;
      } else {
        _filteredChatNames = _chatNames
            .where((chatName) =>
                chatName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToChat(String chatName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChatConvoScreen(chatName: chatName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterChats,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredChatNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  title: Text(_filteredChatNames[index]),
                  onTap: () => _navigateToChat(_filteredChatNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
