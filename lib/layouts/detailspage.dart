import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../controllers/detail_product.dart';
import 'package:charcode/html_entity.dart';

class DetailsPage extends StatelessWidget {
final con = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:  Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(con.p_image.value,
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain,),
                Text(con.p_name.value,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                postContent(con.p_des.value),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Total Stock: '+con.p_stock.value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Seller : '+con.p_seller.value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('C R: '+con.p_current.value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('S P : '+con.p_selling.value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text('Profit : '+con.p_profit.value,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.green))
              ],
            )
        ),
      )
    );
  }
}
Widget postContent(htmlContent) {
  return Html(
    data: htmlContent,
  );
}