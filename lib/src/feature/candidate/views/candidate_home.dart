import 'package:aquila/src/feature/candidate/widget/candidate_list.dart';
import 'package:flutter/material.dart';

class CandidateHome extends StatelessWidget {
  const CandidateHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("All Candidates"),
      ),
      body: const CandidateList(),
    );
  }
}