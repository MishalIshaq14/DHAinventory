
import 'package:dha/Activity/DevCat/DevelopCommercial.dart';
import 'package:dha/Activity/chooseSector1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Activity/DevCat/DevA2KDataStore.dart';
import 'Activity/DevCat/DevelopResidential3.dart';
import 'Activity/rough.dart';
import 'firebase_options.dart';
import 'loading Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBzOIDfw1_7LBH8i69I4oVxYloGdzU0-lw",
            appId: "1:783459693324:web:74d4bdfe45c86b9c578f29",
            messagingSenderId: "783459693324",
            projectId: "dhainventory-2337e",
          storageBucket: "dhainventory-2337e.appspot.com",
        ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const DHA());
}

class DHA extends StatefulWidget {
  const DHA({super.key});

  @override
  State<DHA> createState() => _DHAState();
}

class _DHAState extends State<DHA> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DHA Inventory",
      home: LoadingScreen(),
    );
  }
}
