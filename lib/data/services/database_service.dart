import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';
import '../models/student_model.dart';
import '../models/faculty_model.dart';
import '../models/department_model.dart';
import '../models/class_slot_model.dart';
import '../models/attendance_model.dart';
import '../models/notice_model.dart';
import '../models/complaint_model.dart';
import '../models/advisor_meeting_log_model.dart';
import '../models/co_curricular_model.dart';
import '../models/counselling_record_model.dart';
import '../models/parent_guardian_model.dart';
import '../models/subject_grade_model.dart';
import '../models/placement_offer_model.dart';
import '../models/semester_record_model.dart';
import '../models/placement_training_model.dart';
import '../models/fee_model.dart';
import '../models/academic_event_model.dart';
import '../models/exam_schedule_model.dart';
import '../models/leave_application_model.dart';
import '../models/book_model.dart';
import '../models/issued_book_model.dart';

class DatabaseService {
  static Isar? _isar;

  static Isar get instance {
    if (_isar == null) {
      throw StateError(
        'Isar not initialized. Call DatabaseService.init() before use.',
      );
    }
    return _isar!;
  }

  static Future<Isar> init() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        UserModelSchema,
        StudentModelSchema,
        FacultyModelSchema,
        DepartmentModelSchema,
        ClassSlotModelSchema,
        AttendanceModelSchema,
        NoticeModelSchema,
        ComplaintModelSchema,
        CounsellingRecordModelSchema,
        ParentGuardianModelSchema,
        SemesterRecordModelSchema,
        SubjectGradeModelSchema,
        PlacementTrainingModelSchema,
        CoCurricularModelSchema,
        AdvisorMeetingLogModelSchema,
        PlacementOfferModelSchema,
        FeeModelSchema,
        AcademicEventModelSchema,
        ExamScheduleModelSchema,
        LeaveApplicationModelSchema,
        BookModelSchema,
        IssuedBookModelSchema,
      ],
      directory: dir.path,
      name: 'avconnect_db',
    );

    return _isar!;
  }
}