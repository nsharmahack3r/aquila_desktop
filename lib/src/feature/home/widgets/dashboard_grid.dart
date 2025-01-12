import 'package:aquila/src/feature/home/controller/home_controller.dart';
import 'package:aquila/src/feature/home/widgets/dashboard_grid_item.dart';
import 'package:aquila/src/feature/home/widgets/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardGrid extends ConsumerWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(
      homeControllerProvider.select((value) => value.loading),
    );

    if (loading) {
      return const HomeLoadingIndicator();
    }

    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 1300 ? (width < 1000 ? 1 : 2) : 3;

    final stats = ref.watch(
      homeControllerProvider.select((value) => value.stats),
    );

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 2.0,
      children: [
        DashBoardGridItem(
          heading: "${stats.totalCandidates}",
          subHeading: "Total Candidates",
          icon: Icons.person,
        ),
        DashBoardGridItem(
          heading: "${stats.activeCandidates}",
          subHeading: "Active Candidates",
          icon: Icons.person,
        ),
        DashBoardGridItem(
          heading: "${stats.totalRecruiters}",
          subHeading: "Recruiters",
          icon: Icons.factory_rounded,
        ),
        DashBoardGridItem(
          heading: "${stats.interviewCandidates}",
          subHeading: "Interviewing",
          icon: Icons.video_call,
        )
      ],
    );
  }
}
