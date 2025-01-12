import 'package:aquila/src/feature/candidate/views/active_candidates_home.dart';
import 'package:aquila/src/feature/candidate/views/candidate_home.dart';
import 'package:aquila/src/feature/home/views/home.dart';
import 'package:aquila/src/feature/home/widgets/app_navigator.dart';
import 'package:aquila/src/feature/recruiter/views/recruiter_home.dart';
import 'package:aquila/src/feature/settings/views/settings_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppNavigator(),
        Container(
          width: 2.0,
          color: Colors.grey.shade100,
        ),
        Flexible(
          flex: 3,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Consumer(
              builder: (context, ref, child) {
                final index = ref.watch(navigatorIndexProvider);
                return IndexedStack(
                  index: index,
                  children: const [
                    HomeView(),
                    ActiveCandidatesHome(),
                    CandidateHome(),
                    RecruiterHome(),
                    SettingsHome(),
                  ],
                );
              }
            ),
          ),
        ),
      ],
    );
  }
}