import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_buddy/controller/confirmation_controller.dart';
import 'package:health_buddy/model/confirmation-model.dart';
import 'package:health_buddy/view/bookings.dart';
import 'package:health_buddy/view/dashboard.dart';

import '../utility/page-button.dart';

class AppointmentConfirmation extends StatefulWidget {
  const AppointmentConfirmation({super.key});

  @override
  State<AppointmentConfirmation> createState() =>
      _AppointmentConfirmationState();
}

class _AppointmentConfirmationState extends State<AppointmentConfirmation> {
  ConfirmationModel confirmation = ConfirmationModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 120,
            title: const Text(
              'Confirmation',
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
            future: ConfirmationController().getPackage(),
            builder: (BuildContext context,
                AsyncSnapshot<ConfirmationModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    child: Text('Error while fetching data'),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                confirmation = snapshot.data!;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: CupertinoColors.activeBlue,
                            radius: 55,
                            child: Icon(
                              Icons.check,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Appointment confirmed!',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'You have successfully booked appointment with',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            confirmation.doctorName ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          iconText('Esther Howard', Icons.person),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                iconText(confirmation.appointmentDate,
                                    Icons.calendar_month),
                                iconText(confirmation.appointmentTime,
                                    Icons.timer_rounded),
                                const SizedBox(width: 10),
                              ]),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.only(
                          top: 15, left: 50, right: 50, bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Bookings()));
                            },
                            child: Container(
                              width: 300,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: CupertinoColors.activeBlue,
                                border:
                                    Border.all(width: 1.0, color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        50.0) //                 <--- border radius here
                                    ),
                              ),
                              child: const Text(
                                'View Appointements',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Dashboard()));
                            },
                            child: const Text(
                              'Book Another',
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  Row iconText(title, icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: CupertinoColors.activeBlue,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
