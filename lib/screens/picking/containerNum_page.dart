import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rfbuilder_app/generated/l10n.dart';

class ContainerNum extends StatefulWidget {
  const ContainerNum({Key? key}) : super(key: key);

  @override
  _ContainerNumState createState() => _ContainerNumState();
}

class _ContainerNumState extends State<ContainerNum> {
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  final _text = TextEditingController();
  bool _validate = false;
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
                    S.of(context).modalcontainer,
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
                    S.of(context).modalcontainerdes,
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
                  TextField(
                    controller: _text,
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      contentPadding: EdgeInsets.all(0.0),
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: Icon(
                        Iconsax.document,
                        color: Colors.red,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    disabledColor: Colors.grey,
                    onPressed: () {
                      setState(() {
                        Get.toNamed('/picking');
                      });
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
                                S.of(context).btncontinue,
                                style: TextStyle(color: Colors.white),
                              ),
                  )
                ],
              )),
        ));
  }
}
