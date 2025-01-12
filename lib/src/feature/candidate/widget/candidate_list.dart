import 'package:aquila/src/data/candidates.dart';
import 'package:aquila/src/feature/candidate/widget/candidate_card.dart';
import 'package:flutter/material.dart';

class CandidateList extends StatelessWidget {
  const CandidateList({super.key});

  @override
  Widget build(BuildContext context) {
    final candidates = SampleCandidates.getSampleCandidates();
    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: candidates.length,
      itemBuilder: (context, index) {
        return CandidateCard(candidate: candidates[index]);
      },
    );
  }
}
