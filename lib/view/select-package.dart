import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_buddy/controller/package-controller.dart';
import 'package:health_buddy/model/doctor-appointment-model.dart';
import 'package:health_buddy/model/package-model.dart';
import 'package:health_buddy/view/review-summary.dart';

import '../utility/page-button.dart';

class SelectPackage extends StatefulWidget {
  final DoctorAppointmentModel doctor;
  const SelectPackage({required this.doctor, super.key});

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

enum PackageValue { messaging, voiceCall, videoCall, inPerson }

class _SelectPackageState extends State<SelectPackage> {
  PackageValue radioValue = PackageValue.messaging;
  PackageModel package = PackageModel();
  List<String> dropdownList = [];
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 120,
                title: const Text(
                  'Select Package',
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
                future: PackageController().getPackage(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        child: Text('Error while fetching data'),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    print("🍄🍄🍄");
                    package = snapshot.data!;

                    dropdownList = package.duration as List<String>;
                    print("🍄");
                    print(package.package);
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Select Duration',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0) //
                                        ),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child:
                                      //TODO: Change here
                                      // DropdownButton<String>(
                                      //   value: dropdownValue,
                                      //   icon: const Icon(Icons.arrow_downward),
                                      //   elevation: 16,
                                      //   style: const TextStyle(
                                      //       color: Colors.deepPurple),
                                      //   underline: Container(
                                      //     height: 2,
                                      //     color: Colors.deepPurpleAccent,
                                      //   ),
                                      //   onChanged: (String? value) {
                                      //     // This is called when the user selects an item.
                                      //     setState(() {
                                      //       dropdownValue = value!;
                                      //     });
                                      //   },
                                      //   items: dropdownList.map((String items) {
                                      //     return DropdownMenuItem(
                                      //       value: items,
                                      //       child: Text(items),
                                      //     );
                                      //   }).toList(),
                                      //
                                      //   // dropdownList
                                      //   //     .map<DropdownMenuItem<String>>(
                                      //   //         (String value) {
                                      //   //   return DropdownMenuItem<String>(
                                      //   //     value: value,
                                      //   //     child: Text(value),
                                      //   //   );
                                      //   // }).toList(),
                                      // ),
                                      Row(
                                    children: [
                                      const Icon(
                                        Icons.watch_later,
                                        color: CupertinoColors.activeBlue,
                                      ),
                                      const Text(
                                        "  30 miniutes",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: CupertinoColors.activeBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  'Select Package',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                package.package!.contains("Messaging")
                                    ? packageRadio(
                                        Icons.comment,
                                        "Messaging",
                                        "Chat with Doctor",
                                        PackageValue.messaging)
                                    : const SizedBox(),
                                package.package!.contains("Messaging")
                                    ? packageRadio(
                                        Icons.call,
                                        "Voice Call",
                                        "Call with Doctor",
                                        PackageValue.voiceCall)
                                    : const SizedBox(),
                                package.package!.contains("Messaging")
                                    ? packageRadio(
                                        Icons.video_camera_front,
                                        "Video Call",
                                        "Video call with Doctor",
                                        PackageValue.videoCall)
                                    : const SizedBox(),
                                package.package!.contains("Messaging")
                                    ? packageRadio(
                                        Icons.person,
                                        "In Person",
                                        "In Person visit with Doctor",
                                        PackageValue.inPerson)
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          PageButton(
                            buttonTitle: 'Next',
                            callback: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ReviewSummary(
                                        doctor: widget.doctor,
                                        date: 'August 24, 2023',
                                        time: '10:00 AM',
                                        packageType: 'Messaging',
                                        duration: '30 minutes',
                                      )));
                            },
                          )
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }

  Container packageRadio(
      IconData icon, packageName, packageDescription, packageVal) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0) //
            ),
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xffdbeaff),
            child: Icon(icon, color: CupertinoColors.activeBlue, size: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$packageName",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$packageDescription",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Spacer(),
          Radio<PackageValue>(
            value: packageVal,
            groupValue: radioValue,
            onChanged: (PackageValue? value) {
              setState(() {
                radioValue = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
