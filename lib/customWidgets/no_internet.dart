import 'package:flutter/material.dart';

import '../localisation/localisation_constant.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset("assets/nointernet.png"),
            const SizedBox(height: 20),
            Text(getTranslated(context, 'no_internet'),
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(getTranslated(context, 'no_internet_message'),
                  style: const TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
