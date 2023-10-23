import 'package:flutter/material.dart';
import 'package:health_buddy/view/appointment-confirmation.dart';
import 'package:health_buddy/view/book-appointments.dart';
import 'package:health_buddy/view/bookings.dart';
import 'package:health_buddy/view/dashboard.dart';
import 'package:health_buddy/view/review-summary.dart';
import 'package:health_buddy/view/select-package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Dashboard()
        //Bookings(),
        //AppointmentConfirmation(),
        //ReviewSummary(),
        //SelectPackage(),
        // BookAppointment(),
        );
  }
}
