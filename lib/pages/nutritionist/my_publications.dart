// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'create_publication.dart';
import 'edit_publication.dart';

class My_publications extends StatefulWidget {
  static const String routeName = "/my_publications";
  @override
  State<My_publications> createState() => _My_publicationsState();
}

class _My_publicationsState extends State<My_publications> {
  List publications = [];
  HttpHelper httpHelper = HttpHelper();
  Publication publicationInfo = Publication(
    id: 1,
    title: "",
    description: "",
    tags: "",
    content: "",
    photoUrl: "",
    nutritionist: Nutritionist(
        id: 1,
        name: "",
        dni: "",
        birthday: "",
        email: "pedro@gmail.com",
        password: "12345678",
        phone: "987456124",
        specialization: "Social",
        formation: "Universidad",
        about: "Nutricionista con 10 anios de experiencia",
        gender: "Male",
        sessionType: "1",
        img: "a",
        cmp: "a",
        active: true,
        fresh: true),
  );

  @override
  void initState() {
    publications = [];
    httpHelper = HttpHelper();
    fetchPublications();
    super.initState();
  }

  Future<void> navigateToEdit(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedPublication(publicationInfo),
        ));
    setState(() {
      //modify the publication
      fetchPublications();
    });
  }

  Future<void> navigateToCreate(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreatePublication(),
        ));
    setState(() {
      fetchPublications();
    });
  }

  void deletePublicationById(int id, int index) {
    httpHelper.deletePublication(id).then((value) {
      setState(() {
        publications.removeAt(index);
      });
    });
  }

  Future fetchPublications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    httpHelper.fetchPublicationByNutritionistId(id!).then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mis Publicaciones"),
        actions: <Widget>[
          TextButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              navigateToCreate(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
        itemCount: publications.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              child: Column(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwgaw2H5oC3iXp5qxzNlLqUEFQu7qVMgBOtQ&usqp=CAU",
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Text(publications[index].title,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Text(publications[index].description,
                      textAlign: TextAlign.justify),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new TextButton(
                        child: Text('Edit'),
                        onPressed: () {
                          publicationInfo = publications[index];
                          navigateToEdit(context);
                        }),
                    TextButton(
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          deletePublicationById(publications[index].id, index);
                        }),
                  ],
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
