import 'package:ecom_admin/pages/dashboard_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routName ='/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMsg = '';
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page', style: TextStyle(fontSize: 30.0),),backgroundColor: Colors.orangeAccent,),
     body:Center(
       child: Form(
         key:_formKey,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal:48.0  , vertical: 4.0 ),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: const Icon(Icons.email)
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Email is empty';
                    }
                    return null ;
                  },
                ),
              ),



               Padding(
                 padding: EdgeInsets.symmetric(horizontal:48.0  , vertical: 4.0 ),
                 child: TextFormField(
                   controller: _passwordController,
                   obscureText: true,
                   keyboardType: TextInputType.emailAddress,
                   decoration: const InputDecoration(
                       hintText: 'Password',
                       prefixIcon: const Icon(Icons.lock )
                   ),
                   validator: (value){
                     if(value == null || value.isEmpty){
                       return 'Password is empty   ';
                     }
                     return null ;
                   },
                 ),
               ),
               const SizedBox(
                 height: 20.0,
               ),
               ElevatedButton(
                   onPressed: _loginAdmin,
                   child: const Text('Log in as Admin')
               ),
               const SizedBox(height: 20.0,),
               Text(
                 _errorMsg ,
                 style: const TextStyle(
                   fontSize: 18.0,
                   color: Colors.red,
                 ),
               )
             ],
           )
       ),
     )
    );
  }

  Future <void> _loginAdmin() async{
    if(_formKey.currentState!.validate()){
      final email = _emailController.text ;
      final password = _passwordController.text;
      EasyLoading.show(status: 'please wait');
      try{
        final isAdmin = await context.read<FirebaseAuthProvider>().loginAdmin(email, password);
        if(isAdmin){
          Navigator.pushReplacementNamed(context, DashboardPage.routName);
        }
       else{
         await context.read<FirebaseAuthProvider>().logout();
         setState(() {
           _errorMsg = 'This email Address is not associated with an Admin account , please provide a valid one';
         });
        }

      }on FirebaseAuthException catch (error){
        setState(() {
          _errorMsg = 'Login failed:${error.message}';
        });
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}