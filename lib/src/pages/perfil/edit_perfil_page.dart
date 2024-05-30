import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maria/src/model/user.dart';
import 'package:maria/src/pages/perfil/button_widget.dart';
import 'package:maria/src/pages/perfil/profile_widget.dart';
import 'package:maria/src/pages/perfil/textfield_widget.dart';
import 'package:maria/src/users/user_preferences.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class EditPerfilPage extends StatefulWidget {
  const EditPerfilPage({super.key});

  @override
  State<EditPerfilPage> createState() => _EditPerfilPageState();
}

class _EditPerfilPageState extends State<EditPerfilPage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = 
                await File  (image.path).copy(imageFile.path);

                setState(() {
                  user = user.copy(imagePath: newImage.path);
                });
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "Full Name",
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "Email",
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: "About",
              text: user.about,
              maxlines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: "guardar",
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
              onCliked: () {},
            ),
          ],
        ),
      );

  
  buildAppBar(BuildContext context) {
    final icon = CupertinoIcons.moon_stars;

    return AppBar(
      leading: BackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(icon),
        ),
      ],
    );
  }
    
  }
