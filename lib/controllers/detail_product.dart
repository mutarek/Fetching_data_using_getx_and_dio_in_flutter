import 'package:get/get.dart';

class DetailController extends GetxController{
  var p_name = Get.arguments[0].toString().obs;
  var p_image = Get.arguments[1].toString().obs;
  var p_des = Get.arguments[2].toString().obs;
  var p_stock = Get.arguments[3].toString().obs;
  var p_seller = Get.arguments[4].toString().obs;
  var p_current = Get.arguments[5].toString().obs;
  var p_selling = Get.arguments[6].toString().obs;
  var p_profit = Get.arguments[7].toString().obs;
}