import 'package:flutter/material.dart';
import 'package:sahash/customWidgets/custom_list_tile_field.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/service/registration_services.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  RegistrationService _registrationService;
  // ignore: unused_field
  bool _isLoading = false;
  List<dynamic> allData;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    _registrationService = RegistrationService();
    _fetchAllData();
    super.initState();
  }

  _fetchAllData() async {
    setState(() {
      _isLoading = true;
    });
    allData = await _registrationService.getLocalRegistration();
    emailController.text = allData[0]['email'];
    mobileController.text = allData[0]['mobile'];
    nameController.text = allData[0]['name'];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset('assets/icon_arrow_back.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: allData != null
              ? Form(
                  key: _form,
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
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
                    ],
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: const Center(child: CircularProgressIndicator()))),
    );
  }
}
