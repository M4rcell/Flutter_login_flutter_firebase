
import 'package:flutter/material.dart';
import 'package:login_firebase/class/animal.dart';

class CardViewAnimal extends StatelessWidget {
  //const CardViewAnimal({Key key}) : super(key: key);
  Animal animal;
  BuildContext context;

  CardViewAnimal({this.animal,this.context});

  @override
  Widget build(BuildContext context) {
    return Card(
     child: Column(
       children: <Widget>[
         Container(
           height: 144.0,
           width: 500,
           color: Colors.green,
           child: FadeInImage.assetNetwork(
             placeholder: null,
             image: animal.image,
             height: 144.0,
             width: 160.0,
            ),
         ),

         Padding(
           padding: EdgeInsets.all(7.0),
           child: Row(
             children: <Widget>[

               Padding(
                 padding: EdgeInsets.all(7.0),
                 child: Icon(Icons.pets),
               ),

               Padding(
                 padding: EdgeInsets.all(7.0),
                 child: Text(animal.name,style: TextStyle(fontSize: 18.0),),
               ),


               Padding(
                 padding: EdgeInsets.all(7.0),
                 child: Icon(Icons.cake),
               ),

               Padding(
                 padding: EdgeInsets.all(7.0),
                 child: Text(animal.age,style: TextStyle(fontSize: 18.0),),
               ),
             ],
           ),
          )
       ],
     ),
    );
  }
}