import 'package:get/get.dart';
import 'package:voting/controllers/candidate_controller.dart';
import 'package:voting/controllers/voting_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(CandidateController());
    Get.put(VotingController());
  }
}
