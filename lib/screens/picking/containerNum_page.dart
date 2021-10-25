import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';
import 'package:get/get.dart';

class ContainerNum extends StatefulWidget {
  const ContainerNum({Key? key}) : super(key: key);

  @override
  _ContainerNumState createState() => _ContainerNumState();
}

class _ContainerNumState extends State<ContainerNum> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 10000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/containerNum.png'),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Container",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please enter the  digit code of container picking",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  VerificationCode(
                      length: 6,
                      textStyle: TextStyle(fontSize: 20),
                      underlineColor: Colors.blueAccent,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) {
                        setState(() {
                          _code = value;
                        });
                      },
                      onEditing: (value) {}),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    disabledColor: Colors.grey,
                    onPressed: _code.length < 6
                        ? null
                        : () {
                            Get.toNamed('/picking');
                          },
                    color: Colors.red,
                    minWidth: double.infinity,
                    height: 50,
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 3,
                              color: Colors.red,
                            ),
                          )
                        : _isVerified
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 30,
                              )
                            : Text(
                                "Continue",
                                style: TextStyle(color: Colors.white),
                              ),
                  )
                ],
              )),
        ));
  }
}
