import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProductPage extends StatefulWidget {
  static const String routName ='/newProduct';
  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('New Product'),backgroundColor: Colors.cyan,
        actions: [

        ],
      ),
      body:Center(
        child: Text('New Product'),
      ),

    );
  }
}