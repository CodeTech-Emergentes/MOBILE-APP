import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:psychohelp_app/pages/authentication/login.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterNutritionist extends StatefulWidget {
  static const String routeName = "/nutritionistRegister";

  @override
  State<RegisterNutritionist> createState() => _RegisterNutritionistState();
}

class _RegisterNutritionistState extends State<RegisterNutritionist> {
  HttpHelper httpHelper = HttpHelper();
  DateTime selectedDate = DateTime.now();

  final List<String> genderItems = [
    'Male',
    'Female',
    'Other',
  ];

  String selectedGenderValue = "-";
  String selectedSessionValue = "-";

  late bool _passwordVisible;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDNI = TextEditingController();
  var controllerBirthday = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerSpecialization =
      TextEditingController();
  final TextEditingController controllerFormation = TextEditingController();
  final TextEditingController controllerAbout = TextEditingController();
  final TextEditingController controllerImg = TextEditingController();
  final TextEditingController controllerCMP = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    httpHelper = HttpHelper();
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
        print(selectedDate);
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
    if (controllerName.text == "" ||
        controllerDNI.text == "" ||
        controllerPhone.text == "" ||
        controllerSpecialization.text == "" ||
        controllerFormation.text == "" ||
        controllerBirthday.text == "" ||
        controllerAbout.text == "" ||
        controllerCMP.text == "") {
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
          "Registro de Nutricionista",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
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
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Registro nutricionista',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 13),
                              labelText: 'Full name',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerPassword,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              isDense: true,
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter your password',
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
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerDNI,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'DNI',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerBirthday,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              border: OutlineInputBorder(),
                              labelText: 'Birthday',
                              hintText: 'Enter your birthday',
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
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerPhone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'Phone',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              labelText: 'Gender',
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Gender',
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 48,
                            buttonPadding:
                                const EdgeInsets.only(left: 2, right: 0),
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
                                selectedGenderValue = value.toString();
                              });
                            },
                            onSaved: (value) {},
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerSpecialization,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'Specialization',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerFormation,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'Formation',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerCMP,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'CMP',
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextField(
                            controller: controllerAbout,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              labelText: 'About',
                            ),
                          ),
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
                              String name = controllerName.text;
                              String dni = controllerDNI.text;
                              String birthday = controllerBirthday.text;
                              String email = controllerEmail.text;
                              String password = controllerPassword.text;
                              String phone = controllerPhone.text;
                              String specialization =
                                  controllerSpecialization.text;
                              String formation = controllerFormation.text;
                              String about = controllerAbout.text;
                              String gender = selectedGenderValue;
                              String sessionType = selectedSessionValue;
                              String img = "img";
                              String cmp = controllerCMP.text;
                              bool active = true;
                              bool fresh = true;

                              await httpHelper.createNutritionist(
                                1,
                                name,
                                dni,
                                birthday,
                                email,
                                password,
                                phone,
                                specialization,
                                formation,
                                about,
                                gender,
                                sessionType,
                                img,
                                cmp,
                                active,
                                fresh,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
