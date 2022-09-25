import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:interview_task/models/products.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Products>> fetchPostbyCategory(String query) async{
    final response = await Dio(BaseOptions(baseUrl: "https://panel.supplyline.network/api/product/"))
        .get("search-suggestions/?format=json&limit=10&search="+query);
    final List data = response.data['data']['products']['results'];
    print(data);
    return data.map((e) => Products.fromJson(e)).toList();
  }
}
