import 'package:first_app/folder/formation_class.dart';

void dartProgramming() {
  print("hello word");
  dynamic name = "papa";
  name = 0;
  print(name);
  List list = ["one","two","tree"];
  Map map = {
    "firstname" : "One",
    "lastname" : "two"
  };
  for(int i=0 ; i<list.length; i++){
    print(list[i]);
  }
  print(map["firstname"]);

  ///FORMATION CLASS

  Formation().setDate("New date");

  print(Formation().getDate());
}