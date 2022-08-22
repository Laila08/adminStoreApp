class SliderModel {
  late String imagesliderUrl;
  late  String title;
  String?sliderid;
  SliderModel({
    this.sliderid,
    required this.imagesliderUrl,
    required this.title
  });

  SliderModel.fromMap(Map<String,dynamic>map){
    sliderid=map['sliderid'];
    imagesliderUrl=map['imagesliderUrl'];
    title=map['title'];


  }
  toMap(){
    return{
      'imagesliderUrl':imagesliderUrl,
      'title':title
    };
  }

}