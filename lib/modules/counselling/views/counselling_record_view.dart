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
import '../../../data/models/counselling_record_model.dart';
import '../../../data/models/semester_record_model.dart';
import '../../../data/models/subject_grade_model.dart';
import '../../../data/models/user_model.dart';

class CounsellingRecordView extends StatelessWidget {
  final int studentProfileId;
  final bool canEdit; // true when opened by faculty/advisor/admin

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

    final currentUser = AuthController.to.currentUser.value;
    final isAdmin = currentUser?.role == UserRole.admin;
    final isStudent = currentUser?.role == UserRole.student;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Counselling Record'),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.record.value == null) {
          return const Center(child: Text('No counselling record found.'));
        }

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _studentHeaderCard(controller),

            // ── Personal Details ──────────────────────────────────────
            _buildSectionHeader(
              'Personal Details',
              trailingAction: (isStudent || isAdmin)
                  ? IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20, color: AppTheme.teal),
                      tooltip: 'Edit',
                      onPressed: () => _showEditPersonalDialog(context, controller),
                    )
                  : null,
            ),
            _personalCard(controller),
            const SizedBox(height: 20),

            // ── Guardians ─────────────────────────────────────────────
            _buildSectionHeader(
              'Parent / Guardian',
              trailingAction: (isStudent || isAdmin)
                  ? TextButton.icon(
                      icon: const Icon(Icons.add, size: 16, color: AppTheme.teal),
                      label: const Text('Add', style: TextStyle(color: AppTheme.teal, fontSize: 13)),
                      onPressed: () => _showGuardianDialog(context, controller),
                    )
                  : null,
            ),
            ...controller.guardians.map(
              (g) => _guardianCard(context, controller, g, isStudent || isAdmin),
            ),
            if (controller.guardians.isEmpty) _emptyHint('No guardian records yet.'),
            const SizedBox(height: 20),

            // ── Academic Record ───────────────────────────────────────
            _buildSectionHeader(
              'Semester-wise Academic Record',
              trailingAction: isAdmin
                  ? TextButton.icon(
                      icon: const Icon(Icons.add, size: 16, color: AppTheme.teal),
                      label: const Text('Add Sem', style: TextStyle(color: AppTheme.teal, fontSize: 13)),
                      onPressed: () => _showSemesterDialog(context, controller),
                    )
                  : null,
            ),
            ...controller.semesters.map((sem) => _semesterCard(context, controller, sem, isAdmin)),
            if (controller.semesters.isEmpty) _emptyHint('No academic records found.'),
            const SizedBox(height: 20),

            // ── Placement Training ────────────────────────────────────
            _buildSectionHeader(
              'Placement Training Attended',
              trailingAction: (isStudent || isAdmin)
                  ? TextButton.icon(
                      icon: const Icon(Icons.add, size: 16, color: AppTheme.teal),
                      label: const Text('Add', style: TextStyle(color: AppTheme.teal, fontSize: 13)),
                      onPressed: () => _showTrainingDialog(context, controller),
                    )
                  : null,
            ),
            ...controller.trainings.map(
              (t) => _trainingCard(context, controller, t, isStudent || isAdmin),
            ),
            if (controller.trainings.isEmpty) _emptyHint('No training records yet.'),
            const SizedBox(height: 20),

            // ── Co-Curricular ─────────────────────────────────────────
            _buildSectionHeader(
              'Co-Curricular Activities & Achievements',
              trailingAction: (isStudent || isAdmin)
                  ? TextButton.icon(
                      icon: const Icon(Icons.add, size: 16, color: AppTheme.teal),
                      label: const Text('Add', style: TextStyle(color: AppTheme.teal, fontSize: 13)),
                      onPressed: () => _showActivityDialog(context, controller),
                    )
                  : null,
            ),
            ...controller.activities.map(
              (a) => _activityCard(context, controller, a, isStudent || isAdmin),
            ),
            if (controller.activities.isEmpty) _emptyHint('No activities recorded yet.'),
            const SizedBox(height: 20),

            // ── Placement Offers ──────────────────────────────────────
            _buildSectionHeader(
              'Placement / Internship Offers',
              trailingAction: (isStudent || isAdmin)
                  ? TextButton.icon(
                      icon: const Icon(Icons.add, size: 16, color: AppTheme.teal),
                      label: const Text('Add', style: TextStyle(color: AppTheme.teal, fontSize: 13)),
                      onPressed: () => _showOfferDialog(context, controller),
                    )
                  : null,
            ),
            ...controller.offers.map(
              (o) => _offerCard(context, controller, o, isStudent || isAdmin),
            ),
            if (controller.offers.isEmpty) _emptyHint('No offers recorded yet.'),
            const SizedBox(height: 20),

            // ── Advisor Meeting Log ───────────────────────────────────
            _buildSectionHeader('Advisor Meeting Log'),
            ...controller.meetingLogs.map(_meetingLogCard),
            if (controller.meetingLogs.isEmpty) _emptyHint('No meeting logs yet.'),
            if (canEdit) _addMeetingLogButton(context, controller),
          ],
        );
      }),
    );
  }

  // ════════════════════════════════════════════════════════════════════════════
  // Header card
  // ════════════════════════════════════════════════════════════════════════════

  Widget _studentHeaderCard(CounsellingController c) {
    final student = c.studentModel.value;
    final user = c.userModel.value;
    if (student == null || user == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.navy, Color(0xFF1A3A6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white.withOpacity(0.18),
              child: Text(
                _initials(user.name),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${student.rollNumber} • ${student.department}',
                    style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Year ${student.yearOfStudy} • Section ${student.section}',
                    style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 12),
                  ),
                  if (student.hostelBlock != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.holiday_village_outlined, size: 12, color: Colors.white.withOpacity(0.75)),
                        const SizedBox(width: 4),
                        Text(
                          '${student.hostelBlock} • Room ${student.roomNumber ?? "-"}',
                          style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 12),
                        ),
                      ],
                    ),
                  ] else ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.directions_bus_outlined, size: 12, color: Colors.white.withOpacity(0.75)),
                        const SizedBox(width: 4),
                        Text(
                          'Day Scholar',
                          style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  // ════════════════════════════════════════════════════════════════════════════
  // Shared UI helpers
  // ════════════════════════════════════════════════════════════════════════════

  Widget _buildSectionHeader(String title, {Widget? trailingAction}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: AppTheme.teal,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppTheme.navy,
              ),
            ),
          ),
          if (trailingAction != null) trailingAction,
        ],
      ),
    );
  }

  Widget _emptyHint(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Center(
          child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.black38)),
        ),
      );

  Widget _kv(String k, String v) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            children: [
              TextSpan(
                text: '$k: ',
                style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.navy),
              ),
              TextSpan(text: v),
            ],
          ),
        ),
      );

  Widget _chip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
        ),
      );

  // ════════════════════════════════════════════════════════════════════════════
  // Section cards
  // ════════════════════════════════════════════════════════════════════════════

  Widget _personalCard(CounsellingController c) {
    final r = c.record.value!;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _kv('Blood Group', r.bloodGroup ?? '-'),
            if (r.aadhaarNumber != null) _kv('Aadhaar', r.aadhaarNumber!),
            _kv('Category', r.category ?? '-'),
            _kv('Permanent Address', r.permanentAddress.isEmpty ? '-' : r.permanentAddress),
            if (r.currentAddress != null) _kv('Current Address', r.currentAddress!),
            _kv(
              'Emergency Contact',
              (r.emergencyContactName.isEmpty && r.emergencyContactPhone.isEmpty)
                  ? '-'
                  : '${r.emergencyContactName} (${r.emergencyContactPhone})',
            ),
            if (r.medicalConditions != null) _kv('Medical Notes', r.medicalConditions!),
            _kv(
              'Transport',
              r.transportMode.name + (r.busRouteNumber != null ? ' • Route ${r.busRouteNumber}' : ''),
            ),
            if (r.tenthPercentage != null) _kv('10th %', r.tenthPercentage!.toStringAsFixed(1)),
            if (r.twelfthPercentage != null) _kv('12th %', r.twelfthPercentage!.toStringAsFixed(1)),
            if (r.scholarshipDetails != null) _kv('Scholarship', r.scholarshipDetails!),
            if (r.siblingDetails != null) _kv('Sibling', r.siblingDetails!),
            if (r.resumeLink != null) _kv('Resume Link', r.resumeLink!),
            if (r.higherStudiesPlan != null) _kv('Higher Studies Plan', r.higherStudiesPlan!),
          ],
        ),
      ),
    );
  }

  Widget _guardianCard(
    BuildContext context,
    CounsellingController c,
    ParentGuardianModel g,
    bool canEditGuardian,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.teal.withOpacity(0.15),
          child: const Icon(Icons.person, color: AppTheme.teal),
        ),
        title: Text(g.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          '${_capitalize(g.relation.name)} • ${g.occupation ?? '-'} • ${g.phone}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: canEditGuardian
            ? IconButton(
                icon: const Icon(Icons.more_vert, size: 18, color: Colors.black45),
                onPressed: () => _showGuardianDialog(context, c, g),
              )
            : null,
      ),
    );
  }

  Widget _semesterCard(BuildContext context, CounsellingController c, SemesterRecordModel sem, bool isAdmin) {
    final subjects = c.subjectsBySemester[sem.id] ?? [];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.navy.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Sem ${sem.semesterNumber}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.navy,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (sem.sgpa != null)
              _chip('SGPA ${sem.sgpa!.toStringAsFixed(2)}', AppTheme.teal),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'Attendance: ${sem.attendancePercent?.toStringAsFixed(0) ?? "-"}% • Arrears: ${sem.arrearCount}',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        trailing: isAdmin
            ? IconButton(
                icon: const Icon(Icons.edit, size: 18, color: AppTheme.navy),
                onPressed: () => _showSemesterDialog(context, c, sem),
              )
            : null,
        children: [
          ...subjects.map((sub) => ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(sub.subjectName, style: const TextStyle(fontSize: 13)),
                subtitle: Text(
                  '${sub.subjectCode} • CIA: ${sub.ciaMarks?.toStringAsFixed(0) ?? "-"} • Exam: ${sub.semesterExamMarks?.toStringAsFixed(0) ?? "-"}',
                  style: const TextStyle(fontSize: 11),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (sub.grade != null)
                      _chip(sub.grade!, AppTheme.teal),
                    if (isAdmin) ...[
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.edit, size: 15, color: Colors.black38),
                        onPressed: () => _showSubjectDialog(context, c, sem.id, sub),
                      ),
                    ],
                  ],
                ),
              )),
          if (isAdmin)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: const Icon(Icons.add, size: 15),
                  label: const Text('Add Subject', style: TextStyle(fontSize: 12)),
                  onPressed: () => _showSubjectDialog(context, c, sem.id),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _trainingCard(
    BuildContext context,
    CounsellingController c,
    PlacementTrainingModel t,
    bool canEditEntry,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: (t.isInCollege ? AppTheme.navy : AppTheme.teal).withOpacity(0.1),
          child: Icon(
            t.isInCollege ? Icons.school_outlined : Icons.business_outlined,
            color: t.isInCollege ? AppTheme.navy : AppTheme.teal,
            size: 20,
          ),
        ),
        title: Text(t.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(
          '${t.provider} • ${DateFormat('MMM yyyy').format(t.startDate)}'
          '${t.description != null ? '\n${t.description}' : ''}',
          style: const TextStyle(fontSize: 12),
        ),
        isThreeLine: t.description != null,
        trailing: canEditEntry
            ? IconButton(
                icon: const Icon(Icons.more_vert, size: 18, color: Colors.black45),
                onPressed: () => _showTrainingDialog(context, c, t),
              )
            : null,
      ),
    );
  }

  Widget _activityCard(
    BuildContext context,
    CounsellingController c,
    CoCurricularModel a,
    bool canEditEntry,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.teal.withOpacity(0.1),
          child: const Icon(Icons.emoji_events_outlined, color: AppTheme.teal, size: 20),
        ),
        title: Text(a.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Row(
          children: [
            _chip(_capitalize(a.category.name), AppTheme.navy),
            const SizedBox(width: 6),
            _chip(_capitalize(a.level.name), AppTheme.teal),
            if (a.achievement != null) ...[
              const SizedBox(width: 6),
              Flexible(child: Text(a.achievement!, style: const TextStyle(fontSize: 11))),
            ],
          ],
        ),
        isThreeLine: a.achievement != null,
        trailing: canEditEntry
            ? IconButton(
                icon: const Icon(Icons.more_vert, size: 18, color: Colors.black45),
                onPressed: () => _showActivityDialog(context, c, a),
              )
            : null,
      ),
    );
  }

  Widget _offerCard(
    BuildContext context,
    CounsellingController c,
    PlacementOfferModel o,
    bool canEditEntry,
  ) {
    final statusColor = switch (o.status) {
      OfferStatus.accepted => AppTheme.teal,
      OfferStatus.offered => Colors.orange,
      OfferStatus.declined => Colors.redAccent,
      OfferStatus.completed => AppTheme.navy,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.1),
          child: Icon(Icons.work_outline, color: statusColor, size: 20),
        ),
        title: Text(
          '${o.role} @ ${o.companyName}',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        subtitle: Row(
          children: [
            _chip(_capitalize(o.type.name), AppTheme.navy),
            const SizedBox(width: 6),
            _chip(_capitalize(o.status.name), statusColor),
            const SizedBox(width: 6),
            Text(o.packageOrStipend, style: const TextStyle(fontSize: 11)),
          ],
        ),
        isThreeLine: true,
        trailing: canEditEntry
            ? IconButton(
                icon: const Icon(Icons.more_vert, size: 18, color: Colors.black45),
                onPressed: () => _showOfferDialog(context, c, o),
              )
            : null,
      ),
    );
  }

  Widget _meetingLogCard(log) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.navy.withOpacity(0.08),
          child: const Icon(Icons.event_note_outlined, color: AppTheme.navy, size: 18),
        ),
        title: Text(
          DateFormat('MMM d, yyyy').format(log.date),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        subtitle: Text(log.notes, style: const TextStyle(fontSize: 12)),
        trailing: log.followUpNeeded
            ? _chip('Follow-up', Colors.orange)
            : null,
      ),
    );
  }

  Widget _addMeetingLogButton(BuildContext context, CounsellingController c) {
    final textController = TextEditingController();
    final followUp = false.obs;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Meeting Note'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('New Meeting Note'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: textController,
                      maxLines: 4,
                      decoration: const InputDecoration(hintText: 'Notes from this counselling session...'),
                    ),
                    const SizedBox(height: 8),
                    Obx(() => CheckboxListTile(
                          dense: true,
                          title: const Text('Follow-up needed'),
                          value: followUp.value,
                          onChanged: (v) => followUp.value = v ?? false,
                          contentPadding: EdgeInsets.zero,
                        )),
                  ],
                ),
                actions: [
                  TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                  ElevatedButton(
                    onPressed: () {
                      if (textController.text.trim().isEmpty) return;
                      c.addMeetingLog(
                        facultyId: AuthController.to.currentUser.value!.facultyProfileId!,
                        notes: textController.text.trim(),
                        followUpNeeded: followUp.value,
                      );
                      Get.back();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════════════════
  // Dialogs
  // ════════════════════════════════════════════════════════════════════════════

  String _capitalize(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

  void _showEditPersonalDialog(BuildContext context, CounsellingController c) {
    final r = c.record.value!;

    final bloodGroupCtrl = TextEditingController(text: r.bloodGroup);
    final aadhaarCtrl = TextEditingController(text: r.aadhaarNumber);
    final categoryCtrl = TextEditingController(text: r.category);
    final permAddressCtrl = TextEditingController(text: r.permanentAddress);
    final curAddressCtrl = TextEditingController(text: r.currentAddress);
    final emergencyNameCtrl = TextEditingController(text: r.emergencyContactName);
    final emergencyPhoneCtrl = TextEditingController(text: r.emergencyContactPhone);
    final medicalCtrl = TextEditingController(text: r.medicalConditions);
    final busRouteCtrl = TextEditingController(text: r.busRouteNumber);
    final tenthCtrl = TextEditingController(text: r.tenthPercentage?.toString() ?? '');
    final twelfthCtrl = TextEditingController(text: r.twelfthPercentage?.toString() ?? '');
    final scholarshipCtrl = TextEditingController(text: r.scholarshipDetails);
    final siblingCtrl = TextEditingController(text: r.siblingDetails);
    final resumeCtrl = TextEditingController(text: r.resumeLink);
    final higherCtrl = TextEditingController(text: r.higherStudiesPlan);

    final transportMode = r.transportMode.obs;

    _showBottomSheet(
      context: context,
      title: 'Edit Personal Details',
      onSave: () {
        final updated = CounsellingRecordModel()
          ..id = r.id
          ..studentProfileId = r.studentProfileId
          ..facultyAdvisorId = r.facultyAdvisorId
          ..bloodGroup = bloodGroupCtrl.text.trim().isEmpty ? null : bloodGroupCtrl.text.trim()
          ..aadhaarNumber = aadhaarCtrl.text.trim().isEmpty ? null : aadhaarCtrl.text.trim()
          ..category = categoryCtrl.text.trim().isEmpty ? null : categoryCtrl.text.trim()
          ..permanentAddress = permAddressCtrl.text.trim()
          ..currentAddress = curAddressCtrl.text.trim().isEmpty ? null : curAddressCtrl.text.trim()
          ..emergencyContactName = emergencyNameCtrl.text.trim()
          ..emergencyContactPhone = emergencyPhoneCtrl.text.trim()
          ..medicalConditions = medicalCtrl.text.trim().isEmpty ? null : medicalCtrl.text.trim()
          ..transportMode = transportMode.value
          ..busRouteNumber = busRouteCtrl.text.trim().isEmpty ? null : busRouteCtrl.text.trim()
          ..tenthPercentage = double.tryParse(tenthCtrl.text.trim())
          ..twelfthPercentage = double.tryParse(twelfthCtrl.text.trim())
          ..scholarshipDetails = scholarshipCtrl.text.trim().isEmpty ? null : scholarshipCtrl.text.trim()
          ..siblingDetails = siblingCtrl.text.trim().isEmpty ? null : siblingCtrl.text.trim()
          ..resumeLink = resumeCtrl.text.trim().isEmpty ? null : resumeCtrl.text.trim()
          ..higherStudiesPlan = higherCtrl.text.trim().isEmpty ? null : higherCtrl.text.trim();
        c.updatePersonalDetails(updated);
        Navigator.pop(context);
      },
      fields: [
        _field(bloodGroupCtrl, 'Blood Group'),
        _field(aadhaarCtrl, 'Aadhaar Number'),
        _field(categoryCtrl, 'Category (e.g. OBC, SC)'),
        _field(permAddressCtrl, 'Permanent Address', maxLines: 2),
        _field(curAddressCtrl, 'Current Address (leave blank if same)'),
        _field(emergencyNameCtrl, 'Emergency Contact Name'),
        _field(emergencyPhoneCtrl, 'Emergency Contact Phone', keyboardType: TextInputType.phone),
        _field(medicalCtrl, 'Medical Conditions'),
        Obx(() => DropdownButtonFormField<TransportMode>(
              value: transportMode.value,
              decoration: _inputDecoration('Transport Mode'),
              items: TransportMode.values
                  .map((m) => DropdownMenuItem(value: m, child: Text(_capitalize(m.name))))
                  .toList(),
              onChanged: (val) { if (val != null) transportMode.value = val; },
            )),
        _field(busRouteCtrl, 'Bus Route Number'),
        _field(tenthCtrl, '10th Percentage', keyboardType: const TextInputType.numberWithOptions(decimal: true)),
        _field(twelfthCtrl, '12th Percentage', keyboardType: const TextInputType.numberWithOptions(decimal: true)),
        _field(scholarshipCtrl, 'Scholarship Details'),
        _field(siblingCtrl, 'Sibling Details'),
        _field(resumeCtrl, 'Resume Link'),
        _field(higherCtrl, 'Higher Studies Plan'),
      ],
    );
  }

  void _showGuardianDialog(BuildContext context, CounsellingController c, [ParentGuardianModel? g]) {
    final nameCtrl = TextEditingController(text: g?.name ?? '');
    final occupCtrl = TextEditingController(text: g?.occupation ?? '');
    final phoneCtrl = TextEditingController(text: g?.phone ?? '');
    final relation = (g?.relation ?? GuardianRelation.father).obs;

    _showBottomSheet(
      context: context,
      title: g == null ? 'Add Guardian' : 'Edit Guardian',
      onSave: () {
        final model = g ?? ParentGuardianModel()
          ..studentProfileId = c.studentProfileId;
        model.name = nameCtrl.text.trim();
        model.occupation = occupCtrl.text.trim().isEmpty ? null : occupCtrl.text.trim();
        model.phone = phoneCtrl.text.trim();
        model.relation = relation.value;
        if (g == null) {
          c.addGuardian(model);
        } else {
          c.updateGuardian(model);
        }
        Navigator.pop(context);
      },
      onDelete: g != null ? () { c.deleteGuardian(g.id); Navigator.pop(context); } : null,
      fields: [
        _field(nameCtrl, 'Full Name'),
        Obx(() => DropdownButtonFormField<GuardianRelation>(
              value: relation.value,
              decoration: _inputDecoration('Relation'),
              items: GuardianRelation.values
                  .map((r) => DropdownMenuItem(value: r, child: Text(_capitalize(r.name))))
                  .toList(),
              onChanged: (val) { if (val != null) relation.value = val; },
            )),
        _field(occupCtrl, 'Occupation'),
        _field(phoneCtrl, 'Phone', keyboardType: TextInputType.phone),
      ],
    );
  }

  void _showTrainingDialog(BuildContext context, CounsellingController c, [PlacementTrainingModel? t]) {
    final titleCtrl = TextEditingController(text: t?.title ?? '');
    final providerCtrl = TextEditingController(text: t?.provider ?? '');
    final descCtrl = TextEditingController(text: t?.description ?? '');
    final isInCollege = (t?.isInCollege ?? false).obs;
    DateTime startDate = t?.startDate ?? DateTime.now();
    DateTime? endDate = t?.endDate;

    _showBottomSheet(
      context: context,
      title: t == null ? 'Add Training' : 'Edit Training',
      onSave: () {
        final model = t ?? PlacementTrainingModel()
          ..studentProfileId = c.studentProfileId;
        model.title = titleCtrl.text.trim();
        model.provider = providerCtrl.text.trim();
        model.description = descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim();
        model.isInCollege = isInCollege.value;
        model.startDate = startDate;
        model.endDate = endDate;
        if (t == null) {
          c.addTraining(model);
        } else {
          c.updateTraining(model);
        }
        Navigator.pop(context);
      },
      onDelete: t != null ? () { c.deleteTraining(t.id); Navigator.pop(context); } : null,
      fields: [
        _field(titleCtrl, 'Training Title'),
        _field(providerCtrl, 'Provider / Organisation'),
        _field(descCtrl, 'Description (optional)', maxLines: 2),
        Obx(() => SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Conducted in College', style: TextStyle(fontSize: 13)),
              value: isInCollege.value,
              onChanged: (v) => isInCollege.value = v,
              activeColor: AppTheme.teal,
            )),
        _DatePickerField(
          label: 'Start Date',
          initial: startDate,
          onChanged: (d) => startDate = d,
        ),
        _DatePickerField(
          label: 'End Date (optional)',
          initial: endDate,
          onChanged: (d) => endDate = d,
        ),
      ],
    );
  }

  void _showActivityDialog(BuildContext context, CounsellingController c, [CoCurricularModel? a]) {
    final titleCtrl = TextEditingController(text: a?.title ?? '');
    final achieveCtrl = TextEditingController(text: a?.achievement ?? '');
    final descCtrl = TextEditingController(text: a?.description ?? '');
    final category = (a?.category ?? ActivityCategory.sports).obs;
    final level = (a?.level ?? ActivityLevel.college).obs;
    DateTime eventDate = a?.eventDate ?? DateTime.now();

    _showBottomSheet(
      context: context,
      title: a == null ? 'Add Activity' : 'Edit Activity',
      onSave: () {
        final model = a ?? CoCurricularModel()
          ..studentProfileId = c.studentProfileId;
        model.title = titleCtrl.text.trim();
        model.achievement = achieveCtrl.text.trim().isEmpty ? null : achieveCtrl.text.trim();
        model.description = descCtrl.text.trim().isEmpty ? null : descCtrl.text.trim();
        model.category = category.value;
        model.level = level.value;
        model.eventDate = eventDate;
        if (a == null) {
          c.addActivity(model);
        } else {
          c.updateActivity(model);
        }
        Navigator.pop(context);
      },
      onDelete: a != null ? () { c.deleteActivity(a.id); Navigator.pop(context); } : null,
      fields: [
        _field(titleCtrl, 'Activity / Event Title'),
        Obx(() => DropdownButtonFormField<ActivityCategory>(
              value: category.value,
              decoration: _inputDecoration('Category'),
              items: ActivityCategory.values
                  .map((v) => DropdownMenuItem(value: v, child: Text(_capitalize(v.name))))
                  .toList(),
              onChanged: (val) { if (val != null) category.value = val; },
            )),
        Obx(() => DropdownButtonFormField<ActivityLevel>(
              value: level.value,
              decoration: _inputDecoration('Level'),
              items: ActivityLevel.values
                  .map((v) => DropdownMenuItem(value: v, child: Text(_capitalize(v.name))))
                  .toList(),
              onChanged: (val) { if (val != null) level.value = val; },
            )),
        _field(achieveCtrl, 'Achievement (e.g. 1st Place)'),
        _field(descCtrl, 'Description (optional)', maxLines: 2),
        _DatePickerField(
          label: 'Event Date',
          initial: eventDate,
          onChanged: (d) => eventDate = d,
        ),
      ],
    );
  }

  void _showOfferDialog(BuildContext context, CounsellingController c, [PlacementOfferModel? o]) {
    final companyCtrl = TextEditingController(text: o?.companyName ?? '');
    final roleCtrl = TextEditingController(text: o?.role ?? '');
    final packageCtrl = TextEditingController(text: o?.packageOrStipend ?? '');
    final offerType = (o?.type ?? OfferType.fullTime).obs;
    final offerStatus = (o?.status ?? OfferStatus.offered).obs;
    DateTime offerDate = o?.offerDate ?? DateTime.now();

    _showBottomSheet(
      context: context,
      title: o == null ? 'Add Placement Offer' : 'Edit Placement Offer',
      onSave: () {
        final model = o ?? PlacementOfferModel()
          ..studentProfileId = c.studentProfileId;
        model.companyName = companyCtrl.text.trim();
        model.role = roleCtrl.text.trim();
        model.packageOrStipend = packageCtrl.text.trim();
        model.type = offerType.value;
        model.status = offerStatus.value;
        model.offerDate = offerDate;
        if (o == null) {
          c.addOffer(model);
        } else {
          c.updateOffer(model);
        }
        Navigator.pop(context);
      },
      onDelete: o != null ? () { c.deleteOffer(o.id); Navigator.pop(context); } : null,
      fields: [
        _field(companyCtrl, 'Company Name'),
        _field(roleCtrl, 'Role / Position'),
        _field(packageCtrl, 'Package / Stipend (e.g. 4.5 LPA)'),
        Obx(() => DropdownButtonFormField<OfferType>(
              value: offerType.value,
              decoration: _inputDecoration('Offer Type'),
              items: OfferType.values
                  .map((v) => DropdownMenuItem(value: v, child: Text(_capitalize(v.name))))
                  .toList(),
              onChanged: (val) { if (val != null) offerType.value = val; },
            )),
        Obx(() => DropdownButtonFormField<OfferStatus>(
              value: offerStatus.value,
              decoration: _inputDecoration('Status'),
              items: OfferStatus.values
                  .map((v) => DropdownMenuItem(value: v, child: Text(_capitalize(v.name))))
                  .toList(),
              onChanged: (val) { if (val != null) offerStatus.value = val; },
            )),
        _DatePickerField(
          label: 'Offer Date',
          initial: offerDate,
          onChanged: (d) => offerDate = d,
        ),
      ],
    );
  }

  void _showSemesterDialog(BuildContext context, CounsellingController c, [SemesterRecordModel? sem]) {
    final numberCtrl = TextEditingController(text: sem?.semesterNumber.toString() ?? '');
    final sgpaCtrl = TextEditingController(text: sem?.sgpa?.toString() ?? '');
    final attCtrl = TextEditingController(text: sem?.attendancePercent?.toString() ?? '');
    final arrearCtrl = TextEditingController(text: sem?.arrearCount.toString() ?? '0');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sem == null ? 'Add Semester Record' : 'Edit Semester Record'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _field(numberCtrl, 'Semester Number', keyboardType: TextInputType.number, enabled: sem == null),
              const SizedBox(height: 4),
              _field(sgpaCtrl, 'SGPA', keyboardType: const TextInputType.numberWithOptions(decimal: true)),
              const SizedBox(height: 4),
              _field(attCtrl, 'Attendance %', keyboardType: const TextInputType.numberWithOptions(decimal: true)),
              const SizedBox(height: 4),
              _field(arrearCtrl, 'Arrear Count', keyboardType: TextInputType.number),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          if (sem != null)
            TextButton(
              onPressed: () { c.deleteSemesterRecord(sem.id); Navigator.pop(context); },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ElevatedButton(
            onPressed: () {
              final number = int.tryParse(numberCtrl.text.trim()) ?? 1;
              final sgpa = double.tryParse(sgpaCtrl.text.trim());
              final att = double.tryParse(attCtrl.text.trim());
              final arrears = int.tryParse(arrearCtrl.text.trim()) ?? 0;

              final record = sem ?? SemesterRecordModel()
                ..studentProfileId = c.studentProfileId;

              record.semesterNumber = number;
              record.sgpa = sgpa;
              record.attendancePercent = att;
              record.arrearCount = arrears;

              if (sem == null) {
                c.addSemesterRecord(record);
              } else {
                c.updateSemesterRecord(record);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showSubjectDialog(BuildContext context, CounsellingController c, int semesterRecordId, [SubjectGradeModel? subject]) {
    final nameCtrl = TextEditingController(text: subject?.subjectName ?? '');
    final codeCtrl = TextEditingController(text: subject?.subjectCode ?? '');
    final ciaCtrl = TextEditingController(text: subject?.ciaMarks?.toString() ?? '');
    final examCtrl = TextEditingController(text: subject?.semesterExamMarks?.toString() ?? '');
    final gradeCtrl = TextEditingController(text: subject?.grade ?? '');
    final pointCtrl = TextEditingController(text: subject?.gradePoint?.toString() ?? '');
    final isArrear = (subject?.isArrear ?? false).obs;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(subject == null ? 'Add Subject Grade' : 'Edit Subject Grade'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _field(nameCtrl, 'Subject Name'),
              const SizedBox(height: 4),
              _field(codeCtrl, 'Subject Code'),
              const SizedBox(height: 4),
              _field(ciaCtrl, 'CIA Marks (out of 50)', keyboardType: TextInputType.number),
              const SizedBox(height: 4),
              _field(examCtrl, 'Exam Marks (out of 100)', keyboardType: TextInputType.number),
              const SizedBox(height: 4),
              _field(gradeCtrl, 'Grade (e.g. O, A+, B)'),
              const SizedBox(height: 4),
              _field(pointCtrl, 'Grade Point', keyboardType: const TextInputType.numberWithOptions(decimal: true)),
              const SizedBox(height: 4),
              Obx(() => CheckboxListTile(
                    dense: true,
                    title: const Text('Is Arrear', style: TextStyle(fontSize: 13)),
                    value: isArrear.value,
                    onChanged: (val) { if (val != null) isArrear.value = val; },
                    contentPadding: EdgeInsets.zero,
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          if (subject != null)
            TextButton(
              onPressed: () { c.deleteSubjectGrade(subject.id); Navigator.pop(context); },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ElevatedButton(
            onPressed: () {
              final record = subject ?? SubjectGradeModel()
                ..semesterRecordId = semesterRecordId;
              record.subjectName = nameCtrl.text.trim();
              record.subjectCode = codeCtrl.text.trim();
              record.ciaMarks = double.tryParse(ciaCtrl.text.trim());
              record.semesterExamMarks = double.tryParse(examCtrl.text.trim());
              record.grade = gradeCtrl.text.trim().isEmpty ? null : gradeCtrl.text.trim();
              record.gradePoint = double.tryParse(pointCtrl.text.trim());
              record.isArrear = isArrear.value;
              c.updateGrade(record);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════════════════
  // Reusable bottom sheet builder
  // ════════════════════════════════════════════════════════════════════════════

  void _showBottomSheet({
    required BuildContext context,
    required String title,
    required VoidCallback onSave,
    VoidCallback? onDelete,
    required List<Widget> fields,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          maxChildSize: 0.95,
          minChildSize: 0.4,
          expand: false,
          builder: (ctx, scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.navy,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        ...fields.map((f) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: f,
                            )),
                        const SizedBox(height: 8),
                        if (onDelete != null)
                          OutlinedButton.icon(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            label: const Text('Delete', style: TextStyle(color: Colors.red)),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red),
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: onDelete,
                          ),
                        if (onDelete != null) const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.navy,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: onSave,
                          child: const Text('Save Changes'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ════════════════════════════════════════════════════════════════════════════
  // Form helpers
  // ════════════════════════════════════════════════════════════════════════════

  InputDecoration _inputDecoration(String label) => InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppTheme.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      );

  Widget _field(
    TextEditingController ctrl,
    String label, {
    TextInputType? keyboardType,
    int maxLines = 1,
    bool enabled = true,
  }) =>
      TextField(
        controller: ctrl,
        keyboardType: keyboardType,
        maxLines: maxLines,
        enabled: enabled,
        decoration: _inputDecoration(label),
      );
}

// ════════════════════════════════════════════════════════════════════════════
// Helper widget: date picker field
// ════════════════════════════════════════════════════════════════════════════

class _DatePickerField extends StatefulWidget {
  final String label;
  final DateTime? initial;
  final ValueChanged<DateTime> onChanged;

  const _DatePickerField({
    required this.label,
    required this.initial,
    required this.onChanged,
  });

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  late DateTime? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _selected ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2040),
        );
        if (picked != null) {
          setState(() => _selected = picked);
          widget.onChanged(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          filled: true,
          fillColor: AppTheme.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(
          _selected != null ? DateFormat('MMM d, yyyy').format(_selected!) : 'Select date',
          style: TextStyle(
            fontSize: 14,
            color: _selected != null ? Colors.black87 : Colors.black38,
          ),
        ),
      ),
    );
  }
}