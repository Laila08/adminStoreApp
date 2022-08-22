import 'dart:io';

import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/data/firestore_helper.dart';
import 'package:ecommerce/data/storageHelper.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/model/sliderModel.dart';
import 'package:ecommerce/views/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/provider/authProvider.dart';
import 'package:image_picker/image_picker.dart';
class FireStoreProvider extends ChangeNotifier{
  FireStoreProvider(){
    getAllCategory();
    getAllsliders();
  }
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController ProductNameController = TextEditingController();
  TextEditingController ProductPriceController = TextEditingController();
  TextEditingController ProductQuantityController = TextEditingController();
  TextEditingController ProductDescController = TextEditingController();
  TextEditingController sliderNameController = TextEditingController();

  File? selectedImage;
  List<Category> categories=[];
  List<Product> products=[];
  List<SliderModel> imagesliderslist=[];
  selectImage()async{
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }
  addNewCategory()async{
    if(selectedImage!=null){
      String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Category category = Category(name:categoryNameController.text,imageUrl: imageUrl);
      FireStoreHelper.fireStoreHelper.addCategoryToFireStore(category);
      selectedImage=null;
      categoryNameController.clear();
      getAllCategory();
    }
  }
  // addNewCategory()async{
  //   if(selectedImage!=null){
  //     String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
  //     Category category = Category(name:categoryNameController.text,imageUrl: imageUrl);
  //     Category newCategory = await FireStoreHelper.fireStoreHelper.addCategoryToFireStore(category);
  //     categories.add(newCategory);
  //     //getAllCategory();
  //   }
  // }
  getAllCategory()async{
    categories = await FireStoreHelper.fireStoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }
  updateCategory(Category category)async{
    String? imageUrl;
    if(selectedImage!=null){
       imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Category newCategory = Category(name: categoryNameController.text, imageUrl: imageUrl??category.imageUrl);
    newCategory.catId=category.catId;
   await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
   selectedImage=null;
   categoryNameController.clear();
   getAllCategory();
  }
  deleteCategory(Category category)async{
   await  FireStoreHelper.fireStoreHelper.deleteCategory(category);
   categories.removeWhere((element) => element.catId==category.catId);
   notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  getAllProduct(String catId)async{
    products = await FireStoreHelper.fireStoreHelper.getAllProduct(catId);
    notifyListeners();
  }
  addNewProduct(String catId)async{
    if(selectedImage!=null){
      String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Product product = Product(name: ProductNameController.text, description: ProductDescController.text, price: num.parse(ProductPriceController.text), quantity: int.parse(ProductQuantityController.text), image: imageUrl);
      Product newproduct =await FireStoreHelper.fireStoreHelper.addNewProduct(product,catId);
      // selectedImage=null;
      // categoryNameController.clear();
      selectedImage=null;
      ProductNameController.clear();
      ProductPriceController.clear();
      ProductDescController.clear();
      ProductQuantityController.clear();
      products.add(newproduct);
      notifyListeners();
      getAllProduct(catId);
    }
  }
  deleteProduct(Product product,String catId)async{
    await  FireStoreHelper.fireStoreHelper.deleteProduct(product,catId);
    getAllProduct(catId);
    //notifyListeners();
  }
  updateProduct(Product product,String catId)async{
    String? imageUrl;
    if(selectedImage!=null){
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Product newproduct = Product(
        name: ProductNameController.text,
        description: ProductDescController.text,
        price: num.parse(ProductPriceController.text),
        quantity: int.parse(ProductQuantityController.text),
        image: imageUrl??product.image);
    newproduct.id =product.id;
    await FireStoreHelper.fireStoreHelper.updateProduct(newproduct,catId);
    selectedImage=null;
    ProductNameController.clear();
    ProductPriceController.clear();
    ProductDescController.clear();
    ProductQuantityController.clear();
    notifyListeners();
    getAllProduct(catId);
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////
  // addNewSliders()async{
  //   if(selectedImage!=null){
  //     String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
  //     SliderModel sliderModel = SliderModel(title:sliderNameController.text,imagesliderUrl: imageUrl);
  //     FireStoreHelper.fireStoreHelper.addSlidersToFireStore(sliderModel);
  //     notifyListeners();
  //     // selectedImage=null;
  //     // sliderNameController.clear();
  //     getAllSliders();
  //   }
  // }
  // getAllSliders()async{
  //   slidersList = await FireStoreHelper.fireStoreHelper.getSlidersFromFireStore();
  //   notifyListeners();
  // }
  //
  // deleteSliders(SliderModel sliderModel)async{
  //   await  FireStoreHelper.fireStoreHelper.deleteSliders(sliderModel);
  //   slidersList.removeWhere((element) => element.sliderid==sliderModel.imagesliderUrl);
  //   notifyListeners();
  //   getAllSliders();
  //
  // }
  getAllsliders()async{
    imagesliderslist=await FireStoreHelper.fireStoreHelper.getAllSliders();
    notifyListeners();

  }
  addNewSlider()async{
    if(selectedImage!=null){
      String imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
      SliderModel imageSliders=SliderModel(imagesliderUrl: imageUrl, title: sliderNameController.text);
      FireStoreHelper.fireStoreHelper.addNweSlider(imageSliders);
      imagesliderslist.add(imageSliders);
      notifyListeners();
      selectedImage=null;
      sliderNameController.clear();
      getAllsliders();

    }

  }
  deleteSlider(SliderModel sliderModel){

    FireStoreHelper.fireStoreHelper.deleteSlider(sliderModel);
    imagesliderslist.removeWhere((element) => element.sliderid==sliderModel.imagesliderUrl);
    notifyListeners();
    getAllsliders();
  }
}
