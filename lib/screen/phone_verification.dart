import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahash/config/common.dart';
import 'package:sahash/customWidgets/custom_backgound_logo.dart';
import 'package:sahash/customWidgets/custom_button.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PhoneVerification extends StatefulWidget {
  String phoneno;
  PhoneVerification({Key key, this.phoneno}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String phoneno;
  final TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIdReceived = "";
  bool otpCodeVisible = false;

  setPrefrenceBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Phone Verification"),
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
          child: Column(
        children: [
          const CustomBackgroundLogo(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: TextField(
              controller: otpController,
              maxLength: 6,
              maxLines: 1,
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                labelText: "OTP",
                hintText: "OTP",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 202, 201, 201),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 202, 201, 201), width: 1.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.blueAccent, width: 1.5),
                ),
              ),
            ),
          ),
          CustomButton(
              name: otpCodeVisible
                  ? getTranslated(context, 'verify')
                  : getTranslated(context, 'send_otp'),
              color: Colors.blueAccent,
              press: () {
                verifyNumber();
                if (otpCodeVisible) {
                  FocusScope.of(context).unfocus();
                  setPrefrenceBool('_islogin', true);
                  Navigator.pushReplacementNamed(context, RouteName.dashboard,
                      arguments: 0);
                  Common.success(context, "Success",
                      getTranslated(context, 'verify_success'));
                }
              }),
        ],
      )),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: '+91' + widget.phoneno,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException exception) {
        // ignore: avoid_print
        print(exception.message);
      },
      codeSent: (String verificaionId, int resendToken) {
        verificationIdReceived = verificaionId;
        otpCodeVisible = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
