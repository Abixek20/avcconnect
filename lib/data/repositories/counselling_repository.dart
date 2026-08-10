import '../models/counselling_record_model.dart';
import '../models/parent_guardian_model.dart';
import '../models/semester_record_model.dart';
import '../models/subject_grade_model.dart';
import '../models/placement_training_model.dart';
import '../models/co_curricular_model.dart';
import '../models/advisor_meeting_log_model.dart';
import '../models/placement_offer_model.dart';
import '../services/database_service.dart';
import 'package:isar_community/isar.dart';

class CounsellingRepository {
  Future<CounsellingRecordModel?> getRecord(int studentProfileId) {
    return DatabaseService.instance.counsellingRecordModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findFirst();
  }

  Future<List<ParentGuardianModel>> getGuardians(int studentProfileId) {
    return DatabaseService.instance.parentGuardianModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findAll();
  }

  Future<List<SemesterRecordModel>> getSemesters(int studentProfileId) {
    return DatabaseService.instance.semesterRecordModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .sortBySemesterNumber()
        .findAll();
  }

  Future<List<SubjectGradeModel>> getSubjects(int semesterRecordId) {
    return DatabaseService.instance.subjectGradeModels
        .filter()
        .semesterRecordIdEqualTo(semesterRecordId)
        .findAll();
  }

  Future<List<PlacementTrainingModel>> getTrainings(int studentProfileId) {
    return DatabaseService.instance.placementTrainingModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findAll();
  }

  Future<List<CoCurricularModel>> getActivities(int studentProfileId) {
    return DatabaseService.instance.coCurricularModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findAll();
  }

  Future<List<AdvisorMeetingLogModel>> getMeetingLogs(int studentProfileId) {
    return DatabaseService.instance.advisorMeetingLogModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .sortByDateDesc()
        .findAll();
  }

  Future<List<PlacementOfferModel>> getOffers(int studentProfileId) {
    return DatabaseService.instance.placementOfferModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findAll();
  }

  // --- Faculty-editable actions ---

  Future<void> addMeetingLog(AdvisorMeetingLogModel log) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.advisorMeetingLogModels.put(log));
  }

  Future<void> updateSubjectGrade(SubjectGradeModel subject) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.subjectGradeModels.put(subject));
  }
}