import 'package:ecom_admin/db/db_helper.dart';
import 'package:ecom_admin/models/category_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  List<CategoryModel>categorList = [];
  Future<void>addNewCategory(String name){
    final model = CategoryModel(name);
    return DbHelper.addCategory(model);
  }
  getAllCategories(){
    DbHelper.getAllCategories().listen((snapshot){
      categorList = List.generate(snapshot.docs.length, (index)=>
         CategoryModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}