
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class FormAnimal extends StatefulWidget {
  FormAnimal({Key key,this.titulo}) : super(key: key);
  
  final String titulo ;

  @override
  _FormAnimalState createState() => _FormAnimalState();
}

class _FormAnimalState extends State<FormAnimal> {

  var nameController= TextEditingController();
  var ageController = TextEditingController();
  File galleryFile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: getFormAnimal(),
      ),
    );
  }

  Widget getFormAnimal(){
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.pets),
          hintText: 'Cual es el nombre del animal',
          labelText: 'Nombre',
          ),
        controller: nameController,
        ),

        TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.cake),
          hintText: 'Cual es la Edad',
          labelText: 'Edad'
          ),
          controller: ageController,
        ),

        RaisedButton(
          onPressed:()=> imageSelectorGallery(ImgSource.Both),
          child: Text('Seleciona una imagen'),

        ),
        SizedBox(
          child: showImage(),
        ),

        RaisedButton(
          onPressed: sendData,
          child: Text('Guardar'),
        )
      ],
    );
  }
  
  sendData(){

  }
  showImage(){
    return Image.file(galleryFile);
  }
  Future imageSelectorGallery(ImgSource source) async {//
    var image = await ImagePickerGC.pickImage(
        context: context,
        source: source,//
        maxHeight: 800.0,
        maxWidth: 700.0,
        cameraIcon: Icon(
          Icons.add,
          color: Colors.red,
        ),//cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    setState(() {
      galleryFile = image;
    });
  }


  /* imageSelectorGallery() async{

    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800.0,
      maxWidth: 700.0,

    );

  } */
}