import 'dart:convert';

import 'package:api_explore/Models/super_store_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreScreen extends StatelessWidget {
  // const StoreScreen({Key? key}) : super(key: key);

  List<SuperStoreModel> productList = [];
  Future<SuperStoreModel> getproduct() async {
    final response = await http
        .get(Uri.parse('http://dubaisuperstore.com.pk/myapi/SkuCategory'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      return SuperStoreModel.fromJson(data);
    } else {
      return SuperStoreModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dubai Super Store"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getproduct(),
                builder: (context, AsyncSnapshot<SuperStoreModel> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.skuCategoryDetail!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: [
                                Image.network(snapshot
                                    .data!.skuCategoryDetail![index].imageUrl1
                                    .toString()),
                                Text(snapshot
                                    .data!.skuCategoryDetail![index].name
                                    .toString())
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
