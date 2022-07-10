import 'package:sahash/customWidgets/search_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFilter extends StatelessWidget {
  int filterId;
  CustomFilter({Key key, this.filterId}) : super(key: key);
  List data = [
    "All Leads",
    "Converted Lead",
    "Junk Lead",
    "My Converted Leads",
    "Non Qualified Leads"
  ];

  List contacts = [
    "All Contacts",
    "Converted Contacts",
    "Contact Lead",
    "My Converted Contact Leads"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ListTile(
                title: InkWell(
                  child: Wrap(
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        size: 20,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        filterId == 1
                            ? "Leads"
                            : filterId == 2
                                ? "Contacts"
                                : "Dashboard",
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                              child: AlertDialog(
                                  content: Wrap(children: [
                            Row(
                              children: const [
                                Text("Filter Leads By"),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.filter,
                                  size: 20,
                                ),
                                SizedBox(width: 30),
                                Icon(
                                  Icons.more_horiz_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            SearchBar(
                              defaultWidth:
                                  MediaQuery.of(context).size.width * .65,
                              defaultHeight:
                                  MediaQuery.of(context).size.height * .068,
                            ),
                            const SizedBox(height: 80),
                            Row(
                              children: const [
                                Icon(
                                  Icons.filter,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text("Public Views"),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: filterId == 0 || filterId == 1
                                  ? data.length
                                  : contacts.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return filterId == 0 || filterId == 1
                                    ? Text(data[index])
                                    : Text(contacts[index]);
                              },
                            )
                          ])));
                        });
                  },
                ),
                trailing: Wrap(children: [
                  InkWell(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromARGB(255, 2, 43, 78))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Create Leads",
                          style: TextStyle(
                              color: Color.fromARGB(255, 2, 43, 78),
                              fontSize: 13),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 2, 43, 78),
                          border: Border.all(
                              color: const Color.fromARGB(255, 2, 43, 78))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(children: const [
                          Text(
                            "Action",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 20,
                          )
                        ]),
                      ))
                ]))));
  }
}
