import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProductPage extends StatefulWidget {
  static const String routName ='/viewProduct';
  const ViewProductPage({super.key});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Product View'),backgroundColor: Colors.cyan,
        actions: [
          IconButton(onPressed:(){

          } ,
              icon: const Icon(Icons.logout))
        ],
      ),
      body:Center(
        child: Text('View Product'),
      ),

    );
  }
}