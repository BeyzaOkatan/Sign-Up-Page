import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:register_page/auth.dart';

class register_ui {
  Container animatedTextAbove(Size size) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.only(
        bottom: size.height * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
          width: 2,
          color: const Color(0xff413D65),
        ),
        color: const Color(0xffFFFBE9).withOpacity(0.25),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TyperAnimatedText("...",
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 30)),
          TyperAnimatedText("hey, welcome :)",
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 120)),
          TyperAnimatedText("...",
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 60)),
          TyperAnimatedText("nice to see you here ^^",
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 120)),
        ],
      ),
    );
  }

  Container signUpText(Size size) {
    return Container(
      //margin: EdgeInsets.only(top: 6),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: size.height * 0.08,
      width: size.width * 0.35,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(offset: Offset(6, -6), color: Color(0xff5FB9B0))
          ],
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: const Color(0xff413D65))),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          "sign up",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SizedBox customSizedBox(Size size) {
    return SizedBox(
      height: size.height * 0.021,
    );
  }

  Container formField(
      Size size,
      double formfieldheight,
      double formfieldwidth,
      bool isPassword,
      String text,
      TextEditingController controller,
      IconData icon) {
    return Container(
      height: size.height * formfieldheight,
      width: size.width * formfieldwidth,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Color(0xffFAEDCD), offset: Offset(6.5, -6.5))
          ],
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: const Color(0xff413D65))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            prefixIcon: Icon(icon, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Row butons(BuildContext context, Size size, String firstname, String lastname,
      String email, String password, bool agree) {
    Auth _auth = Auth();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        greenButon(
            size, _auth, context, firstname, lastname, email, password, agree),
        SizedBox(
          width: size.width * 0.15,
          height: size.height * 0.12,
        ),
        redButton(size),
      ],
    );
  }

  Container redButton(Size size) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.27,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.red.shade300, offset: const Offset(6, -6))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: const Color(0xff413D65))),
      child: OutlinedButton(
          onPressed: () {
            null;
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(20),
              //side: BorderSide(width: 2),
            ),
          ),
          child: const Icon(
            Icons.close,
            color: Colors.black,
          )),
    );
  }

  Container greenButon(
      Size size,
      Auth _auth,
      BuildContext context,
      String firstname,
      String lastname,
      String email,
      String password,
      bool agree) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.27,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.green.shade300, offset: const Offset(6, -6))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: const Color(0xff413D65))),
      child: OutlinedButton(
          onPressed: () {
            _auth.addUser(
                context, size, firstname, lastname, email, password, agree);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(20),
              //side: BorderSide(width: 2),
            ),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.black,
          )),
    );
  }
}



