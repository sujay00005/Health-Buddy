import 'dart:convert';

import 'package:health_buddy/model/doctor-appointment-model.dart';
import 'package:http/http.dart' as http;

class AppointmentController {
  Future<List<DoctorAppointmentModel>> getAppointmentSlots() async {
    String url =
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors";

    var response = await http.get(
      Uri.parse(url),
    );

    final jsonResponse = jsonDecode(response.body) as List;
    List<DoctorAppointmentModel> doctorSlot = [];

    for (final data in jsonResponse) {
      final slot = DoctorAppointmentModel.fromJson(data);

      doctorSlot.add(slot);
    }

    return doctorSlot;
  }
}
