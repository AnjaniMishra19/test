import 'package:sahash/customWidgets/custom_button.dart';
import 'package:sahash/customWidgets/custom_list_tile_field.dart';
import 'package:sahash/models/registration.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:sahash/service/registration_services.dart';
import '../config/common.dart';
import '../customWidgets/custom_backgound_logo.dart';
import '../localisation/localisation_constant.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  // final TextEditingController calanderController = TextEditingController();
  RegistrationService _registrationService;
  bool result;

  @override
  void initState() {
    super.initState();
    _registrationService = RegistrationService();
  }

  Future<bool> setAllLocalData() async {
    final data = [
      Registration(
        email: emailController.text,
        mobile: mobileController.text,
        name: nameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      )
    ];
    _registrationService.setLocalRegistration(data);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        const CustomBackgroundLogo(),
        const SizedBox(
          height: 13,
        ),
        Form(
            key: _formkey,
            child: Column(children: [
              CustomListTileField(
                  fieldValue: emailController,
                  label: getTranslated(context, 'email'),
                  hint: getTranslated(context, 'email'),
                  icon: Icons.email,
                  validation: true,
                  keyboard: 3),
              CustomListTileField(
                  fieldValue: mobileController,
                  label: getTranslated(context, 'mobile'),
                  hint: getTranslated(context, 'mobileno'),
                  icon: Icons.smartphone,
                  validation: true,
                  keyboard: 1),
              CustomListTileField(
                  fieldValue: nameController,
                  label: getTranslated(context, 'name'),
                  hint: getTranslated(context, 'name'),
                  icon: Icons.person,
                  validation: true,
                  keyboard: 0),
              const SizedBox(height: 5),
              CustomListTileField(
                fieldValue: passwordController,
                label: getTranslated(context, 'password'),
                hint: getTranslated(context, 'password'),
                icon: Icons.visibility,
                validation: true,
                keyboard: 2,
              ),
              const SizedBox(height: 5),
              CustomListTileField(
                  fieldValue: confirmPasswordController,
                  label: getTranslated(context, 'cpassword'),
                  hint: getTranslated(context, 'cpassword'),
                  icon: Icons.visibility,
                  validation: true,
                  keyboard: 2),
              const SizedBox(height: 5),
              // CustomListTileField(
              //   fieldValue: calanderController,
              //   label: "Select Date",
              //   hint: "Select Date",
              //   icon: Icons.calendar_today_rounded,
              //   validation: true,
              //   keyboard: 4,
              // ),
              CustomButton(
                  name: getTranslated(context, 'account'),
                  color: Colors.blueAccent,
                  press: () async {
                    if (_formkey.currentState.validate()) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        result = await setAllLocalData();
                        if (result != null) {
                          Navigator.pushNamed(
                              context, RouteName.phoneVerification,
                              arguments: mobileController.text);
                          Common.success(context, "Success",
                              getTranslated(context, 'registration_success'));
                        }
                      } else {
                        Common.success(context, "Error",
                            getTranslated(context, 'incorrect_password'));
                      }
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RouteName.loginPage);
                  },
                  child: Text(getTranslated(context, 'loginaccount'))),
              const SizedBox(
                height: 40,
              )
            ]))
      ])),
    );
  }
}
