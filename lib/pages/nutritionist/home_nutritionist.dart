import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'publication_list.dart';

class HomeNutritionist extends StatefulWidget {
  HomeNutritionist({Key? key}) : super(key: key);
  @override
  State<HomeNutritionist> createState() => _HomeNutritionistState();
  static const String routeName = "/home_nutritionist";
}

class _HomeNutritionistState extends State<HomeNutritionist> {
  HttpHelper httpHelper = HttpHelper();
  Nutritionist nutritionist = new Nutritionist(
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
    fetchNutritionist();
  }

  Future fetchNutritionist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nutri = prefs.getString('nutritionist') ?? "";
    setState(() {
      if (nutri != "") {
        nutritionist =
            Nutritionist.fromJson(jsonDecode(nutri) as Map<String, dynamic>);
      }
    });
  }

  Drawer getDrawer(BuildContext context) {
    fetchNutritionist();
    var header = DrawerHeader(
      child: Container(
        padding: EdgeInsets.all(8),
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
                margin: EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    if (nutritionist.gender == "Male" &&
                        nutritionist.img == "img") ...[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "https://cdn-icons-png.flaticon.com/512/5745/5745426.png"),
                        radius: 20.0,
                      ),
                    ] else if (nutritionist.gender == "Female" &&
                        nutritionist.img == "img") ...[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "https://cdn-icons-png.flaticon.com/512/1597/1597405.png"),
                        radius: 20.0,
                      ),
                    ] else if (nutritionist.gender == "Other" &&
                        nutritionist.img == "img") ...[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: CachedNetworkImageProvider(
                            "https://cdn-icons-png.flaticon.com/512/3373/3373025.png"),
                        radius: 20.0,
                      ),
                    ] else if (nutritionist.img != "img") ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(nutritionist.img),
                        radius: 20.0,
                      ),
                    ],
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Text(nutritionist.name,
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
      decoration: new BoxDecoration(color: Color.fromRGBO(137, 197, 204, 5)),
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
        Container(
            height: MediaQuery.of(context).size.height / 3.5, child: header),
        getItem(new Icon(Icons.home), "Home", "/home_nutritionist"),
        getItem(new Icon(Icons.person), "Profile", "/profile_nutritionist"),
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
    fetchNutritionist();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home nutritionist"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
