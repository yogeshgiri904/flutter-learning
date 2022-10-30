class User {
  late String firstName;
  late String email;
  late String lastName;
  late String mobile;
  String? dob;
  String? aadhaar;
  String? state;
  String? city;
  String? landmark;
  String? fatherName;
  String? motherName;

  User(
      {required this.firstName,
      required this.email,
      required this.lastName,
      required this.mobile,
      this.dob,
      this.aadhaar,
      this.state,
      this.city,
      this.landmark,
      this.fatherName,
      this.motherName});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    email = json['email'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    dob = json['dob'];
    aadhaar = json['aadhaar'];
    state = json['state'];
    city = json['city'];
    landmark = json['landmark'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['dob'] = this.dob;
    data['aadhaar'] = this.aadhaar;
    data['state'] = this.state;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    return data;
  }
}
