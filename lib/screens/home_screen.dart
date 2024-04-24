import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/controllers/voting_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final votingController = Get.find<VotingController>();
  @override
  Widget build(BuildContext context) {
    return votingController.getBallotInfo();
  }
}
