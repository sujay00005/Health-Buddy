class BookingModel {
  String? bookingId;
  String? doctorName;
  String? location;
  String? appointmentDate;
  String? appointmentTime;

  BookingModel(
      {this.bookingId,
      this.doctorName,
      this.location,
      this.appointmentDate,
      this.appointmentTime});

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
        bookingId: json['booking_id'] != null ? json['booking_id'] : null,
        doctorName: json['doctor_name'] != null ? json['doctor_name'] : null,
        location: json['location'] != null ? json['location'] : null,
        appointmentDate:
            json['appointment_date'] != null ? json['appointment_date'] : null,
        appointmentTime:
            json['appointment_time'] != null ? json['appointment_time'] : null);
  }
}
