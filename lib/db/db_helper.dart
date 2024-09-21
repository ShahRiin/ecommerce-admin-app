import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/models/category_model.dart';

class DbHelper {
  DbHelper._();
  static final _db = FirebaseFirestore.instance;
  static const String _collectionAdmin = 'Admins';
  static const String _collectionCategory = 'Categories';
  static Future<bool> isAdmin(String uid)async{
    final snapshot = await _db.collection(_collectionAdmin).doc(uid).get();
    return  snapshot.exists ;

  }

  static Future<void>addCategory(CategoryModel model){
    return _db.collection(_collectionCategory).add(model.toMap());
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories()=>
      _db.collection(_collectionCategory).snapshots();
}