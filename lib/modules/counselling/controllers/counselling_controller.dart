import 'package:get/get.dart';

import '../../../data/models/counselling_record_model.dart';
import '../../../data/models/parent_guardian_model.dart';
import '../../../data/models/semester_record_model.dart';
import '../../../data/models/subject_grade_model.dart';
import '../../../data/models/placement_training_model.dart';
import '../../../data/models/co_curricular_model.dart';
import '../../../data/models/advisor_meeting_log_model.dart';
import '../../../data/models/placement_offer_model.dart';
import '../../../data/models/student_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/database_service.dart';
import '../../../data/repositories/counselling_repository.dart';

class CounsellingController extends GetxController {
  final int studentProfileId;
  CounsellingController({required this.studentProfileId});

  final _repo = CounsellingRepository();

  final Rxn<StudentModel> studentModel = Rxn<StudentModel>();
  final Rxn<UserModel> userModel = Rxn<UserModel>();

  final Rxn<CounsellingRecordModel> record = Rxn<CounsellingRecordModel>();
  final RxList<ParentGuardianModel> guardians = <ParentGuardianModel>[].obs;
  final RxList<SemesterRecordModel> semesters = <SemesterRecordModel>[].obs;
  final RxMap<int, List<SubjectGradeModel>> subjectsBySemester = <int, List<SubjectGradeModel>>{}.obs;
  final RxList<PlacementTrainingModel> trainings = <PlacementTrainingModel>[].obs;
  final RxList<CoCurricularModel> activities = <CoCurricularModel>[].obs;
  final RxList<AdvisorMeetingLogModel> meetingLogs = <AdvisorMeetingLogModel>[].obs;
  final RxList<PlacementOfferModel> offers = <PlacementOfferModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadAll();
  }

  Future<void> loadAll() async {
    isLoading.value = true;

    final isar = DatabaseService.instance;
    final student = await isar.studentModels.get(studentProfileId);
    studentModel.value = student;
    if (student != null) {
      userModel.value = await isar.userModels.get(student.userId);
    }

    record.value = await _repo.getOrCreateRecord(studentProfileId);
    guardians.value = await _repo.getGuardians(studentProfileId);
    semesters.value = await _repo.getSemesters(studentProfileId);
    trainings.value = await _repo.getTrainings(studentProfileId);
    activities.value = await _repo.getActivities(studentProfileId);
    meetingLogs.value = await _repo.getMeetingLogs(studentProfileId);
    offers.value = await _repo.getOffers(studentProfileId);

    final subjectMap = <int, List<SubjectGradeModel>>{};
    for (final sem in semesters) {
      subjectMap[sem.id] = await _repo.getSubjects(sem.id);
    }
    subjectsBySemester.value = subjectMap;

    isLoading.value = false;
  }

  // ─── Personal Details ──────────────────────────────────────────────────────

  Future<void> updatePersonalDetails(CounsellingRecordModel updated) async {
    await _repo.saveRecord(updated);
    record.value = updated;
    await loadAll();
  }

  // ─── Guardians ─────────────────────────────────────────────────────────────

  Future<void> addGuardian(ParentGuardianModel guardian) async {
    await _repo.saveGuardian(guardian);
    guardians.value = await _repo.getGuardians(studentProfileId);
  }

  Future<void> updateGuardian(ParentGuardianModel guardian) async {
    await _repo.saveGuardian(guardian);
    guardians.value = await _repo.getGuardians(studentProfileId);
  }

  Future<void> deleteGuardian(int guardianId) async {
    await _repo.deleteGuardian(guardianId);
    guardians.value = await _repo.getGuardians(studentProfileId);
  }

  // ─── Semesters ─────────────────────────────────────────────────────────────

  Future<void> addSemesterRecord(SemesterRecordModel sem) async {
    await _repo.saveSemester(sem);
    await loadAll();
  }

  Future<void> updateSemesterRecord(SemesterRecordModel sem) async {
    await _repo.saveSemester(sem);
    await loadAll();
  }

  Future<void> deleteSemesterRecord(int semId) async {
    await _repo.deleteSemester(semId);
    await loadAll();
  }

  // ─── Subjects ──────────────────────────────────────────────────────────────

  Future<void> addSubjectGrade(SubjectGradeModel subject) async {
    await _repo.saveSubjectGrade(subject);
    await loadAll();
  }

  Future<void> deleteSubjectGrade(int subjectId) async {
    await _repo.deleteSubjectGrade(subjectId);
    await loadAll();
  }

  Future<void> updateGrade(SubjectGradeModel subject) async {
    await _repo.updateSubjectGrade(subject);
    await loadAll();
  }

  // ─── Trainings ─────────────────────────────────────────────────────────────

  Future<void> addTraining(PlacementTrainingModel training) async {
    await _repo.saveTraining(training);
    trainings.value = await _repo.getTrainings(studentProfileId);
  }

  Future<void> updateTraining(PlacementTrainingModel training) async {
    await _repo.saveTraining(training);
    trainings.value = await _repo.getTrainings(studentProfileId);
  }

  Future<void> deleteTraining(int trainingId) async {
    await _repo.deleteTraining(trainingId);
    trainings.value = await _repo.getTrainings(studentProfileId);
  }

  // ─── Activities ────────────────────────────────────────────────────────────

  Future<void> addActivity(CoCurricularModel activity) async {
    await _repo.saveActivity(activity);
    activities.value = await _repo.getActivities(studentProfileId);
  }

  Future<void> updateActivity(CoCurricularModel activity) async {
    await _repo.saveActivity(activity);
    activities.value = await _repo.getActivities(studentProfileId);
  }

  Future<void> deleteActivity(int activityId) async {
    await _repo.deleteActivity(activityId);
    activities.value = await _repo.getActivities(studentProfileId);
  }

  // ─── Placement Offers ──────────────────────────────────────────────────────

  Future<void> addOffer(PlacementOfferModel offer) async {
    await _repo.saveOffer(offer);
    offers.value = await _repo.getOffers(studentProfileId);
  }

  Future<void> updateOffer(PlacementOfferModel offer) async {
    await _repo.saveOffer(offer);
    offers.value = await _repo.getOffers(studentProfileId);
  }

  Future<void> deleteOffer(int offerId) async {
    await _repo.deleteOffer(offerId);
    offers.value = await _repo.getOffers(studentProfileId);
  }

  // ─── Meeting Logs ──────────────────────────────────────────────────────────

  Future<void> addMeetingLog({
    required int facultyId,
    required String notes,
    bool followUpNeeded = false,
  }) async {
    final log = AdvisorMeetingLogModel()
      ..studentProfileId = studentProfileId
      ..facultyId = facultyId
      ..date = DateTime.now()
      ..notes = notes
      ..followUpNeeded = followUpNeeded;

    await _repo.addMeetingLog(log);
    meetingLogs.value = await _repo.getMeetingLogs(studentProfileId);
  }
}