import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/controllers/product_controller.dart';
import 'package:interview_task/layouts/detailspage.dart';

class MyHomePage extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SupplyLine Products'),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: controller.searchquery.value,
                  decoration: InputDecoration(
                      hintText: 'Search by name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      controller
                          .searchByProduct(controller.searchquery.value.text);
                    },
                    child: Text('Search')),
                controller.isloading.value
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: controller.model.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailsPage(), arguments: [
                                  controller.model[index].product_name,
                                  controller.model[index].image,
                                  controller.model[index].description,
                                  controller.model[index].stock,
                                  controller.model[index].seller,
                                  controller.model[index].charge!.current_charge,
                                  controller.model[index].charge!.selling_price,
                                  controller.model[index].charge!.profit,
                                ]);
                              },
                              child: Card(
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  height: 267,
                                  width: 164,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        controller.model[index].image
                                            .toString(),
                                        height: 100,
                                        width: 87,
                                      ),
                                      Text(
                                        controller.model[index].product_name
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Buy: ' +
                                                    controller.model[index]
                                                        .charge!.current_charge
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Profit: ' +
                                                    controller.model[index]
                                                        .charge!.profit
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Sell: ' +
                                                    controller.model[index]
                                                        .charge!.selling_price
                                                        .toString()),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
