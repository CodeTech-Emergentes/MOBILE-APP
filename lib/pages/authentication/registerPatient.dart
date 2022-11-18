import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psychohelp_app/pages/authentication/login.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPatient extends StatefulWidget {
  static const String routeName = "/patientRegister";

  @override
  State<RegisterPatient> createState() => _RegisterPatientState();
}

class _RegisterPatientState extends State<RegisterPatient> {
  HttpHelper httpHelper = HttpHelper();
  DateTime selectedDate = DateTime.now();

  final List<String> genderItems = [
    'Masculino',
    'Femenino',
    'Otro',
  ];

  String selectedValue = "TestString";

  final TextEditingController controllerFirtsName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  var controllerBirthday = TextEditingController();
  final TextEditingController controllerImg = TextEditingController();

  late bool _passwordVisible;

  @override
  void initState() {
    httpHelper = HttpHelper();
    _passwordVisible = false;
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controllerBirthday.text = selectedDate.toString().substring(0, 10);
      });
    }
  }

  bool validate() {
    if (controllerPassword.text.length < 8) {
      Fluttertoast.showToast(
          msg: "La contraseña debe tener 8 o más caracteres",
          toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    if (!controllerEmail.text.contains("@")) {
      Fluttertoast.showToast(
          msg: "Correo Electrónico invalido", toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    if (controllerFirtsName.text == "" ||
        controllerLastName.text == "" ||
        controllerPhone.text == "" ||
        controllerBirthday.text == "") {
      Fluttertoast.showToast(
          msg: "Llene todos los campos solicitados",
          toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: new Text(
            "Registro de Paciente",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(children: [
          Container(
            color: Color.fromRGBO(137, 197, 204, 10),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width / 1.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              width: MediaQuery.of(context).size.width,
              child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Registro paciente',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: controllerFirtsName,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            border: OutlineInputBorder(),
                            labelText: 'Nombres',
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: controllerLastName,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            border: OutlineInputBorder(),
                            labelText: 'Apellidos',
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            border: OutlineInputBorder(),
                            labelText: 'Correo Electrónico',
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: controllerPassword,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            hintText: 'Ingrese su contraseña',
                            suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 20,
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
                        SizedBox(height: 16),
                        TextField(
                          controller: controllerBirthday,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            border: OutlineInputBorder(),
                            labelText: 'Fecha de Nacimiento',
                            hintText: 'Ingrese su fecha de nacimiento',
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
                        SizedBox(height: 16),
                        TextField(
                          controller: controllerPhone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 10),
                            border: OutlineInputBorder(),
                            labelText: 'Teléfono',
                          ),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Género',
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 48,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          items: genderItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                            setState(() {
                              selectedValue = value.toString();
                            });
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          child: Text('Registrarme',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                          onPressed: () async {
                            if (validate()) {
                              String firstName = controllerFirtsName.text;
                              String lastName = controllerLastName.text;
                              String email = controllerEmail.text;
                              String password = controllerPassword.text;
                              String date = controllerBirthday.text;
                              String phone = controllerPhone.text;
                              String gender = selectedValue;
                              String img = "img";
                              await httpHelper.createPatient(
                                1,
                                firstName,
                                lastName,
                                email,
                                password,
                                date,
                                phone,
                                gender,
                                img,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            }
                          },
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}
