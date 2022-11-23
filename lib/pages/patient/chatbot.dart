import 'dart:convert';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});
  static const String routeName = "/chatbot";
  @override
  State<ChatBot> createState() => _nameState();
}

class _nameState extends State<ChatBot> {
  final TextEditingController _controller = TextEditingController();
  late DialogFlowtter dialogFlowtter;
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  void sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }
    setState(() {
      Message userMessage = Message(text: DialogText(text: [text]));
      addMessage(userMessage, true);
    });
    QueryInput query = QueryInput(text: TextInput(text: text));
    DetectIntentResponse res = await dialogFlowtter.detectIntent(
      queryInput: query,
    );
    if (res.message == null) return;
    setState(() {
      addMessage(res.message!);
    });
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asistente Virtual')),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.network(
                fit: BoxFit.cover,
                //newtwork image
                'https://i.pinimg.com/736x/6b/54/34/6b5434d2b638856b4ba4c44c0b33517e.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: MessageList(
                  messages: messages,
                )),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _controller,
                          autocorrect: true,
                        ),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.send),
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  const MessageList({Key? key, this.messages = const []}) : super(key: key);
  final List<Map<String, dynamic>> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      separatorBuilder: (_, i) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        var obj = messages[messages.length - 1 - i];
        return _MessageContainer(
          message: obj['message'],
          isUserMessage: obj['isUserMessage'],
        );
      },
      reverse: true,
    );
  }
}

class _MessageContainer extends StatefulWidget {
  final Message message;
  final bool isUserMessage;

  const _MessageContainer({
    Key? key,
    required this.message,
    this.isUserMessage = false,
  }) : super(key: key);

  @override
  State<_MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<_MessageContainer> {
  Patient patient = new Patient(
      id: 1,
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      password: "",
      date: "",
      gender: "",
      img: "");
  Future fetchPatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var patientTemp = prefs.getString('patient') ?? "";
    setState(() {
      if (patientTemp != "") {
        patient =
            Patient.fromJson(jsonDecode(patientTemp) as Map<String, dynamic>);
      }
    });
  }

  HttpHelper httpHelper = HttpHelper();
  @override
  void initState() {
    httpHelper = HttpHelper();
    fetchPatient();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fetchPatient();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.isUserMessage
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.isUserMessage == false
            ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqOMy4dd3OMUyzXN_PcF94BW_56hJCmFlCM0JPzXbhLLMJuMdBTmiEAgBrGIJ0fX_OchM&usqp=CAU"),
                  radius: 20.0,
                ),
              )
            : Container(),
        Container(
          constraints: BoxConstraints(maxWidth: 250),
          child: Container(
            decoration: BoxDecoration(
              color: widget.isUserMessage ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),

            /// Espaciado
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.message.text?.text![0] ?? '',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        widget.isUserMessage == true
            ? Container(
                margin: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(patient.img, scale: 0.5),
                  radius: 20.0,
                ),
              )
            : Container(),
      ],
    );
  }
}
