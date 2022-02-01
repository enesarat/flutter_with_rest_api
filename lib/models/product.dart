class Product{
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(this.id,this.categoryId,this.productName,this.quantityPerUnit,this.unitPrice,this.unitsInStock);

  Product.fromJson(Map json){
    id = int.tryParse(json["id"].toString())!;
    categoryId = int.tryParse(json["categoryId"].toString())!;
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = double.tryParse(json["unitPrice"].toString())!;
    unitsInStock = int.tryParse(json["unitsInStock"].toString())!;
  }

  Map toJson(){
    return {"id":id,"categoryId":categoryId,"productName":productName,"quantityPerUnit":quantityPerUnit,"unitPrice":unitPrice,"unitsInStock":unitsInStock};
  }
}