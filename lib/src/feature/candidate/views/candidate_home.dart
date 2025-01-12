import 'package:aquila/src/feature/candidate/widget/candidate_list.dart';
import 'package:flutter/material.dart';

class CandidateHome extends StatelessWidget {
  const CandidateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text("All Candidates"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: const CandidateList(),
    );
  }
}
