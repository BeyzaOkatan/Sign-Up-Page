import 'package:flutter/material.dart';
import 'package:register_page/register_ui.dart';
import 'package:register_page/alert.dart';
import 'package:flutter/gestures.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool agree = false;
  final _registerui = register_ui();
  final _alert = alert();

  @override
  Widget build(BuildContext context) {
    var formFieldWidth = 0.74;
    var formFieldHeight = 0.07;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffBEF992),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _registerui.animatedTextAbove(size),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin:
                      EdgeInsets.only(top: size.height * 0.04, right: 4.5),
                      height: size.height * 0.539,
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(9, -9), color: Color(0xffFFFBE9))
                        ],
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff413D65),
                        ),
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          _registerui.formField(
                              size,
                              formFieldHeight,
                              formFieldWidth,
                              false,
                              "First Name",
                              firstnamecontroller,
                              Icons.person),
                          _registerui.customSizedBox(size),
                          _registerui.formField(
                              size,
                              formFieldHeight,
                              formFieldWidth,
                              false,
                              "Last Name",
                              lastnamecontroller,
                              Icons.person),
                          _registerui.customSizedBox(size),
                          _registerui.formField(size, formFieldHeight, formFieldWidth,
                              false, "Email", emailcontroller, Icons.mail),
                          _registerui.customSizedBox(size),
                          _registerui.formField(size, formFieldHeight, formFieldWidth, true,
                              "Password", passwordcontroller, Icons.password),
                          _registerui.customSizedBox(size),
                          termsAndConditions(size, formFieldWidth, context)
                        ],
                      ),
                    ),
                    _registerui.signUpText(size),
                  ],
                ),
                _registerui.butons(context,size,firstnamecontroller.text,lastnamecontroller.text,emailcontroller.text,passwordcontroller.text, agree),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox termsAndConditions(
      Size size, double formfieldwidth, BuildContext context) {
    return SizedBox(
      height: size.height * 0.04,
      width: size.width * formfieldwidth,
      child: Row(
        children: [
          Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              value: agree,
              activeColor: const Color(0xff413D65),
              onChanged: (bool? newValue) {
                setState(() {
                  agree = newValue!;
                });
              }),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'i accept all ',
                    style: TextStyle(
                      fontFamily: "AmaticSC",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    style: const TextStyle(
                      fontFamily: "AmaticSC",
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    text: 'terms and conditions',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _alert.alertDialog(
                            context,
                            "TERMS AND CONDITIONS",
                            "By using the service, you agree to be a part of the procrastinators community.",
                            TextAlign.start);
                      }),
                const TextSpan(
                  text: '.',
                  style: TextStyle(
                    fontFamily: "AmaticSC",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
