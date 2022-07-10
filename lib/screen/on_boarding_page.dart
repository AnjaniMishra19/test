import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sahash/routes/route_name.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  Widget _buildImage(String assetName) {
    return Image.asset('assets/$assetName',
        fit: BoxFit.fill, width: MediaQuery.of(context).size.width);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Image.asset("assets/background.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 130, 15, 130),
          child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            pages: [
              PageViewModel(
                title: 'A reader lives a thousand lives',
                body: 'The man who never reads lives only one.',
                image: _buildImage('product.jpg'),
              ),
              PageViewModel(
                title: 'A reader lives a thousand lives',
                body: 'The man who never reads lives only one.',
                image: _buildImage('product.jpg'),
              ),
              PageViewModel(
                title: 'A reader lives a thousand lives',
                body: 'The man who never reads lives only one.',
                image: _buildImage('product.jpg'),
              )
            ],
            done: Text(
              'Done',
              style: TextStyle(color: HexColor("#CC9D76")),
            ),
            onDone: () {
              Navigator.pushNamed(context, RouteName.dashboard);
            },
            next: Icon(
              Icons.arrow_forward,
              color: HexColor("#CC9D76"),
            ),
            skip: Text(
              'Skip',
              style: TextStyle(color: HexColor("#CC9D76")),
            ),
            showSkipButton: true,
            dotsDecorator: DotsDecorator(
              size: const Size(10.0, 10.0),
              color: const Color(0xFFBDBDBD),
              // color: Colors.green,
              activeSize: const Size(15.0, 10.0),
              activeColor: HexColor("#CC9D76"),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
