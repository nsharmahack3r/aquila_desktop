import 'package:aquila/src/common/widget/form_info_component.dart';
import 'package:aquila/src/feature/recruiter/controller/recruiter_controller.dart';
import 'package:aquila/src/model/recruiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecruiterPreview extends ConsumerStatefulWidget {
  const RecruiterPreview({
    super.key,
    required this.recruiter,
  });

  final Recruiter recruiter;

  @override
  ConsumerState<RecruiterPreview> createState() => _RecruiterPreviewState();
}

class _RecruiterPreviewState extends ConsumerState<RecruiterPreview> {
  late final _nameController = TextEditingController(
    text: widget.recruiter.name,
  );

  late final _emailController = TextEditingController(
    text: widget.recruiter.email,
  );
  late final _locationController = TextEditingController(
    text: widget.recruiter.location,
  );
  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(recruiterControllerProvider);

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.fromLTRB(0, 20.0, 20.0, 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.deepPurple, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormInfoComponent(
            controller: _nameController,
            title: "Name",
          ),
          FormInfoComponent(
            controller: _emailController,
            title: "Email",
          ),
          FormInfoComponent(
            controller: _locationController,
            title: "Location",
          ),
          const SizedBox(
            height: 48,
          ),
          loading
              ? const CircularProgressIndicator()
              : Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (widget.recruiter.id.isNotEmpty) {
                          ref
                              .read(recruiterControllerProvider.notifier)
                              .updateRecruiter(
                                name: _nameController.text,
                                email: _emailController.text,
                                location: _locationController.text,
                                context: context,
                              );
                        }

                        ref
                            .read(recruiterControllerProvider.notifier)
                            .createRecruiter(
                              name: _nameController.text,
                              email: _emailController.text,
                              location: _locationController.text,
                              context: context,
                            );

                        // ref
                        //     .read(recruiterControllerProvider.notifier)
                        //     .showMessage(context);
                      },
                      color: Colors.deepPurple,
                      child: Text(
                        widget.recruiter.id.isNotEmpty
                            ? "Update Recruiter"
                            : "Create Recruiter",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    widget.recruiter.id.isEmpty
                        ? const SizedBox.shrink()
                        : MaterialButton(
                            onPressed: () {
                              ref
                                  .read(recruiterControllerProvider.notifier)
                                  .deleteRecruiter(context);
                            },
                            color: Colors.red,
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ],
                )
        ],
      ),
    );
  }
}
