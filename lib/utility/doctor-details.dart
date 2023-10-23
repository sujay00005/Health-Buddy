import 'package:flutter/material.dart';
import 'package:health_buddy/model/doctor-appointment-model.dart';

class DoctorDetails extends StatelessWidget {
  final DoctorAppointmentModel doctor;
  const DoctorDetails({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(doctor.image!),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      doctor.doctorName!,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctor.speciality!,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(
                          width: 150,
                          child: Text(
                            '${doctor.location}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Icon(Icons.map, color: Colors.blue),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
