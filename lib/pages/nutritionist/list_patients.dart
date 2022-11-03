import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:psychohelp_app/models/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class List_patients extends StatefulWidget {
  static const String routeName = "/list_patients";
  @override
  State<List_patients> createState() => _List_patientsState();
}

class _List_patientsState extends State<List_patients> {
  List patients = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    patients = [];
    httpHelper = HttpHelper();
    fetchPatients();
    super.initState();
  }

  Future fetchPatients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    patients =
        await httpHelper.fetchPatientsByNutritionistId(prefs.getInt('id')!);
    return patients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Patients list"),
      ),
      body: new Container(
        child: FutureBuilder(
          future: fetchPatients(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return PatientRow(patient: patients[index]);
                },
              );
            } else {
              return Center(
                child: Text("No existen pacientes listados",
                    style: TextStyle(color: Colors.red, fontSize: 20)),
              );
            }
          },
        ),
      ),
    );
  }
}

class PatientRow extends StatelessWidget {
  final Patient patient;
  const PatientRow({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin:
            EdgeInsetsDirectional.only(top: 20, bottom: 15, start: 75, end: 75),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/logbook_nutritionist",
                arguments: patient);
          },
          child: Column(children: <Widget>[
            if (patient.gender == "Male" && patient.img == "img") ...[
              Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 30, end: 30),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png",
                    fit: BoxFit.fill,
                    placeholder: (_, __) =>
                        Center(child: CircularProgressIndicator()),
                  ))
            ] else if (patient.gender == "Other" && patient.img == "img") ...[
              Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 30, end: 30),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn1.iconfinder.com/data/icons/user-pictures/100/unknown-512.png",
                    fit: BoxFit.fill,
                    placeholder: (_, __) =>
                        Center(child: CircularProgressIndicator()),
                  ))
            ] else if (patient.gender == "Female" && patient.img == "img") ...[
              Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 10, bottom: 10, start: 30, end: 30),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgp-e7MKZn4WU0yEmVMsfLKj9IJk4XH_OP8ylE0G202a7R4R_-T24gHBFVs3dX0I25y_w&usqp=CAU",
                    fit: BoxFit.fill,
                    placeholder: (_, __) =>
                        Center(child: CircularProgressIndicator()),
                  ))
            ] else if (patient.img != "img") ...[
              CircleAvatar(
                backgroundImage: NetworkImage(patient.img),
                radius: 75.0,
              ),
            ],
            Text(patient.firstName),
            Text(patient.lastName),
          ]),
        ));
  }
}
