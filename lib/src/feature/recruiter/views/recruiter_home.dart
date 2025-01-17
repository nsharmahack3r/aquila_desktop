import 'package:aquila/src/feature/recruiter/controller/recruiter_home_controller.dart';
import 'package:aquila/src/feature/recruiter/widgets/recruiter_list.dart';
import 'package:aquila/src/feature/recruiter/widgets/recruiter_preview.dart';
import 'package:aquila/src/model/recruiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecruiterHome extends ConsumerStatefulWidget {
  const RecruiterHome({super.key});

  @override
  ConsumerState<RecruiterHome> createState() => _RecruiterHomeState();
}

class _RecruiterHomeState extends ConsumerState<RecruiterHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(recruiterHomeControllerProvider.notifier)
          .getAllRecruiters(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("Recruiters"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(recruiterHomeControllerProvider);
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Failed to get recruiters"),
                TextButton(
                    onPressed: () {
                      ref
                          .read(recruiterHomeControllerProvider.notifier)
                          .retry(context: context);
                    },
                    child: const Text("Retry")),
              ],
            ));
          }
          return Row(
            children: [
              const Flexible(child: RecruiterList()),
              Consumer(
                builder: (context, ref, child) {
                  final focusedRecruiter = ref.watch(
                      recruiterHomeControllerProvider
                          .select((value) => value.focusedRecruiter));
                  return Flexible(
                    child: RecruiterPreview(
                      key: Key(focusedRecruiter?.id ?? ""),
                      recruiter: focusedRecruiter ?? Recruiter.empty(),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
