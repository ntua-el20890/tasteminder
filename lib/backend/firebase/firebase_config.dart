import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCMuK0TeWyoufPRvAu78NpJ9x5f9hW9fLY",
            authDomain: "tasteminder-9s8bma.firebaseapp.com",
            projectId: "tasteminder-9s8bma",
            storageBucket: "tasteminder-9s8bma.appspot.com",
            messagingSenderId: "164584563464",
            appId: "1:164584563464:web:973c3a4c0b6a8e717c42bd"));
  } else {
    await Firebase.initializeApp();
  }
}
