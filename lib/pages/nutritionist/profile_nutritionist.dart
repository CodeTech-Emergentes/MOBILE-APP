import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_profile_nutritionist.dart';

class ProfileNutritionist extends StatefulWidget {
  static const String routeName = "/profile_psycho";
  @override
  State<ProfileNutritionist> createState() => _ProfileNutritionistState();
}

bool isLoading = true;

class _ProfileNutritionistState extends State<ProfileNutritionist> {
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

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditedNutritionistProfile(psychologist),
        ));
    setState(() {
      psychologist = result as Nutritionist;
    });
  }

  Future fetchPsychologist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      psychologist = Nutritionist.fromJson(
          jsonDecode(prefs.getString('psychologist')!) as Map<String, dynamic>);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (psychologist.name == "") {
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
                        backgroundImage:
                            CachedNetworkImageProvider(psychologist.img),
                        radius: 75.0,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            psychologist.name,
                            style: TextStyle(fontSize: 30.0),
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
                                  Text("Email: " + psychologist.email,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Phone: " + psychologist.phone,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Birthday: " +
                                          psychologist.birthday
                                              .substring(0, 10),
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Gender: " + psychologist.gender,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Specialization: " +
                                          psychologist.specialization,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("Formation: " + psychologist.formation,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("CNP: " + psychologist.cmp,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text(
                                      "Session type: " +
                                          psychologist.sessionType,
                                      style: TextStyle(fontSize: 20.0)),
                                  SizedBox(height: 10),
                                  Text("About: " + psychologist.about,
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