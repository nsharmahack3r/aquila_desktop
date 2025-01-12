import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Mr.Sharma!",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 36,
            ),
            Flexible(child: HomeStatsGrid()),
          ],
        ),
      ),
    );
  }
}

class HomeStatsGrid extends StatelessWidget {
  const HomeStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    print(width);

    final crossAxisCount = width < 1300 ? ( width < 1000 ? 1 : 2 ) : 3;

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.0,
      children: const [
        HomeCard(
          heading: "142",
          subHeading: "Total Candidates",
          icon: Icons.person,
        ),
        HomeCard(
          heading: "12",
          subHeading: "Active Candidates",
          icon: Icons.person,
        ),
        HomeCard(
          heading: "8",
          subHeading: "Recruiters",
          icon: Icons.factory_rounded,
        ),
        HomeCard(
          heading: "4",
          subHeading: "Interviewing",
          icon: Icons.video_call,
        )
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {super.key,
      required this.heading,
      required this.subHeading,
      required this.icon});

  final String heading;
  final String subHeading;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
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
