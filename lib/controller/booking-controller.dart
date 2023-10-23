import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:health_buddy/model/booking-model.dart';

class BookingController {
  Future<List<BookingModel>> getBookings() async {
    String url =
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointments";

    var response = await http.get(
      Uri.parse(url),
    );

    final jsonResponse = jsonDecode(response.body) as List;

    List<BookingModel> bookings = [];

    for (final data in jsonResponse) {
      final book = BookingModel.fromJson(data);
      bookings.add(book);
    }

    print("❄️");
    print(bookings[0].doctorName);
    return bookings;
  }
}
