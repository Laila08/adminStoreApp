class Category{
   String? catId;
   String? name;
   String? imageUrl;
  Category({required this.name,required this.imageUrl});
  Category.fromMap(Map<String,dynamic> map){
    catId=map['catId'];
    name=map['name'];
    imageUrl=map['imageUrl'];
  }
  toMap(){
    return{
      'name':name,
      'imageUrl':imageUrl
    };
  }
}