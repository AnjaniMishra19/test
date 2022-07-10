class TableList {
  String id;
  String sk;
  String fullName;
  String first;
  String last;
  String designation;
  String gender;
  String address;
  String city;
  String state;
  String zip;
  String type;
  String email;
  String website;
  String description;
  String hours;
  String phone;
  bool hasappointment;
  String holidays;
  String firstName;
  String lastName;

  TableList({
    this.sk,
    this.fullName,
    this.first,
    this.last,
    this.designation,
    this.gender,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.type,
    this.email,
    this.website,
    this.description,
    this.hours,
    this.phone,
    this.firstName,
    this.lastName,
    this.id,
    this.hasappointment,
    this.holidays,
  });

  factory TableList.fromJson(Map<String, dynamic> json) {
    return TableList(
        sk: json['sk'] as String,
        fullName: json['data'] as String,
        first: json['first'] as String,
        last: json['last'] as String,
        designation: json['sal'] as String,
        gender: json['gender'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        state: json['state'] as String,
        zip: json['zip'] as String,
        type: json['type'] as String,
        email: json['email'] as String,
        website: json['website'] as String,
        description: json['description'] as String,
        hours: json['hours'] as String,
        phone: json['phone'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        id: json['pk'] as String,
        hasappointment: json['hasappt'] as bool,
        holidays: json['holidays'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': fullName,
      'first': first,
      'last': last,
      'sal': designation,
      'gender': gender,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'type': type,
      'email': email,
      'website': website,
      'description': description,
      'hours': hours,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'pk': id,
      'hasappt': hasappointment,
      'holidays': holidays,
    };
  }
}
