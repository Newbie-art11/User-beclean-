import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Besi",
      "price": "Rp.20.000",
    },
    {
      "name": "Besi",
      "price": "Rp.20.000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Cari Produk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.red, width: 1.0))),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            title: Text(
                              products[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(products[index]['price']),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
    );
  }
}
