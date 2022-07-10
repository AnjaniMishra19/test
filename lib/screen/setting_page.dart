import 'package:sahash/customWidgets/custom_list_settings.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/models/menu_item.dart';
import 'package:sahash/models/menu_list_item.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  var data = [
    {"text": "Language", "url": RouteName.languagePage},
    {"text": "Authentication", "url": RouteName.authenticationPageSetting},
  ];
  int selectedId;
  SettingPage({Key key, this.selectedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 242, 242),
      appBar: selectedId == 1
          ? AppBar(
              title: Text(getTranslated(context, 'settings')),
              leading: Transform.scale(
                scale: 2,
                child: IconButton(
                  icon: Image.asset('assets/icon_arrow_back.png'),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, RouteName.dashboard),
                ),
              ),
              actions: [
                PopupMenuButton<MenuItem>(
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                          ...MenuListItem.itemFirst.map(buildItem).toList(),
                          const PopupMenuDivider(),
                          ...MenuListItem.itemSecond.map(buildItem).toList(),
                        ]),
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              CustomListSettings(data: data),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );
  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuListItem.itemSettings:
        Navigator.pushNamed(context, RouteName.underConstruction);
        break;
      case MenuListItem.itemShare:
        Navigator.pushNamed(context, RouteName.underConstruction);
        break;
      case MenuListItem.itemSignOut:
        Navigator.pushNamed(context, RouteName.underConstruction);
        break;
    }
  }
}
