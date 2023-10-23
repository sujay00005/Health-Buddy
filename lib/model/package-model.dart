class PackageModel {
  List<String>? duration;
  List<String>? package;

  PackageModel({
    this.duration,
    this.package,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      duration: json['duration'].cast<String>(),
      package: json['package'].cast<String>(),
    );
  }
}
