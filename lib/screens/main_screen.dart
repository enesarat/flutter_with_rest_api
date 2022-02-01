import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_with_backend_api/data/api/category_api.dart';
import 'package:flutter_with_backend_api/data/api/product_api.dart';
import 'package:flutter_with_backend_api/models/category.dart';
import 'package:flutter_with_backend_api/models/product.dart';
import 'package:flutter_with_backend_api/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }

}

class _MainScreenState extends State{
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];
  List<Widget> productWidgets = <Widget>[];
  int selectedCategoryIndex=0;
  @override
  void initState() {
    getCategoriesFromApi();
    getAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e-commmerce"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children:<Widget> [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:categoryWidgets,
              ),
            ),
            ProductListWidget(products)

          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories = list.map((ctg) => Category.fromJson(ctg)).toList();
        buildCategoriesWidget();
      });
    });
  }

  List<Widget> buildCategoriesWidget() {
    for(int i=0;i<categories.length;i++){
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category ctg) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
          onPressed: (){
            setState(() {
              selectedCategoryIndex=ctg.id;

            });
            getProductsByCategory(ctg);
            print(ctg.id);
            print(selectedCategoryIndex);

          },
          child: Text(ctg.categoryName,style: TextStyle(color: Colors.blueGrey.shade600),),
          style: ButtonStyle(
            backgroundColor: selectedCategoryIndex == ctg.id ?  MaterialStateProperty.all<Color>(Colors.blueGrey.shade700) :  MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blueGrey.shade700)
                  )
              )
          )
      ),
    );
  }

  void getProductsByCategory(Category category) {
    ProductApi.getProductsById(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((p) => Product.fromJson(p)).toList();
        //buildProductsWidget();
      });
    });
  }

  void getAllProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((p) => Product.fromJson(p)).toList();
        //buildProductsWidget();
      });
    });
  }

}