import 'package:flutter/material.dart';
import 'package:psychohelp_app/pages/authentication/login.dart';
import 'package:psychohelp_app/pages/authentication/register.dart';
import 'package:psychohelp_app/pages/authentication/registerPatient.dart';
import 'package:psychohelp_app/pages/authentication/registerNutritionist.dart';
import 'package:psychohelp_app/pages/patient/appointments.dart';
import 'package:psychohelp_app/pages/patient/dating_dates_patient.dart';
import 'package:psychohelp_app/pages/patient/home_patient.dart';
import 'package:psychohelp_app/pages/patient/logbook_patient.dart';
import 'package:psychohelp_app/pages/patient/list_nutritionist.dart';
import 'package:psychohelp_app/pages/patient/profile_patient.dart';
import 'pages/nutritionist/home_nutritionist.dart';
import 'pages/nutritionist/dating_dates.dart';
import 'pages/nutritionist/list_patients.dart';
import 'pages/nutritionist/logbook_nutritionist.dart';
import 'pages/nutritionist/my_publications.dart';
import 'pages/nutritionist/profile_nutritionist.dart';
import 'package:psychohelp_app/pages/videocall/call.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51JxFdHE3DueU8pu3V9DMyx0VUOZEFxUGMEjGqsPakEilVuRQQ8FH8wYUb8Valy6DQr4ykdCXhZnuAvLM7UFJZmGt00g9v8mDwj';
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: new Login(),
      routes: <String, WidgetBuilder>{
        Home_patient.routeName: (BuildContext context) => new Home_patient(),
        HomeNutritionist.routeName: (BuildContext context) => new HomeNutritionist(),
        Dating_dates.routeName: (BuildContext context) => new Dating_dates(),
        Dating_dates_patient.routeName: (BuildContext context) =>
            new Dating_dates_patient(),
        List_patients.routeName: (BuildContext context) => new List_patients(),
        ListNutritionist.routeName: (BuildContext context) => new ListNutritionist(),
        Appointments.routeName: (BuildContext context) => new Appointments(),
        Profile_patient.routeName: (BuildContext context) =>
            new Profile_patient(),
        ProfileNutritionist.routeName: (BuildContext context) =>
            new ProfileNutritionist(),
        LogbookNutritionist.routeName: (BuildContext context) =>
            new LogbookNutritionist(),
        Logbook_patient.routeName: (BuildContext context) =>
            new Logbook_patient(),
        My_publications.routeName: (BuildContext context) =>
            new My_publications(),
        Login.routeName: (BuildContext context) => new Login(),
        Register.routeName: (BuildContext context) => new Register(),
        RegisterPatient.routeName: (BuildContext context) =>
            new RegisterPatient(),
        RegisterNutritionist.routeName: (BuildContext context) =>
            new RegisterNutritionist(),
        Call.routeName: (BuildContext context) => new Call(),
      }));
}
