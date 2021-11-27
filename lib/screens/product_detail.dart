import 'package:api_practice/service/api_service.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final int id;

  const ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: FutureBuilder(
          future: ApiServie().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                // margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data['image']),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(children: [
                      Text(
                        snapshot.data['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data['description']),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          }),
    );
  }
}
