import 'package:flutter/material.dart';

class alert{

  Future<dynamic> alertDialog(
      BuildContext context, String title, String content, TextAlign alignment) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: const Color(0xffFFFBE9),
              scrollable: true,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: Color(0xff5FB9B0),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Text(
                textAlign: alignment,
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ));
        });
  }



}