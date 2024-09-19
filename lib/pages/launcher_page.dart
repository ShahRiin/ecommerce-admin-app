import 'package:ecom_admin/main.dart';
import 'package:ecom_admin/pages/dashboard_page.dart';
import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LauncherPage extends StatefulWidget {
  static const String routName ='/';
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void didChangeDependencies() {

    final authProvider = context.read<FirebaseAuthProvider>();
    Future.delayed(const Duration(seconds: 0),(){
  if (authProvider.currentUser!=null){
    Navigator.pushReplacementNamed(context, DashboardPage.routName);
  }
  else{
   Navigator.pushReplacementNamed(context, LoginPage.routName);
  }
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
