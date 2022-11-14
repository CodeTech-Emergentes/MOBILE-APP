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
          title: Text("Perfil"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Perfil"),
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
                      if (nutritionist.gender == "Male" &&
                          nutritionist.img == "img") ...[
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              "https://cdn-icons-png.flaticon.com/512/5745/5745426.png"),
                          radius: 75.0,
                        ),
                      ] else if (nutritionist.gender == "Female" &&
                          nutritionist.img == "img") ...[
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              "https://cdn-icons-png.flaticon.com/512/1597/1597405.png"),
                          radius: 75.0,
                        ),
                      ] else if (nutritionist.gender == "Other" &&
                          nutritionist.img == "img") ...[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                              "https://cdn-icons-png.flaticon.com/512/3373/3373025.png"),
                          radius: 75.0,
                        ),
                      ] else if (nutritionist.img != "img") ...[
                        CircleAvatar(
                          backgroundImage: NetworkImage(nutritionist.img),
                          radius: 75.0,
                        ),
                      ],
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
                                  Row(
                                    children: [
                                      Text(
                                        "Correo: ",
                                        style: TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                        child: Text(nutritionist.email,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Teléfono: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.phone,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Fecha de Nacimiento: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(
                                            nutritionist.birthday
                                                .substring(0, 10),
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Género: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.gender,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Especialidad: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.specialization,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Formación: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.formation,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("CMP: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.cmp,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Tipo de cita: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.sessionType,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text("Acerca: ",
                                          style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.bold)),
                                      Flexible(
                                        child: Text(nutritionist.about,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(fontSize: 16.5)),
                                      ),
                                    ],
                                  ),
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
                            label: Text("Editar Perfil",
                                style: TextStyle(fontSize: 16.5)),
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
