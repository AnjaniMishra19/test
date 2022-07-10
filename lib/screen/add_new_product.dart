import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sahash/customWidgets/custom_button.dart';
import 'package:sahash/customWidgets/custom_list_tile_field.dart';
import 'dart:io';
import 'package:sahash/models/dropdown_item_model.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/constants.dart';
import '../localisation/localisation_constant.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  FocusNode sortDescriptionFocus;
  String sortDescription;
  File image;
  final List<DropdownList> dropdownList = DropdownList.dropdownlist().toList();
  final TextEditingController controller = TextEditingController();
  TextEditingController calanderController = TextEditingController();
  DateTimeRange dateRange;

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange as DateTimeRange);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Image.asset('assets/icon_arrow_back.png'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslated(context, "short_description"),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1)),
                width: width,
                height: height * 0.12,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: TextFormField(
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(sortDescriptionFocus);
                    },
                    focusNode: sortDescriptionFocus,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    validator: (val) => sortdescriptionvalidate(val, context),
                    onChanged: (value) {
                      sortDescription = value;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      hintText: getTranslated(context, "add_description"),
                    ),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                child: ListTile(
                  title: const Text("Upload Image"),
                  trailing: ElevatedButton(
                    child: const Text("Upload"),
                    onPressed: () async {
                      try {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image == null) return;
                        final imageTemporary = File(image.path);
                        setState(() {
                          this.image = imageTemporary;
                        });
                      } on PlatformException catch (e) {
                        // ignore: avoid_print
                        print('Failed to pick image $e');
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: image != null
                    ? Image.file(
                        image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 100,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                    title: const Text("QR Code"),
                    trailing: GestureDetector(
                      child: Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset("assets/icon_add_doc.png"),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteName.qrCodeScan);
                            }),
                      ),
                    )),
              ),
              CustomListTileField(
                fieldValue: calanderController,
                label: "Select DateTime",
                hint: "Select DateTime",
                icon: Icons.calendar_today_rounded,
                validation: true,
                keyboard: 4,
              ),
              const Text("Date Range",
                  style: TextStyle(fontSize: 10, color: Colors.black)),
              Row(
                children: [
                  CustomButton(
                    name: dateRange == null
                        ? "From"
                        : DateFormat('MM/dd/yyyy').format(dateRange.start),
                    color: Colors.blue,
                    press: () {
                      pickDateRange(context);
                    },
                  ),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.black,
                  ),
                  CustomButton(
                    name: dateRange == null
                        ? "Until"
                        : DateFormat('MM/dd/yyyy').format(dateRange.end),
                    color: Colors.blue,
                    press: () {
                      pickDateRange(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
