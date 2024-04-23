import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting/models/candidate_model.dart';

class CandidateController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  var candidates = <CandidateModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCandidates();
  }

  Widget getCandidates() {
    return StreamBuilder(
      stream: _firestore.collection('candidates').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        } else {
          return SingleChildScrollView(
            child: SafeArea(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final CandidateModel candidateModel = CandidateModel.fromJson(
                      snapshot.data!.docs[index].data());
                  candidates.add(candidateModel);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0)),
                      leading: Image.network(
                        candidateModel.symbolImageUrl,
                      ),
                      title: Text(
                        candidateModel.name,
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: Colors.indigo.shade900,
                        child: const Text(
                          'Vote',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
