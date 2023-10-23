import 'dart:convert';

import '../model/package-model.dart';
import 'package:http/http.dart' as http;

class PackageController {
  Future<PackageModel> getPackage() async {
    String url =
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options";

    var response = await http.get(
      Uri.parse(url),
    );

    final jsonResponse = jsonDecode(response.body);

    PackageModel package = PackageModel.fromJson(jsonResponse);

    return package;
  }
}
