import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/counselling_controller.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/parent_guardian_model.dart';
import '../../../data/models/co_curricular_model.dart';
import '../../../data/models/placement_offer_model.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../../data/models/placement_training_model.dart';

class CounsellingRecordView extends StatelessWidget {
  final int studentProfileId;
  final bool canEdit; // true when opened by faculty/advisor

  const CounsellingRecordView({
    super.key,
    required this.studentProfileId,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      CounsellingController(studentProfileId: studentProfileId),
      tag: 'counselling_$studentProfileId',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Counselling Record')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.record.value == null) {
          return const Center(child: Text('No counselling record found.'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _sectionTitle('Personal & Academic Details'),
            _personalCard(controller),
            const SizedBox(height: 20),

            _sectionTitle('Parent / Guardian'),
            ...controller.guardians.map(_guardianCard),
            const SizedBox(height: 20),

            _sectionTitle('Semester-wise Academic Record'),
            ...controller.semesters.map((sem) => _semesterCard(controller, sem)),
            const SizedBox(height: 20),

            _sectionTitle('Placement Training Attended'),
            ...controller.trainings.map(_trainingCard),
            if (controller.trainings.isEmpty) _emptyHint('No training records yet.'),
            const SizedBox(height: 20),

            _sectionTitle('Co-Curricular Activities & Achievements'),
            ...controller.activities.map(_activityCard),
            if (controller.activities.isEmpty) _emptyHint('No activities recorded yet.'),
            const SizedBox(height: 20),

            _sectionTitle('Placement / Internship Offers'),
            ...controller.offers.map(_offerCard),
            if (controller.offers.isEmpty) _emptyHint('No offers recorded yet.'),
            const SizedBox(height: 20),

            _sectionTitle('Advisor Meeting Log'),
            ...controller.meetingLogs.map(_meetingLogCard),
            if (canEdit) _addMeetingLogButton(context, controller),
          ],
        );
      }),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.navy)),
      );

  Widget _emptyHint(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.black38)),
      );

  Widget _personalCard(CounsellingController c) {
    final r = c.record.value!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _kv('Blood Group', r.bloodGroup ?? '-'),
            _kv('Category', r.category ?? '-'),
            _kv('Permanent Address', r.permanentAddress),
            if (r.currentAddress != null) _kv('Current Address', r.currentAddress!),
            _kv('Emergency Contact', '${r.emergencyContactName} (${r.emergencyContactPhone})'),
            if (r.medicalConditions != null) _kv('Medical Notes', r.medicalConditions!),
            _kv('Transport', r.transportMode.name + (r.busRouteNumber != null ? ' - Route ${r.busRouteNumber}' : '')),
            if (r.tenthPercentage != null) _kv('10th %', r.tenthPercentage!.toStringAsFixed(1)),
            if (r.twelfthPercentage != null) _kv('12th %', r.twelfthPercentage!.toStringAsFixed(1)),
            if (r.scholarshipDetails != null) _kv('Scholarship', r.scholarshipDetails!),
            if (r.siblingDetails != null) _kv('Sibling', r.siblingDetails!),
            if (r.higherStudiesPlan != null) _kv('Higher Studies Plan', r.higherStudiesPlan!),
          ],
        ),
      ),
    );
  }

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            children: [
              TextSpan(text: '$k: ', style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.navy)),
              TextSpan(text: v),
            ],
          ),
        ),
      );

  Widget _guardianCard(ParentGuardianModel g) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.teal.withOpacity(0.15),
          backgroundImage: g.photoPath != null ? AssetImage(g.photoPath!) : null,
          child: g.photoPath == null ? const Icon(Icons.person, color: AppTheme.teal) : null,
        ),
        title: Text(g.name),
        subtitle: Text('${g.relation.name[0].toUpperCase()}${g.relation.name.substring(1)} • ${g.occupation ?? '-'} • ${g.phone}'),
      ),
    );
  }

  Widget _semesterCard(CounsellingController c, sem) {
    final subjects = c.subjectsBySemester[sem.id] ?? [];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text('Semester ${sem.semesterNumber}', style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          'SGPA: ${sem.sgpa?.toStringAsFixed(2) ?? "-"} • Attendance: ${sem.attendancePercent?.toStringAsFixed(0) ?? "-"}% • Arrears: ${sem.arrearCount}',
          style: const TextStyle(fontSize: 12),
        ),
        children: subjects.map((sub) => ListTile(
          dense: true,
          title: Text(sub.subjectName),
          subtitle: Text('${sub.subjectCode} • CIA: ${sub.ciaMarks ?? "-"} • Exam: ${sub.semesterExamMarks ?? "-"}'),
          trailing: Text(sub.grade ?? '-', style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.teal)),
        )).toList(),
      ),
    );
  }

  Widget _trainingCard(PlacementTrainingModel t) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(t.isInCollege ? Icons.school : Icons.business, color: AppTheme.teal),
        title: Text(t.title),
        subtitle: Text('${t.provider} • ${DateFormat('MMM yyyy').format(t.startDate)}${t.description != null ? '\n${t.description}' : ''}'),
        isThreeLine: t.description != null,
      ),
    );
  }

  Widget _activityCard(CoCurricularModel a) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.emoji_events_outlined, color: AppTheme.teal),
        title: Text(a.title),
        subtitle: Text('${a.category.name} • ${a.level.name}${a.achievement != null ? ' • ${a.achievement}' : ''}'),
      ),
    );
  }

  Widget _offerCard(PlacementOfferModel o) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.work_outline, color: AppTheme.teal),
        title: Text('${o.role} @ ${o.companyName}'),
        subtitle: Text('${o.type.name} • ${o.packageOrStipend} • ${o.status.name}'),
      ),
    );
  }

  Widget _meetingLogCard(log) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.event_note_outlined, color: AppTheme.navy),
        title: Text(DateFormat('MMM d, yyyy').format(log.date)),
        subtitle: Text(log.notes),
        trailing: log.followUpNeeded ? const Icon(Icons.flag, color: Colors.orange, size: 18) : null,
      ),
    );
  }

  Widget _addMeetingLogButton(BuildContext context, CounsellingController c) {
    final textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Add Meeting Note'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('New Meeting Note'),
              content: TextField(
                controller: textController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Notes from this counselling session...'),
              ),
              actions: [
                TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                ElevatedButton(
                  onPressed: () {
                    if (textController.text.trim().isEmpty) return;
                    // facultyId should come from AuthController.to.currentUser.value!.facultyProfileId!
                    c.addMeetingLog(facultyId: AuthController.to.currentUser.value!.facultyProfileId!, notes: textController.text.trim());
                    Get.back();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}