import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/pages/patient/edit_profile_patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile_patient extends StatefulWidget {
  static const String routeName = "/profile_patient";
  @override
  State<Profile_patient> createState() => _Profile_patientState();
}

class _Profile_patientState extends State<Profile_patient> {
  HttpHelper httpHelper = HttpHelper();
  Patient patient = Patient(
      id: 1,
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      password: "",
      date: "",
      gender: "",
      img: "");

  @override
  void initState() {
    httpHelper = HttpHelper();
    fetchPatient();
    super.initState();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditPatientProfile(patient),
        ));
    setState(() {
      patient = result as Patient;
    });
  }

  Future fetchPatient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      patient = Patient.fromJson(
          jsonDecode(prefs.getString('patient')!) as Map<String, dynamic>);
    });
    return patient;
  }

  @override
  Widget build(BuildContext context) {
    if (patient.firstName == "") {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (patient.gender == "Male" && patient.img == "img") ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"),
                  radius: 75.0,
                ),
              ] else if (patient.gender == "Other") ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png"),
                  radius: 75.0,
                ),
              ] else if (patient.gender == "Female" &&
                  patient.img == "img") ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgp-e7MKZn4WU0yEmVMsfLKj9IJk4XH_OP8ylE0G202a7R4R_-T24gHBFVs3dX0I25y_w&usqp=CAU"),
                  radius: 75.0,
                ),
              ] else if (patient.img != "img") ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(patient.img),
                  radius: 75.0,
                ),
              ],
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    patient.firstName + " " + patient.lastName,
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
                          Text("Correo: " + patient.email,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Teléfono: " + patient.phone,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Fecha de Nacimiento: " + patient.date,
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text("Género: " + patient.gender,
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
                      label: Text("Editar Perfil",
                          style: TextStyle(fontSize: 20.0)))
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
