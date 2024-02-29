import 'package:flutter/material.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatDetailsPage: $chatId'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(color: Colors.blue)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(height: 1.0),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        hintText: 'Type message',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const IconButton(onPressed: null, icon: Icon(Icons.send)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
