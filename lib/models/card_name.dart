class CardName {
  int nameId;
  String name;
  String desc;
  String gender;

  CardName({this.nameId, this.name, this.gender, this.desc });

  CardName.fromJson(Map<String, dynamic> json){
    nameId = json['nameId'];
    name = json['name'];
    desc = json['desc'];
    gender = json['gender'];
  }


}
