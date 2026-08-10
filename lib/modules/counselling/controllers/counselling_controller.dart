import 'package:get/get.dart';

import '../../../data/models/counselling_record_model.dart';
import '../../../data/models/parent_guardian_model.dart';
import '../../../data/models/semester_record_model.dart';
import '../../../data/models/subject_grade_model.dart';
import '../../../data/models/placement_training_model.dart';
import '../../../data/models/co_curricular_model.dart';
import '../../../data/models/advisor_meeting_log_model.dart';
import '../../../data/models/placement_offer_model.dart';
import '../../../data/repositories/counselling_repository.dart';

class CounsellingController extends GetxController {
  final int studentProfileId;
  CounsellingController({required this.studentProfileId});

  final _repo = CounsellingRepository();

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

    record.value = await _repo.getRecord(studentProfileId);
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

  Future<void> updateGrade(SubjectGradeModel subject) async {
    await _repo.updateSubjectGrade(subject);
    await loadAll();
  }
}