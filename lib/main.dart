import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/controllers/candidate_controller.dart';
import 'package:voting/firebase_options.dart';
import 'package:voting/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CandidateController());
    return MaterialApp(
      title: 'Voting',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
