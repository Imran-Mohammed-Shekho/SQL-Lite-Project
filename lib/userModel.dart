class Usermodel {
  final int id;
  final String name;
  final String? phone;
  final String? imagePath;

  Usermodel({
    required this.id,
    required this.name,
    required this.phone,
    required this.imagePath,
  });

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      imagePath: json["image"],
    );
  }
}
