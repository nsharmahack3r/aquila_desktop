import 'package:aquila/src/common/widget/form_info_component.dart';
import 'package:aquila/src/model/candidate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CandidatePreview extends ConsumerStatefulWidget {
  const CandidatePreview({
    super.key,
    required this.candidate,
  });

  final Candidate candidate;

  @override
  ConsumerState<CandidatePreview> createState() => _CandidatePreviewState();
}

class _CandidatePreviewState extends ConsumerState<CandidatePreview> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _experienceController = TextEditingController();
  final _locationController = TextEditingController();
  final _roleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.candidate.name;
    _emailController.text = widget.candidate.email;
    _phoneController.text = widget.candidate.phone ?? '';
    _experienceController.text = widget.candidate.experience.toString();
    _locationController.text = widget.candidate.location;
    _roleController.text = widget.candidate.role;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.fromLTRB(0, 20.0, 20.0, 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.deepPurple, width: 1.0),
      ),
      child: Column(
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
            controller: _phoneController,
            title: "Phone",
          ),
          FormInfoComponent(
            controller: _experienceController,
            title: "Experience",
          ),
          FormInfoComponent(
            controller: _locationController,
            title: "Location",
          ),
          FormInfoComponent(
            controller: _roleController,
            title: "Role",
          ),
        ],
      ),
    );
  }
}
