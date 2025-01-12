import 'package:aquila/src/model/recruiter.dart';
import 'package:flutter/material.dart';

class RecruiterCard extends StatelessWidget {
  const RecruiterCard({
    super.key,
    required this.recruiter,
  });

  final Recruiter recruiter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: const BorderSide(color: Colors.grey, width: 0.2),
          ),
          padding: const EdgeInsets.all(24.0),
          onPressed: () {},
          child: Row(
            children: [
              const CircleAvatar(
                radius: 32.0,
                child: Icon(Icons.work),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recruiter.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(recruiter.email),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
