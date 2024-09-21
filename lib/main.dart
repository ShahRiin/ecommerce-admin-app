import 'package:ecom_admin/firebase_options.dart';
import 'package:ecom_admin/pages/category_page.dart';
import 'package:ecom_admin/pages/dashboard_page.dart';
import 'package:ecom_admin/pages/launcher_page.dart';
import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/pages/new_product_page.dart';
import 'package:ecom_admin/pages/order_page.dart';
import 'package:ecom_admin/pages/view_product.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:ecom_admin/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>FirebaseAuthProvider()),
      ChangeNotifierProvider(create: (context)=>ProductProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: EasyLoading.init() ,
      initialRoute: LauncherPage.routName,
      routes: {
        LauncherPage.routName : (context)=> const LauncherPage(),
        LoginPage.routName : (context)=> const LoginPage(),
        DashboardPage.routName : (context)=> const DashboardPage(),
        NewProductPage.routName : (context)=> const NewProductPage(),
        ViewProductPage.routName : (context)=> const ViewProductPage(),
        CategoryProductPage.routName : (context)=> const CategoryProductPage(),
        OrderPage.routName: (context)=> const OrderPage(),
      },
    );
  }
}
