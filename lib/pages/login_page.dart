import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routName ='/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),),
    );
  }
}