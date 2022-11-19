import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../nutritionist/publication_list.dart';

class Home_patient extends StatefulWidget {
  Home_patient({Key? key}) : super(key: key);
  @override
  State<Home_patient> createState() => _Home_patientState();
  static const String routeName = "/home_patient";
}

class _Home_patientState extends State<Home_patient> {
  HttpHelper httpHelper = HttpHelper();
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

  @override
  void initState() {
    httpHelper = HttpHelper();
    fetchPatient();
    super.initState();
  }

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

  Drawer getDrawer(BuildContext context) {
    fetchPatient();
    var header = new DrawerHeader(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Nutrix",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bienvenido",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (patient.gender == "Male" && patient.img == "img") ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png"),
                        radius: 20.0,
                      ),
                    ] else if (patient.gender == "Other") ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png"),
                        radius: 20.0,
                      ),
                    ] else if (patient.gender == "Female" &&
                        patient.img == "img") ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgp-e7MKZn4WU0yEmVMsfLKj9IJk4XH_OP8ylE0G202a7R4R_-T24gHBFVs3dX0I25y_w&usqp=CAU"),
                        radius: 20.0,
                      ),
                    ] else if (patient.img != "img") ...[
                      CircleAvatar(
                        backgroundImage: NetworkImage(patient.img),
                        radius: 20.0,
                      ),
                    ],
                    SizedBox(width: 8.0),
                    Flexible(
                      child: Text(patient.firstName + " " + patient.lastName,
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
      decoration: new BoxDecoration(
        color: Color.fromRGBO(137, 197, 204, 5),
      ),
    );

    Container getItem(Icon icon, String description, String route) {
      return new Container(
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
      children: <Widget>[
        /*Container(
            height: MediaQuery.of(context).size.height / 3.5, child: header),*/
        header,
        getItem(new Icon(Icons.list_alt), "Lista de Publicaciones",
            "/home_patient"),
        getItem(new Icon(Icons.person), "Perfil", "/profile_patient"),
        getItem(new Icon(Icons.people), "Lista de Nutricionistas",
            "/list_nutritionist"),
        getItem(
            new Icon(Icons.date_range), "Mis citas", "/dating_dates_patient"),
        getItem(new Icon(Icons.description), "Bitácora del Paciente",
            "/logbook_patient"),
        getItem(
            new Icon(Icons.assignment_sharp), "Asistente Virtual", "/chatbot"),
        getItem(new Icon(Icons.logout), "Cerrar sesión", "/login")
      ],
    );

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Menú del Paciente"),
      ),
      body: PublicationList(),
      drawer: new Drawer(
        child: getDrawer(context),
      ),
    );
  }
}
