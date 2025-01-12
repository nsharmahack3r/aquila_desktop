import 'package:aquila/src/feature/candidate/widget/candidate_list.dart';
import 'package:flutter/material.dart';

class ActiveCandidatesHome extends StatelessWidget {
  const ActiveCandidatesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        title: const Text("Active Candidates"),
      ),
      body: const CandidateList(),
    );
  }
}
