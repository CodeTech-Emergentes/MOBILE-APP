// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:psychohelp_app/models/appointment.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:psychohelp_app/models/patient.dart';

import '../../controller/payment_controller.dart';

class ListNutritionist extends StatefulWidget {
  static const String routeName = "/list_nutritionist";
  @override
  State<ListNutritionist> createState() => _ListNutritionistState();
}

class _ListNutritionistState extends State<ListNutritionist> {
  List nutritionists = [];
  List appointment = [];
  int patientId = 0;
  HttpHelper httpHelper = HttpHelper();
  DateTime selectedDate = DateTime.now();

  var controllerAppointment = TextEditingController();
  var motiveController = TextEditingController();
  final TextEditingController controllerUrl = TextEditingController();
  final TextEditingController controllerMotive = TextEditingController();
  final TextEditingController controllerPersonalHistory =
      TextEditingController();
  final TextEditingController controllerTestRealized = TextEditingController();
  final TextEditingController controllerTreatment = TextEditingController();
  final TextEditingController controllerScheduleDate = TextEditingController();

  @override
  void initState() {
    nutritionists = [];
    httpHelper = HttpHelper();
    fetchNutritionists();
    getPatientId();
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day + 7));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controllerAppointment.text =
            formatDate(selectedDate, [dd, '/', mm, '/', yy]);
        //selectedDate.toString().substring(0, 10);
      });
    }
  }

  void fetchNutritionists() {
    httpHelper.fetchNutritionist().then((value) {
      setState(() {
        this.nutritionists = value;
      });
    });
  }

  Future getPatientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      final patient = Patient.fromJson(
          jsonDecode(prefs.getString('patient')!) as Map<String, dynamic>);
      patientId = patient.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Nutritionist list"),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(30.0),
            itemCount: nutritionists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(children: <Widget>[
                  if (nutritionists[index].gender == "Male" &&
                          nutritionists[index].img == "img" ||
                      nutritionists[index].img == "test" ||
                      nutritionists[index].img == "a") ...[
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/5745/5745426.png")),
                    ),
                  ] else if (nutritionists[index].gender == "Female" &&
                      nutritionists[index].img == "img") ...[
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/1597/1597405.png")),
                    ),
                  ] else if (nutritionists[index].gender == "Other" &&
                      nutritionists[index].img == "img") ...[
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 65,
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/3373/3373025.png")),
                    ),
                  ] else if (nutritionists[index].img != "img") ...[
                    CircleAvatar(
                      backgroundImage: NetworkImage(nutritionists[index].img),
                      radius: 75.0,
                    ),
                  ],
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(nutritionists[index].name),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(nutritionists[index].about),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: Text("See more"),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      )),
                                      title: Text(
                                        "Detalles del nutricionista",
                                        textAlign: TextAlign.center,
                                      ),
                                      contentPadding: EdgeInsets.all(16.0),
                                      children: <Widget>[
                                        if (nutritionists[index].gender ==
                                                    "Male" &&
                                                nutritionists[index].img ==
                                                    "img" ||
                                            nutritionists[index].img ==
                                                "test" ||
                                            nutritionists[index].img ==
                                                "a") ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 90,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.greenAccent[100],
                                                radius: 85,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://cdn-icons-png.flaticon.com/512/5745/5745426.png"), //NetworkImage
                                                  radius: 75,
                                                ), //CircleAvatar
                                              ), //CircleAvatar
                                            ),
                                          ),
                                        ] else if (nutritionists[index]
                                                    .gender ==
                                                "Female" &&
                                            nutritionists[index].img ==
                                                "img") ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 90,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.greenAccent[100],
                                                radius: 85,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://cdn-icons-png.flaticon.com/512/1597/1597405.png"), //NetworkImage
                                                  radius: 75,
                                                ), //CircleAvatar
                                              ), //CircleAvatar
                                            ),
                                          ),
                                        ] else if (nutritionists[index]
                                                    .gender ==
                                                "Other" &&
                                            nutritionists[index].img ==
                                                "img") ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 90,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.greenAccent[100],
                                                radius: 85,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: NetworkImage(
                                                      "https://cdn-icons-png.flaticon.com/512/3373/3373025.png"), //NetworkImage
                                                  radius: 75,
                                                ), //CircleAvatar
                                              ), //CircleAvatar
                                            ),
                                          ),
                                        ] else if (nutritionists[index].img !=
                                            "img") ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 90,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.greenAccent[100],
                                                radius: 85,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      nutritionists[index]
                                                          .img), //NetworkImage
                                                  radius: 75,
                                                ), //CircleAvatar
                                              ), //CircleAvatar
                                            ),
                                          ),
                                        ],
                                        Text("Nombre: ",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900]),
                                            textAlign: TextAlign.start),
                                        Text(nutritionists[index].name),
                                        SizedBox(height: 5.0),
                                        Text("CNP",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: "Roboto",
                                                color: Colors.blue[900])),
                                        Text(nutritionists[index].cmp),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "DNI",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index].dni),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Teléfono",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index].phone),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Especialidad",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index]
                                            .specialization),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Formación",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index].formation),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Acerca de mí",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index].about),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Tipo de Sesión",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: "Roboto",
                                              color: Colors.blue[900]),
                                        ),
                                        Text(nutritionists[index].sessionType)
                                      ]));
                        },
                      ),
                      TextButton(
                        child: Text("Agendar cita"),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    )),
                                    title: Text(
                                      "Detalles de la cita",
                                      textAlign: TextAlign.center,
                                    ),
                                    children: <Widget>[
                                      TextField(
                                        controller: motiveController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 10),
                                          border: OutlineInputBorder(),
                                          labelText: 'Motivo de la cita',
                                          hintText:
                                              'Ingresa tu motivo para la cita',
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      TextField(
                                        controller: controllerAppointment,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 10),
                                          border: OutlineInputBorder(),
                                          labelText: 'Appointment Date',
                                          hintText:
                                              'Enter your Appointment Date',
                                          suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                Icons.date_range,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                _selectDate(context);
                                              }),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: Text("Agendar"),
                                        onPressed: () async {
                                          String meetUrl = "string";
                                          String motive = motiveController.text;
                                          String personalHistory =
                                              "En revision";
                                          String testRealized = "En revision";
                                          String treatment = "En revision";
                                          String date =
                                              controllerAppointment.text;
                                          Appointment request = Appointment(
                                              id: 1,
                                              meetUrl: meetUrl,
                                              motive: motive,
                                              personalHistory: personalHistory,
                                              testRealized: testRealized,
                                              treatment: treatment,
                                              scheduleDate: date,
                                              patientId: patientId,
                                              nutritionistId:
                                                  nutritionists[index].id);
                                          controller.makePayment(
                                              amount: '50', currency: 'PEN');
                                          await httpHelper.createAppointment(
                                              request,
                                              patientId,
                                              nutritionists[index].id);
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ));
                        },
                      ),
                    ],
                  )
                ]),
              );
            }));
  }
}
