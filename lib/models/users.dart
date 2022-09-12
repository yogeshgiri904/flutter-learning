// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.firstName,
    this.email,
    this.lastName,
    this.mobile,
    this.dob,
    this.aadhaar,
    this.state,
    this.city,
    this.landmark,
    this.fatherName,
    this.motherName,
    required this.organizations,
  });

  String? firstName;
  String? email;
  dynamic lastName;
  String? mobile;
  dynamic dob;
  dynamic aadhaar;
  dynamic state;
  dynamic city;
  dynamic landmark;
  dynamic fatherName;
  dynamic motherName;
  List<Organization> organizations;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        email: json["email"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        dob: json["dob"],
        aadhaar: json["aadhaar"],
        state: json["state"],
        city: json["city"],
        landmark: json["landmark"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        organizations: List<Organization>.from(
            json["organizations"].map((x) => Organization.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "email": email,
        "last_name": lastName,
        "mobile": mobile,
        "dob": dob,
        "aadhaar": aadhaar,
        "state": state,
        "city": city,
        "landmark": landmark,
        "father_name": fatherName,
        "mother_name": motherName,
        "organizations":
            List<dynamic>.from(organizations.map((x) => x.toJson())),
      };
}

class Organization {
  Organization({
    this.id,
    this.name,
    required this.createdOn,
    this.logo,
    this.gstin,
    this.pan,
    this.city,
    this.landmark,
    this.state,
  });

  int? id;
  String? name;
  DateTime createdOn;
  dynamic logo;
  String? gstin;
  String? pan;
  String? city;
  String? landmark;
  String? state;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"],
        name: json["name"],
        createdOn: DateTime.parse(json["created_on"]),
        logo: json["logo"],
        gstin: json["gstin"],
        pan: json["pan"],
        city: json["city"],
        landmark: json["landmark"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_on": createdOn.toIso8601String(),
        "logo": logo,
        "gstin": gstin,
        "pan": pan,
        "city": city,
        "landmark": landmark,
        "state": state,
      };
}
