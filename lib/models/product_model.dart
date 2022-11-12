class ProductModel {
  int? productId;
  String? productName;
  String? productDesc;
  String? productImage;
  int? productPrice;
  String? productActive;
  String? productPromo;
  String? productDatetime;
  String? productCat;
  String? productImage2;
  String? productImage3;

  ProductModel(
      {this.productId,
      this.productName,
      this.productDesc,
      this.productImage,
      this.productPrice,
      this.productActive,
      this.productPromo,
      this.productDatetime,
      this.productCat,
      this.productImage2,
      this.productImage3});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDesc = json['product_desc'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    productActive = json['product_active'];
    productPromo = json['product_promo'];
    productDatetime = json['product_datetime'];
    productCat = json['product_cat'];
    productImage2 = json['product_image_2'];
    productImage3 = json['product_image_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_desc'] = this.productDesc;
    data['product_image'] = this.productImage;
    data['product_price'] = this.productPrice;
    data['product_active'] = this.productActive;
    data['product_promo'] = this.productPromo;
    data['product_datetime'] = this.productDatetime;
    data['product_cat'] = this.productCat;
    data['product_image_2'] = this.productImage2;
    data['product_image_3'] = this.productImage3;
    return data;
  }
}
