import 'package:flutter/material.dart';
import 'package:ecom_admin/models/dashboard_model.dart';
class DashboarItemView extends StatelessWidget {
  const DashboarItemView({super.key , required this.model,});
final DashboardItemModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.pushNamed(context, model.routeName),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(model.iconData , color: Colors.grey,size: 30.0,),
            const SizedBox(height: 10.0,),
            Text(model.title , style: const TextStyle(fontWeight: FontWeight.bold,),)
          ],
        ),
      ),
    );
  }
}
