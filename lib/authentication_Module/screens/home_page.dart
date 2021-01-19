
import 'package:bmg_project/lessons_Module/screens/home_screen.dart';
import 'package:bmg_project/pano_Module/panoHome.dart';
import 'package:bmg_project/question_module/question_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'signin_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANA SAYFA"),
        
        actions: [
          //! Builder eklemezsek Scaffold.of() hata verecektir!
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                await _auth.signOut();
                
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Başarıyla çıkış yapıldı"),
                ));

                Navigator.pushReplacement(
                  // sadece push kullanılırsa çıkıştan sonra geri giriş yapmış gibi görünüyor.Bu sayfayı bir sonrakinin üzreine yazar.
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
            ),
          )
        ],
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Container(
        child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: "Dersler",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  HomeScreen(),
                ),
              ),
            ),
            
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
          ),
          Container(
        child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: "Bilgi Testi",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  BilgiTesti(),
                ),
              ),
            ),
            
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
          ),
          Container(
        child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: "Pano",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  Pano(),
                ),
              ),
            ),
            
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
          ),
        ],
      )
    );
  }
}
