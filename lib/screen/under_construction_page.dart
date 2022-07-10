import 'package:flutter/material.dart';

class UnderConstructionPage extends StatefulWidget {
  const UnderConstructionPage({Key key}) : super(key: key);

  @override
  State<UnderConstructionPage> createState() => _UnderConstructionPageState();
}

class _UnderConstructionPageState extends State<UnderConstructionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Under Construction Page'),
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
      body: Container(
        color: const Color.fromARGB(255, 219, 218, 218),
      ),
    );
  }
}
