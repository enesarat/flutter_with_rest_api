import 'package:flutter/material.dart';
import 'package:flutter_with_backend_api/models/product.dart';
import 'package:flutter_with_backend_api/widgets/product_card_widget.dart';

class ProductListWidget extends StatefulWidget{
  late List<Product> products = <Product>[];


  ProductListWidget(List<Product> products){
    this.products=products;
  }
  @override
  State<StatefulWidget> createState() {
    return  _ProductListWidgetState();
  }

}

class _ProductListWidgetState extends State<ProductListWidget>{
  @override
  Widget build(BuildContext context) {
    return  buildProductsWidget(context);
  }

  Widget buildProductsWidget(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            widget.products.length,
            (i){
              return Container(
                margin: EdgeInsets.all(8),
                child: ProductCardWidget(widget.products[i])
              );
            }),
      ),
    );
  }
}