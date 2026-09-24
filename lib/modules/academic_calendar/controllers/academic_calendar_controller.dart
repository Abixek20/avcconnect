import 'package:get/get.dart';
import 'package:isar_community/isar.dart';

import '../../../data/models/academic_event_model.dart';
import '../../../data/services/database_service.dart';

class AcademicCalendarController extends GetxController {
  final RxList<AcademicEventModel> allEvents = <AcademicEventModel>[].obs;
  final RxList<AcademicEventModel> filteredEvents = <AcademicEventModel>[].obs;

  final RxBool isLoading = true.obs;
  final RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    isLoading.value = true;
    final isar = DatabaseService.instance;
    final events = await isar.academicEventModels.where().sortByEventDate().findAll();

    allEvents.value = events;
    _applyFilter();
    isLoading.value = false;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    _applyFilter();
  }

  void _applyFilter() {
    if (selectedCategory.value == 'All') {
      filteredEvents.value = allEvents;
    } else {
      filteredEvents.value = allEvents.where((e) {
        return e.category.name.toLowerCase() == selectedCategory.value.toLowerCase();
      }).toList();
    }
  }

  Future<void> refresh() => _load();
}
