import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/appUser.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/sliderModel.dart';

// import 'package:flutter/foundation.dart';

class FireStoreHelper{
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore  firebaseInstance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>>  firebaseInstanceuser = FirebaseFirestore.instance.collection('users');

  final String categoryCollectionName = 'categories';
  addUserToFireStore(AppUser appUser)async{
    firebaseInstance.doc(appUser.id!).set(appUser.toMap());
}
  Future<AppUser> getUserFromFireStore(String id)async{
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firebaseInstance.doc(id).get();
    documentSnapshot.data();
    return AppUser.fromMap(documentSnapshot.data()!);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>>  firebaseInstancecategory = FirebaseFirestore.instance.collection('categories');

  // addCategoryToFireStore(Category category)async{
  //  await firebaseInstancecategory.add(category.toMap());
  // }
  Future<Category> addCategoryToFireStore(Category category)async{
    DocumentReference<Map<String, dynamic>> documentReference = await firebaseInstancecategory.add(category.toMap());
    category.catId=documentReference.id;
    return category;
  }
  // Future<List<Category>> getCategoryFromFireStore()async{
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstancecategory.get();
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =querySnapshot.docs;
  //   List<Category> categories = documents.map((e){
  //     Category category = Category.fromMap(e.data());
  //     category.catId=e.id;
  //     return category;
  //   }).toList();
  //   return categories;
  // }
  Future<List<Category>> getCategoryFromFireStore()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<Category> categories=DocumentSnapshot.map((e){
      Category category=Category.fromMap(e.data());
      category.catId=e.id;
      return category;

    }).toList();

    return categories;
  }
  deleteCategory(Category category)async {
   await firebaseInstancecategory.doc(category.catId).delete();
  }
  updateCategory(Category category) async{
   await firebaseInstancecategory.doc(category.catId).update(category.toMap());
  }
  //////////////////////////////////////////////////////////////////////////////////////////////
  Future<Product> addNewProduct(Product product,String catId)async{
    DocumentReference<Map<String, dynamic>> documentReference =await firebaseInstancecategory.doc(catId).collection('products').add(product.toMap());
    product.id=documentReference.id;
    return product;
  }
  Future<List<Product>> getAllProduct (String catId)async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstancecategory.doc(catId).collection('products').get();
    List<Product> products = querySnapshot.docs.map((e) {
      Map<String,dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      return product;
    } ).toList();
    return products;
  }
  updateProduct(Product product,String catId)async{
    await firebaseInstancecategory.doc(catId).collection('products').doc(product.id).update(product.toMap());

  }
  deleteProduct(Product product,String catId)async{
   await firebaseInstancecategory.doc(catId).collection('products').doc(product.id).delete();
  }
  //////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference<Map<String,dynamic>> imagesliderinstance=FirebaseFirestore.instance.collection('Slider');
  Future<List<SliderModel>> getAllSliders()async{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await imagesliderinstance.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot= querySnapshot.docs;
    List<SliderModel> sliderslist=DocumentSnapshot.map((e){
      SliderModel sliderimage=SliderModel.fromMap(e.data());
      sliderimage.sliderid=e.id;
      return sliderimage;

    }).toList();

    return sliderslist;
  }
  Future<SliderModel>addNweSlider(SliderModel imageSlider )async{

    DocumentReference<Map<String, dynamic>>docref= await imagesliderinstance.
    add(imageSlider.toMap());
    imageSlider.sliderid=docref.id;
    return imageSlider;

  }
  deleteSlider(SliderModel imageSlider)async{
    imagesliderinstance.doc(imageSlider.sliderid).delete();

  }
}