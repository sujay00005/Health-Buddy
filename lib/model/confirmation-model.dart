class ConfirmationModel {
  String? doctorName;
  String? appointmentDate;
  String? appointmentTime;
  String? location;
  String? appointmentPackage;

  ConfirmationModel(
      {this.doctorName,
      this.appointmentDate,
      this.appointmentTime,
      this.location,
      this.appointmentPackage});

  factory ConfirmationModel.fromJson(Map<String, dynamic> json) {
    return ConfirmationModel(
      doctorName: json['doctor_name'] != null ? json['doctor_name'] : "",
      appointmentDate:
          json['appointment_date'] != null ? json['appointment_date'] : "",
      appointmentTime:
          json['appointment_time'] != null ? json['appointment_time'] : "",
      location: json['location'] != null ? json['location'] : "",
      appointmentPackage: json['appointment_package'] != null
          ? json['appointment_package']
          : "",
    );
  }
}
