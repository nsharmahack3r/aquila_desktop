import 'package:aquila/src/model/candidate.dart';
import 'package:flutter/material.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard({super.key, required this.candidate,});

  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: () {
          
        },
        leading: const Icon(Icons.person),
        title: Text(candidate.name),
        subtitle: Text(candidate.email),
      ),
    );
  }
}