class Product {
 late String id;
 late String name;
 late String description;
 late num price;
 late int quantity;
 late String image;
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,

  });
  Product.fromMap(Map<String,dynamic> map){
    id=map['id'];
    name=map['name'];
    price=map['price'];
    quantity=map['quantity'];
    description=map['description'];
    image=map['image'];
  }
  toMap(){
    return{
      'name':name,
      'price':price,
      'quantity':quantity,
      'description':description,
      'image':image,
    };
  }
}