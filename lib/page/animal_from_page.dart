
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:login_firebase/class/animal.dart';

class FormAnimal extends StatefulWidget {
 // FormAnimal({Key key,this.titulo}) : super(key: key);
  
  final String titulo ;
  final Animal animal;
  FormAnimal({this.titulo,this.animal});

  @override
  _FormAnimalState createState() => _FormAnimalState();
}

class _FormAnimalState extends State<FormAnimal> {

  var nameController= TextEditingController();
  var ageController = TextEditingController();
  File galleryFile;
  String urlImage;

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

// traer datos DB para modificar
void initSate(){
  //verificar se envio el objeto animal
  if (widget.animal!=null) {
     nameController.text=widget.animal.name;
     ageController.text = widget.animal.age;
  }
 

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
  //ENVIAR DATOS A FIREBASE
  sendData(){
   saveFirebase(nameController.text).then((_) {
   
     
     DatabaseReference db = FirebaseDatabase.instance.reference().child("Animal");
    
    if (widget.animal!=null){
     // MODIFICAR ANIMAL
      db.child(widget.animal.key).set(getAnimal()).then((_) => Navigator.pop(context)); //modificar y regresae al contexto
       
    }else{
      //Crear un nuevo animal
      db.push().set(getAnimal()).then((_) => Navigator.pop(context));//crear y regresar al home

    }
   
     
   });
    

  }
  Map<String,dynamic> getAnimal(){
    Map<String,dynamic> data = new Map();
    data['name'] = nameController.text;
    data['age']  = ageController.text;
    if (widget.animal!=null && galleryFile==null) {
      
    }
    else{
    
    data['image']  = urlImage!=null?urlImage:"";

    }
   return data;
  }
  //Guaradar imagen en el servidor
  Future<void> saveFirebase(String imageId) async{
    
    if (galleryFile != null) {
      //direcion a guardarse
      StorageReference reference = FirebaseStorage.instance.ref().child('animal').child(imageId);
      //guardar en storage la imagen
      StorageUploadTask uploadTask = reference.putFile(galleryFile);
      //obtener la url para guardar en DB
      StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      
      urlImage= (await downloadUrl.ref.getDownloadURL());
    }
  }

  showImage(){
    if(galleryFile != null){
    return Image.file(galleryFile);
    }
    else{
      //traer datos de img
      if(widget.animal!=null){
        return FadeInImage.assetNetwork(
          placeholder: null, 
          image: widget.animal.image,
          height:800.0 ,
          width: 700.0,
        );
      }
      else{
       return Text("Imagen No Selecionado");
      }
      
    }
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