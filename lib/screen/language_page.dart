import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/models/language_list_model.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:sahash/service/manu_page_service.dart';
import 'package:flutter/material.dart';

import '../config/common.dart';
import '../main.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final List<LanguageList> languages = LanguageList.languagelist().toList();
  ManuPageService _manuPageService;

  Future<String> _changeLanguage(String language) async {
    Locale _locale = await _manuPageService.setLocale(language);
    MyApp.setLocale(context, _locale);
    return _locale.languageCode;
  }

  @override
  void initState() {
    _manuPageService = ManuPageService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString().substring(0, 2);
    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'languages')),
          leading: Transform.scale(
            scale: 2,
            child: IconButton(
              icon: Image.asset('assets/icon_arrow_back.png'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 227, 226, 226),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                    top: 7, left: 20, right: 0, bottom: 5),
                title: Text(languages[index].name),
                trailing: languages[index].languageCode == locale
                    ? GestureDetector(
                        child: Transform.scale(
                          scale: 4,
                          child: IconButton(
                              icon: Image.asset(
                                'assets/icon_checkmark_list.png',
                                color: Colors.black,
                              ),
                              onPressed: () async {}),
                        ),
                      )
                    : null,
                onTap: () async {
                  final result =
                      await _changeLanguage(languages[index].languageCode);
                  if (result != null) {
                    Navigator.pushReplacementNamed(
                        context, RouteName.dashboard);
                    Common.success(context, "Success",
                        getTranslated(context, 'language_change_success'));
                  }
                },
              ),
            );
          },
        ));
  }
}
