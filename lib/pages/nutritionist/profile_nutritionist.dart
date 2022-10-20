import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_profile_nutritionist.dart';

class ProfileNutritionist extends StatefulWidget {
  static const String routeName = "/profile_nutritionist";
  @override
  State<ProfileNutritionist> createState() => _ProfileNutritionistState();
}

bool isLoading = true;

class _ProfileNutritionistState extends State<ProfileNutritionist> {
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

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedNutritionistProfile(nutritionist),
        ));
    setState(() {
      nutritionist = result as Nutritionist;
    });
  }

  Future fetchNutritionist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nutritionist = Nutritionist.fromJson(
          jsonDecode(prefs.getString('nutritionist')!) as Map<String, dynamic>);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (nutritionist.name == "") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
          ),
          body: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            "https://cdn-icons-png.flaticon.com/512/5745/5745426.png"),
                        radius: 75.0,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.center,
                              nutritionist.name,
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email: " + nutritionist.email,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Phone: " + nutritionist.phone,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Birthday: " +
                                          nutritionist.birthday
                                              .substring(0, 10),
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Gender: " + nutritionist.gender,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Specialization: " +
                                          nutritionist.specialization,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Formation: " + nutritionist.formation,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("CNP: " + nutritionist.cmp,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Session type: " +
                                          nutritionist.sessionType,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("About: " + nutritionist.about,
                                      style: TextStyle(fontSize: 20.0)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              _navigateAndDisplaySelection(context);
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 25,
                            ),
                            label: Text("Edit profile",
                                style: TextStyle(fontSize: 20.0)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )));
    }
  }
}
