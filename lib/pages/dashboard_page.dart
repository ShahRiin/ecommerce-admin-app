import 'package:ecom_admin/custom_widgets/dashboar_item_view.dart';
import 'package:ecom_admin/models/dashboard_model.dart';
import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:ecom_admin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  static const String routName ='/dasahboard';
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ProductProvider>().getAllCategories();
    return  Scaffold(
      appBar: AppBar(title: Text('Dashboard'),backgroundColor: Colors.cyan,
      actions: [
        IconButton(onPressed:(){
          context.read<FirebaseAuthProvider>().logout().then((_) =>
          Navigator.pushReplacementNamed(context, LoginPage.routName));
        } ,
            icon: const Icon(Icons.logout))
      ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing :2,
              mainAxisSpacing: 2,

          ),

          itemCount: dashBoardItems.length,
          itemBuilder : (context , index){
            final item = dashBoardItems[index];
            return DashboarItemView(model: item);
          }
      )


    );
  }
}