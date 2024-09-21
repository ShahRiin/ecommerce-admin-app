import 'package:ecom_admin/pages/login_page.dart';
import 'package:ecom_admin/provider/auth_provider.dart';
import 'package:ecom_admin/provider/product_provider.dart';
import 'package:ecom_admin/utils/widgets_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class CategoryProductPage extends StatefulWidget {
  static const String routName ='/categoryPage';
  const CategoryProductPage({super.key});

  @override
  State<CategoryProductPage> createState() => _CategoryProductPageState();
}
class _CategoryProductPageState extends State<CategoryProductPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('All Category'),backgroundColor: Colors.cyan,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            showSingleTextInputDialog(
                context: context,
                title: 'New Category',
                onSave: (value)async{
                  EasyLoading.show(status: 'Please Wait');
                  await context.read<ProductProvider>().addNewCategory(value);
                  EasyLoading.dismiss();
                  showMsg(context, 'Category Saved');
                }
            );
          },
        child: const Icon(Icons.add),
      ),
      body:Consumer<ProductProvider>(
          builder:  (context, provider, child) => provider.categorList.isEmpty?
        const Center(child: Text('No Category Found'),):ListView.builder(
              itemCount: provider.categorList.length,
            itemBuilder:(context, index) => ListTile(
              title: Text(provider.categorList[index].name),
            ),
          ),


      )

    );
  }
}