import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:register_page/alert.dart';

class Auth{

  Future<dynamic> addUser(BuildContext context, Size size, String firstname, String lastname,
      String email, String password,bool agree) async {
    String? result;
    if (firstname.trim().isEmpty) {
      result = "First name can't be empty.";
    } else if (lastname.trim().isEmpty) {
      result = "Last name can't be empty.";
    } else if (email.trim().isEmpty) {
      result = "Email can't be empty.";
    } else if (password.trim().isEmpty) {
      result = "Password can't be empty.";
    } else if (agree == false) {
      result = "You must accept all terms and conditions to continue using the service.";
    } else {
      try {
        var user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseFirestore.instance.collection('user').doc(user.user!.uid).set(
            {'firstName': firstname, 'lastName': lastname, 'email': email});
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.code;
      }
    }
    if (context.mounted) {
      alert _alert = alert();
      if (result != "success") {
        _alert.alertDialog(context, "ERROR", result, TextAlign.start);
      } else {
        _alert.alertDialog(
            context, "~(˘▾˘~)", "Thank you for registering.", TextAlign.center);
      }
    }
  }


}