import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});
  static const String routeName = "/chatbot";
  @override
  State<ChatBot> createState() => _nameState();
}

class _nameState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asistente Virtual"),
      ),
      body: Container(
        child: Text("ChatBot"),
      ),
    );
  }
}
