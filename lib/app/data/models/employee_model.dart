class Employee {
  String? id;
  String? name;
  String? subname;
  String? dateBirth;
  String? gender;
  String? email;
  String? phone;
  int? note;
  List<String>? imageUrls;

  Employee(
      {this.id,
      this.name,
      this.subname,
      this.dateBirth,
      this.gender,
      this.email,
      this.phone,
      this.note,
      this.imageUrls});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subname = json['subname'];
    dateBirth = json['date_birth'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    note = json['note'];
    imageUrls = json['image_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['subname'] = subname;
    data['date_birth'] = dateBirth;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['note'] = note;
    data['image_urls'] = imageUrls;
    return data;
  }
}
