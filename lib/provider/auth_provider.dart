
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthProvider with ChangeNotifier{
final _auth = FirebaseAuth.instance;
User? get currentUser => _auth.currentUser ;
}