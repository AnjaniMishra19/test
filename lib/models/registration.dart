class Registration {
  String email;
  String mobile;
  String name;
  String password;
  String confirmPassword;

  Registration({
    this.email,
    this.mobile,
    this.name,
    this.password,
    this.confirmPassword,
  });

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'mobile': mobile,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
