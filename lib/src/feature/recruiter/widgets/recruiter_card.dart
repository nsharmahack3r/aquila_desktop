import 'package:aquila/src/model/recruiter.dart';
import 'package:flutter/material.dart';

class RecruiterCard extends StatelessWidget {
  const RecruiterCard({
    super.key,
    required this.recruiter,
    required this.onTap,
    this.isSelected = false,
  });

  final Recruiter recruiter;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              MaterialButton(
                shape: !isSelected
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.grey, width: 0.2),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                            color: Colors.deepPurple, width: 1.0),
                      ),
                padding: const EdgeInsets.all(24.0),
                onPressed: onTap,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          recruiter.email,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        isSelected
            ? Container(
                color: Colors.deepPurple,
                height: 2.0,
                width: 20,
              )
            : const SizedBox(
                width: 20,
              ),
      ],
    );
  }
}
