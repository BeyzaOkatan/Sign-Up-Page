import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Oturum açma başarılı, kullanıcı Credential objesi içinde tutulur
      User? user = userCredential.user;
      // Kullanıcının giriş yaptığı sayfaya yönlendirme yapabilirsiniz
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Kullanıcı bulunamadı');
      } else if (e.code == 'wrong-password') {
        print('Yanlış şifre');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input?.isEmpty ?? true) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (input) {
                _email = input ?? '';
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return 'Your password needs to be at least 6 characters';
                }
                return null;
              },
              onSaved: (input) {
                _password = input ?? '';
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // butona tıklanınca yapılacak işlemler
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
