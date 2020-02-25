class CardName {
  String name;
  String desc;
  String gender;

  CardName({ this.name, this.gender, this.desc });

  CardName.fromJson(Map<String, dynamic> json){
    name = json['name'];
    desc = json['desc'];
    gender = json['gender'];
  }


}
