import 'package:flutter/material.dart';

class DashBoardGridItem extends StatelessWidget {
  const DashBoardGridItem(
      {super.key,
      required this.heading,
      required this.subHeading,
      required this.icon});

  final String heading;
  final String subHeading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: Colors.grey, width: 0.2),
      ),
      onPressed: () {},
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.grey,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subHeading,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
