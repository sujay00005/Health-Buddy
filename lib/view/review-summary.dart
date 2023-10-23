import 'package:flutter/material.dart';
import 'package:health_buddy/model/doctor-appointment-model.dart';
import 'package:health_buddy/utility/page-button.dart';
import 'package:health_buddy/view/appointment-confirmation.dart';

import '../utility/doctor-details.dart';

class ReviewSummary extends StatefulWidget {
  final DoctorAppointmentModel doctor;
  final String date;
  final String time;
  final String packageType;
  final String duration;
  const ReviewSummary(
      {required this.doctor,
      required this.date,
      required this.time,
      required this.packageType,
      required this.duration,
      super.key});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 120,
            title: const Text(
              'Review Summary',
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                radius: 15,
                child: BackButton(),
              ),
            )),
        body: Column(
          children: [
            DoctorDetails(doctor: widget.doctor),
            textDetail('Date & Hour', '${widget.date} | ${widget.time}'),
            textDetail('Package', widget.packageType),
            textDetail('Duration', widget.duration),
            textDetail('Booking for', 'Self'),
            const Spacer(),
            PageButton(
                buttonTitle: 'Confirm',
                callback: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentConfirmation()));
                })
          ],
        ),
      ),
    );
  }

  Padding textDetail(String about, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            about,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(date),
        ],
      ),
    );
  }
}
