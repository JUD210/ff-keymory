import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjpks2zhEqeZwXKsbO6HwfHkEl-_7I3nA",
            authDomain: "chat-app-o-g-3jw2j0.firebaseapp.com",
            projectId: "chat-app-o-g-3jw2j0",
            storageBucket: "chat-app-o-g-3jw2j0.firebasestorage.app",
            messagingSenderId: "163311012996",
            appId: "1:163311012996:web:2cbb477cc6e455d48d86d1"));
  } else {
    await Firebase.initializeApp();
  }
}
