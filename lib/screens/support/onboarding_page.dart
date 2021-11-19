import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rfbuilder_app/screens/menu.dart';
import 'package:rfbuilder_app/widgets/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'App with easy Managment Picking',
              body: 'The man who never reads lives only one.',
              image: buildImage('assets/images/s1.png'),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: 'News features',
              body: 'Available right at your fingerprints',
              image: buildImage('assets/images/s2.png'),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: buildImage('assets/images/s4.png'),
              decoration: getPageDecoration(context),
            ),
            PageViewModel(
              title: 'Today a Picking, tomorrow a Picking',
              body: 'Start your picking',
              footer: ButtonWidget(
                text: 'Start',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/images/s5.png'),
              decoration: getPageDecoration(context),
            ),
          ],
          done: Text('Start!',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(color: Colors.red),
          ),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward, color: Colors.red),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 270));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.red,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration(context) => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Theme.of(context).scaffoldBackgroundColor,
      );
}
