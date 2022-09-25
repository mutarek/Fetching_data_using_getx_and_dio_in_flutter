import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products.dart';
import '../services/api_service.dart';

class ProductController extends GetxController{
  var searchquery = TextEditingController().obs;
  var query = ''.obs;
  var model = <Products>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }
  void searchByProduct(String query){
    if(query.isEmpty){
      Get.snackbar('Error', 'Query is empty',snackPosition: SnackPosition.BOTTOM);
    }
    else
      {
        getPost(query);
      }
  }

  void getPost(String categoryid) async{
    isloading(true);
    print(categoryid);
    var data = await ApiService().fetchPostbyCategory(categoryid);
    if(data.length>0)
    {
      model.clear();
      model.addAll(data);
      print(model);
      isloading(false);
    }
  }
}