
import 'package:firebase_auth/firebase_auth.dart';

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
      body: Container(),
    );
  }
}
