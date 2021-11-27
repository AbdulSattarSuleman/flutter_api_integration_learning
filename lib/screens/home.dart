import 'package:api_practice/screens/product_detail.dart';
import 'package:api_practice/service/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
          future: ApiServie().getAllPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    title: Text(snapshot.data[index]['title']),
                    subtitle: Text(
                        "Price \$" + snapshot.data[index]['price'].toString()),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetail(snapshot.data[index]['id'])));
                    },
                  );
                },
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.teal,
            ));
          }),
    );
  }
}
