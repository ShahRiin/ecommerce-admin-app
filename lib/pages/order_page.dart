import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  static const String routName ='/orderPage';
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Order'),backgroundColor: Colors.cyan,
        actions: [

        ],
      ),
      body:Center(
        child: Text('Order'),
      ),

    );
  }
}