import 'package:aquila/src/feature/home/controller/home_controller.dart';
import 'package:aquila/src/feature/home/widgets/dashboard_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeControllerProvider.notifier).getHomeStats(context: context);
    });
  }

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
            Flexible(
              child: DashboardGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
