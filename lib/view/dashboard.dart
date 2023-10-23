import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_buddy/controller/appointment-contorller.dart';
import 'package:health_buddy/model/doctor-appointment-model.dart';
import 'package:health_buddy/view/book-appointments.dart';

import '../utility/doctor-details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<DoctorAppointmentModel> doctorAppointment = [];

  @override
  Widget build(BuildContext context) {
    doctorAppointment = [];
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 120,
                title: const Text(
                  'Available Doctors',
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
            body: FutureBuilder(
                future: AppointmentController().getAppointmentSlots(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<DoctorAppointmentModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        child: Text('Error while fetching data'),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    print("🌕");
                    print(snapshot);
                    doctorAppointment = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: doctorAppointment.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BookAppointment(
                                        doctor: doctorAppointment[index],
                                      )));
                            },
                            child: Card(
                              child: DoctorDetails(
                                doctor: doctorAppointment[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }
}
