import 'dart:io';

import 'package:flutter/material.dart';


class ProfileWidget extends StatelessWidget {

  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Color.fromARGB(2, 4, 2, 1);

    return Center(
      child: Stack(
        children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
        ),
      ]),
    );

  }
  
  
   Widget  buildImage() {
    final image = imagePath.contains("http://")
    ? NetworkImage(imagePath) 
    : FileImage( File(imagePath));

    return ClipOval(
      child: Material(
        color: Color.fromARGB(255, 51, 70, 6),

      child: Ink.image(
      image: image as ImageProvider,
      fit: BoxFit.cover,
      width: 128,
      height: 128,
      child: InkWell(
        onTap: onClicked,
      ),
    )
    )
    );
    }
    
  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.blue,
        all: 3,
        
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
        
        ),
      
      );
    
    
      Widget buildCircle({
        required Color color, 
        required int all, 
        required Icon child
}) =>
         ClipOval(
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: child,
         
        )
        );


  }