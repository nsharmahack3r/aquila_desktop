import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorIndexProvider = StateProvider((ref) {
  return 0;
});

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    const options = [
      "Home",
      "Active Candidates",
      "All Candidates",
      "Recruiters",
      "Settings",
    ];

    return Material(
        child: Container(
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(32.0),
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: const Text(
                  "Aqulia",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) => NavigatorOption(title: options[index], index: index),
              ),
            ],
          ),
        ),
      );
  }
}

class NavigatorOption extends ConsumerWidget {
  const NavigatorOption({
    super.key,
    required this.title,
    this.selected = false,
    required this.index,
  });

  final String title;
  final bool selected;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      elevation: 0.0,
      color: ref.watch(navigatorIndexProvider) == index ? Colors.grey.shade300 : Colors.white,
      onPressed: () {
        ref.read(navigatorIndexProvider.notifier).update((state) => index );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
