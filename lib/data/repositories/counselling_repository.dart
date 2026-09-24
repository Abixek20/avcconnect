import '../models/counselling_record_model.dart';
import '../models/parent_guardian_model.dart';
import '../models/semester_record_model.dart';
import '../models/subject_grade_model.dart';
import '../models/placement_training_model.dart';
import '../models/co_curricular_model.dart';
import '../models/advisor_meeting_log_model.dart';
import '../models/placement_offer_model.dart';
import '../models/student_model.dart';
import '../models/faculty_model.dart';
import '../services/database_service.dart';
import 'package:isar_community/isar.dart';

class CounsellingRepository {
  Future<CounsellingRecordModel> getOrCreateRecord(int studentProfileId) async {
    final isar = DatabaseService.instance;
    var record = await isar.counsellingRecordModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findFirst();

    if (record == null) {
      final student = await isar.studentModels.get(studentProfileId);
      int advisorId = 0;
      if (student != null) {
        final advisor = await isar.facultyModels.filter().departmentEqualTo(student.department).findFirst();
        if (advisor != null) {
          advisorId = advisor.id;
        } else {
          final anyAdvisor = await isar.facultyModels.where().findFirst();
          if (anyAdvisor != null) {
            advisorId = anyAdvisor.id;
          }
        }
      }

      record = CounsellingRecordModel()
        ..studentProfileId = studentProfileId
        ..facultyAdvisorId = advisorId
        ..permanentAddress = ''
        ..emergencyContactName = ''
        ..emergencyContactPhone = ''
        ..transportMode = (student?.hostelBlock != null) ? TransportMode.hosteller : TransportMode.other;

      await isar.writeTxn(() => isar.counsellingRecordModels.put(record!));
    }

    return record;
  }

  Future<CounsellingRecordModel?> getRecord(int studentProfileId) {
    return DatabaseService.instance.counsellingRecordModels
        .filter()
        .studentProfileIdEqualTo(studentProfileId)
        .findFirst();
  }

  Future<void> saveRecord(CounsellingRecordModel record) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.counsellingRecordModels.put(record));
  }

  // ─── Semesters ─────────────────────────────────────────────────────────────

  Future<void> saveSemester(SemesterRecordModel sem) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.semesterRecordModels.put(sem));
  }

  Future<void> deleteSemester(int semesterId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() async {
      await isar.semesterRecordModels.delete(semesterId);
      await isar.subjectGradeModels.filter().semesterRecordIdEqualTo(semesterId).deleteAll();
    });
  }

  // ─── Subjects ──────────────────────────────────────────────────────────────

  Future<void> saveSubjectGrade(SubjectGradeModel subject) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.subjectGradeModels.put(subject));
  }

  Future<void> deleteSubjectGrade(int subjectId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.subjectGradeModels.delete(subjectId));
  }

  Future<void> updateSubjectGrade(SubjectGradeModel subject) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.subjectGradeModels.put(subject));
  }

  // ─── Guardians ─────────────────────────────────────────────────────────────

  Future<void> saveGuardian(ParentGuardianModel guardian) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.parentGuardianModels.put(guardian));
  }

  Future<void> deleteGuardian(int guardianId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.parentGuardianModels.delete(guardianId));
  }

  // ─── Trainings ─────────────────────────────────────────────────────────────

  Future<void> saveTraining(PlacementTrainingModel training) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.placementTrainingModels.put(training));
  }

  Future<void> deleteTraining(int trainingId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.placementTrainingModels.delete(trainingId));
  }

  // ─── Activities ────────────────────────────────────────────────────────────

  Future<void> saveActivity(CoCurricularModel activity) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.coCurricularModels.put(activity));
  }

  Future<void> deleteActivity(int activityId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.coCurricularModels.delete(activityId));
  }

  // ─── Placement Offers ──────────────────────────────────────────────────────

  Future<void> saveOffer(PlacementOfferModel offer) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.placementOfferModels.put(offer));
  }

  Future<void> deleteOffer(int offerId) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.placementOfferModels.delete(offerId));
  }

  // ─── Queries ───────────────────────────────────────────────────────────────

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

  // ─── Faculty-only actions ──────────────────────────────────────────────────

  Future<void> addMeetingLog(AdvisorMeetingLogModel log) async {
    final isar = DatabaseService.instance;
    await isar.writeTxn(() => isar.advisorMeetingLogModels.put(log));
  }
}