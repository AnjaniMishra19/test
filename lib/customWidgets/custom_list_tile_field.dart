import 'package:sahash/constants/constants.dart';
import 'package:sahash/helper/helper.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomListTileField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var fieldValue;
  String label;
  String hint;
  IconData icon;
  bool validation;
  int keyboard;
  // var options = [''];

  // ignore: use_key_in_widget_constructors
  CustomListTileField({
    Key key,
    this.fieldValue,
    this.label,
    this.hint,
    this.icon,
    this.validation,
    this.keyboard,
  });

  @override
  // ignore: no_logic_in_create_state
  _CustomListTileFieldState createState() => _CustomListTileFieldState(
      fieldValue, label, hint, icon, validation, keyboard);
}

class _CustomListTileFieldState extends State<CustomListTileField> {
  IconData icon;
  // ignore: prefer_typing_uninitialized_variables
  var fieldValue;
  String label;
  bool validation;
  String hint;
  int keyboard;
  String password;
  String confirmPassword;
  // ignore: unused_field
  String _chosenValue;
  // List<DropdownMenuItem<String>> dropDownItems = [];
  _CustomListTileFieldState(this.fieldValue, this.label, this.hint, this.icon,
      this.validation, this.keyboard);

  DateTime newDate;
  TimeOfDay time;
  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: newDate ?? currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2026));
    if (pickedDate == null) return;
    if (pickedDate != null && pickedDate != currentDate) {
      var initialTime = const TimeOfDay(hour: 9, minute: 0);
      final newTime = await showTimePicker(
        context: context,
        initialTime: time ?? initialTime,
      );
      if (newTime == null) return;
      setState(() {
        newDate = pickedDate;
        time = newTime;
        fieldValue.text = Helper.localDate(newDate, time);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
          controller: fieldValue,
          // ignore: missing_return
          validator: validation
              ? (fieldValue) {
                  if (fieldValue == null || fieldValue.isEmpty) {
                    return getTranslated(context, 'field');
                  } else if (keyboard == 1 && (fieldValue.length < 10)) {
                    return getTranslated(context, 'incorrect');
                  } else if (keyboard == 3 &&
                      !RegExp(EMAIL_REGEX).hasMatch(fieldValue)) {
                    return getTranslated(context, 'incorrect_email');
                  } else if (keyboard == 2 &&
                      !RegExp(PASSWORD_REGEX).hasMatch(fieldValue)) {
                    return getTranslated(context, 'wrong_password');
                  } else if (keyboard == 4 &&
                      !RegExp(CALANDER_REGEX).hasMatch(fieldValue)) {
                    return getTranslated(context, 'calender');
                  }
                  return null;
                }
              : null,
          obscureText: keyboard == 2 ? true : false,
          maxLength: keyboard == 1 ? 10 : null,
          maxLines: 1,
          keyboardType: keyboard == 1 || keyboard == 4
              ? TextInputType.phone
              : TextInputType.text,
          inputFormatters: keyboard == 1 || keyboard == 4
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              labelText: label,
              hintText: hint,
              labelStyle: const TextStyle(color: Colors.blueAccent),
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
              suffixIcon: icon != null && icon == Icons.calendar_today_rounded
                  ? GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Icon(icon),
                    )
                  : Icon(icon))),
    );
  }
}
