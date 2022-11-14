// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePublication extends StatefulWidget {
  @override
  State<CreatePublication> createState() => _CreatePublicationState();
}

class _CreatePublicationState extends State<CreatePublication> {
  HttpHelper httpHelper = HttpHelper();
  int id = 0;

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerTag = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();
  final TextEditingController controllerPhotoUrl = TextEditingController();

  Future fetchPsychologist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('id')!;
    });
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    fetchPsychologist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Crear Publicación'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return new ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerTitle,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Título',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerDescription,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Descripción',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerTag,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Etiqueta',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerContent,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contenido',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text('Crear Publicación'),
          onPressed: () async {
            String title = controllerTitle.text;
            String description = controllerDescription.text;
            String tags = controllerTag.text;
            String content = controllerContent.text;
            String photoUrl = "a";

            await httpHelper.createPublication(
                title, tags, description, photoUrl, content, id);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
