import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/nutritionist.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditedNutritionistProfile extends StatefulWidget {
  const EditedNutritionistProfile(this.nutritionist);
  final Nutritionist nutritionist;

  @override
  State<EditedNutritionistProfile> createState() =>
      _EditedNutritionistProfileState();
}

class _EditedNutritionistProfileState extends State<EditedNutritionistProfile> {
  HttpHelper httpHelper = HttpHelper();
  Nutritionist? nutritionist;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerBirthday = TextEditingController();
  final TextEditingController controllerGender = TextEditingController();
  final TextEditingController controllerSpecialization =
      TextEditingController();
  final TextEditingController controllerFormation = TextEditingController();
  final TextEditingController controllerCMP = TextEditingController();
  final TextEditingController controllerSessionType = TextEditingController();
  final TextEditingController controllerAbout = TextEditingController();
  final TextEditingController controllerImg = TextEditingController();

  DateTime selectedDate = DateTime.now();
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
    } //current selected date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: getBody(),
    );
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    controllerName.text = widget.nutritionist.name;
    controllerEmail.text = widget.nutritionist.email;
    controllerPhone.text = widget.nutritionist.phone;
    controllerBirthday.text = widget.nutritionist.birthday.substring(0, 10);
    //controllerGender.text = widget.nutritionist.gender;
    controllerSpecialization.text = widget.nutritionist.specialization;
    controllerFormation.text = widget.nutritionist.formation;
    controllerCMP.text = widget.nutritionist.cmp;
    controllerSessionType.text = widget.nutritionist.sessionType;
    controllerAbout.text = widget.nutritionist.about;
    controllerImg.text = widget.nutritionist.img;
    super.initState();
  }

  Future<void> updateNutritionistData(Nutritionist nutritionist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = jsonEncode(nutritionist);
    prefs.setString('nutritionist', user);
  }

  Widget getBody() {
    return new ListView(
      controller: ScrollController(),
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        SizedBox(height: 16),
        TextField(
          controller: controllerName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nombre',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerPhone,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Telefono',
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextField(
            readOnly: true,
            controller: controllerBirthday,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 13, vertical: 10),
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
        ),
        SizedBox(height: 16),
        /*TextField(
          controller: controllerGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Gender',
          ),
        ),
        SizedBox(height: 16),*/
        TextField(
          controller: controllerSpecialization,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Especialidad',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerFormation,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Formación',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerCMP,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CMP',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerSessionType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tipo de Cita',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerAbout,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Acerca',
          ),
        ),
        SizedBox(height: 16),
        TextField(
          controller: controllerImg,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Photo URl',
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () async {
            String name = controllerName.text;
            String email = controllerEmail.text;
            String phone = controllerPhone.text;
            String birthday = controllerBirthday.text;
            //String gender = controllerGender.text;
            String specialization = controllerSpecialization.text;
            String formation = controllerFormation.text;
            String cmp = controllerCMP.text;
            String sessionType = controllerSessionType.text;
            String about = controllerAbout.text;
            String img = controllerImg.text;

            Nutritionist nutritionistInfo = Nutritionist(
                id: widget.nutritionist.id,
                name: name,
                dni: widget.nutritionist.dni,
                birthday: birthday,
                email: email,
                password: widget.nutritionist.password,
                phone: phone,
                specialization: specialization,
                formation: formation,
                about: about,
                gender: widget.nutritionist.gender,
                sessionType: sessionType,
                img: img,
                cmp: cmp,
                active: widget.nutritionist.active,
                fresh: widget.nutritionist.fresh);
            await httpHelper.updateNutritionist(
                widget.nutritionist.id, nutritionistInfo);
            updateNutritionistData(nutritionistInfo);
            Navigator.pop(context, nutritionistInfo);
          },
        ),
      ],
    );
  }
}
