import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'publication_list.dart';

class HomeNutritionist extends StatefulWidget {
  HomeNutritionist({Key? key}) : super(key: key);
  @override
  State<HomeNutritionist> createState() => _HomeNutritionistState();
  static const String routeName = "/home_psycho";
}

class _HomeNutritionistState extends State<HomeNutritionist> {
  HttpHelper httpHelper = HttpHelper();
  Nutritionist psychologist = new Nutritionist(
      id: 1,
      name: "",
      dni: "",
      birthday: "",
      email: "",
      password: "",
      phone: "",
      specialization: "",
      formation: "",
      about: "",
      gender: "",
      sessionType: "",
      img: "",
      cmp: "",
      active: true,
      fresh: true);

  @override
  void initState() {
    httpHelper = HttpHelper();
    super.initState();
    fetchPsychologist();
  }

  Future fetchPsychologist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var psycho = prefs.getString('psychologist') ?? "";
    setState(() {
      if (psycho != "") {
        psychologist =
            Nutritionist.fromJson(jsonDecode(psycho) as Map<String, dynamic>);
      }
    });
  }

  Drawer getDrawer(BuildContext context) {
    fetchPsychologist();
    var header = DrawerHeader(
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Nutrix",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bienvenido,",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(psychologist.img),
                      radius: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(psychologist.name,
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),
    );

    Container getItem(Icon icon, String description, String route) {
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: ListTile(
          leading: icon,
          title: new Text(description),
          onTap: () {
            setState(() {
              Navigator.of(context).pushNamed(route);
            });
          },
        ),
      );
    }

    ListView listView = new ListView(
      children: [
        header,
        getItem(new Icon(Icons.home), "Home", "/home_psycho"),
        getItem(new Icon(Icons.person), "Profile", "/profile_psycho"),
        getItem(new Icon(Icons.people), "Patient list", "/list_patients"),
        getItem(new Icon(Icons.date_range), "My appointments", "/dating_dates"),
        getItem(new Icon(Icons.public), "My publications", "/my_publications"),
        getItem(new Icon(Icons.logout), "Logout", "/login"),
      ],
    );

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    fetchPsychologist();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home psychologist"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
