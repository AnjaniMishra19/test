import 'package:sahash/customWidgets/dropdown.dart';
import 'package:sahash/helper/shimmer.dart';
import 'package:sahash/localisation/localisation_constant.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:sahash/screen/on_boarding_page.dart';
import 'package:sahash/screen/profile.dart';
import 'package:sahash/screen/syncfusion_datagrid.dart';
import 'package:sahash/screen/under_construction_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
              accountName: Text(
                "Anjani Mishra",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "anjani@123",
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 236, 236),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1583195764036-6dc248ac07d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80"),
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: Text(getTranslated(context, 'dashboard')),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteName.dashboard,
                        arguments: 0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.leaderboard),
                  title: Text(getTranslated(context, 'leads')),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteName.dashboard,
                        arguments: 1);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(getTranslated(context, 'contacts')),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteName.dashboard,
                        arguments: 2);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(getTranslated(context, 'settings')),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RouteName.settingPage,
                        arguments: 1);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text(getTranslated(context, 'logout')),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RouteName.loginPage);
                  },
                ),
                const Divider(
                  color: Color.fromARGB(255, 91, 91, 91),
                ),
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text("Profile"),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.ondemand_video),
                  title: const Text("OnBoardingScreen"),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardingPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Syncfusion'),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const SyncfusionDatagridDemo())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Shimmer Effect'),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const ShimmerLoadingEffect())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('UnderConstruction Page'),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const UnderConstructionPage())));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Dropdown'),
                  trailing: const Icon(Icons.send),
                  tileColor: isSelected ? Colors.grey[300] : Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const DropDownButtonDemo())));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
