import 'package:aquila/src/feature/recruiter/controller/recruiter_home_controller.dart';
import 'package:aquila/src/feature/recruiter/widgets/recruiter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class RecruiterList extends ConsumerWidget {
  const RecruiterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruiters = ref.watch(
      recruiterHomeControllerProvider.select((state) => state.recruiters),
    );

    final focusedRecruiter = ref.watch(
      recruiterHomeControllerProvider.select((state) => state.focusedRecruiter),
    );

    return ImplicitlyAnimatedList(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      items: recruiters,
      itemBuilder: (context, animation, item, i) {
        final recruiter = recruiters[i];

        return SizeFadeTransition(
          sizeFraction: 0.7,
          curve: Curves.easeInOut,
          animation: animation,
          child: RecruiterCard(
            recruiter: recruiter,
            onTap: () {
              ref
                  .read(recruiterHomeControllerProvider.notifier)
                  .setFocusedRecruiter(recruiter);
            },
            isSelected: focusedRecruiter?.id == recruiter.id,
          ),
        );
      },
      areItemsTheSame: (item1, item2) => item1.id == item2.id,
    );
    // return const Placeholder();
  }
}
