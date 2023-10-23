class DoctorAppointmentModel {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  List<Map<String, List<String>>>? availability;

  DoctorAppointmentModel({
    this.doctorName,
    this.image,
    this.speciality,
    this.location,
    this.patientsServed,
    this.yearsOfExperience,
    this.rating,
    this.numberOfReviews,
    this.availability,
  });

  factory DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
//     List<Map<String, List<String>>> data = [];
//     Map<String, List<String>> jsonData = json['availability'];
//
//     if (json['availability'] != null) {
//       jsonData.forEach((i, value) {
// //     print('index=$i, value=$value');
//         data.add({i: value});
//       });
//     }
//     print(data[0].keys);
//     print(data[0].values.length);

    return DoctorAppointmentModel(
      doctorName: json['doctor_name'] != null ? json['doctor_name'] : null,
      image: json['image'] != null ? json['image'] : null,
      speciality: json['speciality'] != null ? json['speciality'] : null,
      location: json['location'] != null ? json['location'] : null,
      patientsServed: json['patients_served'] != null
          ? json['patients_served'].toInt()
          : null,
      yearsOfExperience: json['years_of_experience'] != null
          ? json['years_of_experience'].toInt()
          : null,
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
      numberOfReviews: json['number_of_reviews'] != null
          ? json['number_of_reviews'].toInt()
          : null,
      // availability: data,
    );
  }
}
