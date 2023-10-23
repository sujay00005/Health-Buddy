import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_buddy/model/doctor-appointment-model.dart';
import 'package:health_buddy/view/select-package.dart';

import '../utility/avatar-description.dart';
import '../utility/date-capsule.dart';
import '../utility/doctor-details.dart';
import '../utility/page-button.dart';
import '../utility/time-capsule.dart';

class BookAppointment extends StatefulWidget {
  final DoctorAppointmentModel doctor;
  const BookAppointment({
    super.key,
    required this.doctor,
  });

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 120,
            title: const Text(
              'Book Appointment',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorDetails(
                doctor: widget.doctor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    AvatarDescription(
                      title: 'Patients',
                      amount: widget.doctor.patientsServed.toString(),
                      icon: Icons.people_rounded,
                    ),
                    AvatarDescription(
                      title: 'Years Exp.',
                      amount: widget.doctor.yearsOfExperience.toString(),
                      icon: Icons.work_outlined,
                    ),
                    AvatarDescription(
                      title: 'Rating',
                      amount: widget.doctor.rating.toString(),
                      icon: Icons.star,
                    ),
                    AvatarDescription(
                      title: 'Reviews',
                      amount: widget.doctor.rating.toString(),
                      icon: Icons.chat,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'BOOK APPOINTMENT',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            DateCapsule(
                              day: 'Today',
                              date: '4',
                              month: 'Oct',
                              isActive: true,
                            ),
                            SizedBox(width: 7),
                            DateCapsule(
                              day: 'Mon',
                              date: '5',
                              month: 'Oct',
                              isActive: false,
                            ),
                            SizedBox(width: 7),
                            DateCapsule(
                              day: 'Tue',
                              date: '6',
                              month: 'Oct',
                              isActive: false,
                            ),
                            SizedBox(width: 7),
                            DateCapsule(
                              day: 'Wed',
                              date: '7',
                              month: 'Oct',
                              isActive: false,
                            )
                          ],
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TimeCapsule(
                                time: "7:00", isAM: false, isActive: true),
                            SizedBox(width: 7),
                            TimeCapsule(
                                time: "7:30", isAM: false, isActive: false),
                            SizedBox(width: 7),
                            TimeCapsule(
                                time: "8:00", isAM: false, isActive: false),
                            SizedBox(width: 7),
                            TimeCapsule(
                                time: "8:30", isAM: false, isActive: false),
                            SizedBox(width: 7),
                          ],
                        ))
                  ],
                ),
              ),
              PageButton(
                buttonTitle: 'Make Appointment',
                callback: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SelectPackage(doctor: widget.doctor)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
