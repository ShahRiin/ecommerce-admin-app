import 'package:ecom_admin/pages/category_page.dart';
import 'package:ecom_admin/pages/new_product_page.dart';
import 'package:ecom_admin/pages/order_page.dart';
import 'package:ecom_admin/pages/view_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardItemModel{
  final String title;
  final IconData iconData;
  final String routeName;


  const DashboardItemModel({
    required this.title,
    required this.iconData,
    required this.routeName,
  });
}const dashBoardItems =[
  DashboardItemModel(title: 'Add Product',iconData: Icons.card_giftcard, routeName: NewProductPage.routName,),
  DashboardItemModel(title: 'View Product',iconData: Icons.list, routeName: ViewProductPage.routName,),
  DashboardItemModel(title: 'Category',iconData: Icons.category, routeName: CategoryProductPage.routName,),
  DashboardItemModel(title: 'Order',iconData: Icons.monetization_on_rounded, routeName: OrderPage.routName,),
];