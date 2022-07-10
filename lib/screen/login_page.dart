import 'package:sahash/config/common.dart';
import 'package:sahash/customWidgets/custom_backgound_logo.dart';
import 'package:sahash/customWidgets/custom_button.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customWidgets/custom_list_tile_field.dart';
import '../localisation/localisation_constant.dart';
import '../service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final GlobalKey<FormState> key = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  LoginService loginService;
  // ignore: unused_field
  final bool _isLoading = false;

  _LoginPageState() {
    loginService = LoginService();
  }

  // void _loginWithFacebook() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     final facebookLoginResult = await FacebookAuth.instance.login();
  //     final userData = await FacebookAuth.instance.getUserData();
  //     final facebookAuthCredential = FacebookAuthProvider.credential(
  //         facebookLoginResult.accessToken.token);
  //     await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  //     await FirebaseFirestore.instance.collection('users').add({
  //       'email': userData['email'],
  //       'imageurl': userData['picture']['data']['url'],
  //     });
  //     Navigator.pushNamed(context, RouteName.dashboard, arguments: 0);
  //   } on FirebaseAuthException catch (e) {
  //     var content = '';
  //     switch (e.code) {
  //       case 'account-exists-with-different-credential':
  //         content = 'This account exists with a different sign in provider';
  //         break;
  //       case 'invalid-credential':
  //         content = 'Unknown error has occured';
  //         break;
  //       case 'operation-not-allowed':
  //         content = 'This operation is not allowed';
  //         break;
  //       case 'user-disabled':
  //         content = 'The user you tried to log into id disabled';
  //         break;
  //       case 'user-not-found':
  //         content = 'The user you tried to log into was not found';
  //         break;
  //     }
  //     showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               title: const Text('Log in with facebook failed'),
  //               content: Text(content),
  //               actions: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text('ok'))
  //               ],
  //             ));
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  // _loginWithFacebook() async {
  //   try {
  //     final result =
  //         await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print(userData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  setPrefrenceBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
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
          Align(
              alignment: Alignment.center,
              child: Text(getTranslated(context, 'login'),
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ))),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: _formkey,
              child: Column(children: [
                CustomListTileField(
                    fieldValue: mobileController,
                    label: getTranslated(context, 'mobile'),
                    hint: getTranslated(context, 'mobileno'),
                    icon: Icons.smartphone,
                    validation: true,
                    keyboard: 1),
                const SizedBox(height: 2),
                CustomListTileField(
                  fieldValue: passwordController,
                  label: getTranslated(context, 'password'),
                  hint: getTranslated(context, 'password'),
                  icon: Icons.password,
                  validation: true,
                  keyboard: 2,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteName.forgetPassword);
                          },
                          child: Text(getTranslated(context, 'forget')),
                        ))),
                CustomButton(
                    name: getTranslated(context, 'loginbn'),
                    color: Colors.blueAccent,
                    press: () {
                      if (_formkey.currentState.validate()) {
                        setPrefrenceBool('_islogin', true);
                        Navigator.pushReplacementNamed(
                            context, RouteName.dashboard,
                            arguments: 0);
                        Common.success(context, "Success",
                            getTranslated(context, 'login_success'));
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteName.registrationPage);
                    },
                    child: Text(getTranslated(context, 'signup'))),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 235, 234, 234),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.chrome_reader_mode,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Google",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 235, 234, 234),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.facebook,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Facebook",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // _loginWithFacebook();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ]))
        ])));
  }
}
