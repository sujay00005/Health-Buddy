import 'dart:convert';

import 'package:health_buddy/model/confirmation-model.dart';

import 'package:http/http.dart' as http;

class ConfirmationController {
  Future<ConfirmationModel> getPackage() async {
    String url =
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/booking_confirmation";

    var response = await http.get(
      Uri.parse(url),
    );

    final jsonResponse = jsonDecode(response.body);

    print("💐");
    print(jsonResponse);

    ConfirmationModel confirmation = ConfirmationModel.fromJson(jsonResponse);
    print(confirmation.doctorName);

    return confirmation;
  }
}
