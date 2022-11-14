import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/pages/authentication/register.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:psychohelp_app/pages/patient/home_patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/patient.dart';
import '../../utils/http_helper.dart';
import '../nutritionist/home_nutritionist.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = "/login";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  HttpHelper httpHelper = HttpHelper();

  final myEmail = TextEditingController();
  final myPassword = TextEditingController();

  late bool _passwordVisible;

  //Nutritionist login credentials
  @override
  void initState() {
    _passwordVisible = false;
    myEmail.text = "";
    myPassword.text = "";
    super.initState();
  }

  //Patient login credentials
  // @override
  // void initState() {
  //   _passwordVisible = false;
  //   myEmail.text = "santi@gmail.com";
  //   myPassword.text = "jpe12346";
  //   super.initState();
  // }

  Future<Patient?> getPatientByEmail(email) async {
    var patient = await httpHelper.fetchByPatientEmail(email);
    return patient;
  }

  Future<Nutritionist?> getNutritionistByEmail(email) async {
    var nutritionist = await httpHelper.fetchByNutritionistEmail(email);
    return nutritionist;
  }

  void generalLogin(String email, String password) async {
    try {
      Patient? patient = await getPatientByEmail(email);
      if (patient != null) {
        if (patient.password == password) {
          savePatientData(patient.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home_patient(),
              ));
        }
      }
    } catch (e) {
      print(e);
      print("Error al logear el paciente");
    }

    try {
      Nutritionist? nutritionist = await getNutritionistByEmail(email);
      if (nutritionist != null) {
        saveNutritionistData(nutritionist.id);
        if (nutritionist.password == password) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeNutritionist(),
            ),
          );
        }
      }
    } catch (e) {
      print("Error al logear el nutricionista");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color.fromRGBO(137, 197, 204, 10),
      ),
      Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.795,
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                        imageUrl:
                            "https://terapiaapsicologica.com/wp-content/uploads/2020/12/Psychologist-bro.png",
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.33),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text('Nutrix',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text('Ingresa tu correo y contraseña',
                          style: TextStyle(fontSize: 14, height: 0.5)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.only(bottom: 12.0),
                      child: TextField(
                        controller: myEmail,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          isDense: true,
                          border: OutlineInputBorder(),
                          labelText: 'Correo Electrónico',
                          hintText: 'Ingresa tu correo electrónico',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        controller: myPassword,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          isDense: true,
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                          hintText: 'Ingresa tu contraseña',
                          suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ElevatedButton(
                      child: Text('Iniciar sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      onPressed: () =>
                          generalLogin(myEmail.text, myPassword.text),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('No tiene una cuenta?'),
                        TextButton(
                          child: Text('Registrese aquí'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ))),
    ]));
  }

  Future<void> savePatientData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Patient patient = await httpHelper.fetchPatientById(id);
    String user = jsonEncode(patient);
    print(user);
    prefs.setString('patient', user);
    await prefs.setInt('id', id);
  }

  Future<void> saveNutritionistData(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Nutritionist nutritionist = await httpHelper.fetchNutritionistById(id);
    String user = jsonEncode(nutritionist);
    prefs.setString('nutritionist', user);
    await prefs.setInt('id', id);
  }
}
