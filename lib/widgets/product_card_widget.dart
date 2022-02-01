import 'package:flutter/material.dart';
import 'package:flutter_with_backend_api/models/product.dart';

class ProductCardWidget extends StatefulWidget{
  late Product product;
  ProductCardWidget(Product product){
    this.product=product;
  }
  @override
  State<StatefulWidget> createState() {
    return _ProductCardWidgetState();
  }

}

class _ProductCardWidgetState extends State<ProductCardWidget>{
  @override
  Widget build(BuildContext context) {
    return buildProductCard(context);
  }

  Widget buildProductCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.description_sharp),
                SizedBox(width: 10,),
                Flexible(child: Text(widget.product.productName,style: TextStyle(fontSize: 18),))

              ],
            ),
            SizedBox(height: 10,),
            Text("Unit Price: "+widget.product.unitPrice.toString(),
              style: TextStyle(
                  color: Colors.green.shade700,fontSize: 15),),
          ],
        ),
      ),
    );
  }
}