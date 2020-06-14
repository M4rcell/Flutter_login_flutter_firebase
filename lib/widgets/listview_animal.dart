
import 'package:flutter/material.dart';
import 'package:login_firebase/class/animal.dart';
import 'package:login_firebase/widgets/cardview_animal.dart';

class ListViewAnimal extends StatefulWidget {
  //ListViewAnimal({Key key}) : super(key: key);
  
  BuildContext context;

  ListViewAnimal({this.context});
  @override
  _ListViewAnimalState createState() => _ListViewAnimalState();
}

class _ListViewAnimalState extends State<ListViewAnimal> {

  List<Animal> animal = new List();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,//se adapte al co0ntenido
      itemCount: animal.length,
      itemBuilder: (BuildContext context,int index){

        return CardViewAnimal(animal: animal[index],context: context,);
      },
    );
  }
}