//import 'package:isar_community/isar.dart';

import '../models/user_model.dart';
import '../models/student_model.dart';
import '../models/faculty_model.dart';
import '../models/department_model.dart';
import '../models/class_slot_model.dart';
import '../models/notice_model.dart';
import 'database_service.dart';

/// Seeds the local Isar DB with realistic mock data modeled on
/// A.V.C. College of Engineering, Mannampandal, Mayiladuthurai.
/// Runs once on first launch (guarded by department count check).
class SeedService {
  static Future<void> seedIfEmpty() async {
    final isar = DatabaseService.instance;

    final deptCount = await isar.departmentModels.count();
    if (deptCount > 0) return; // already seeded

    await isar.writeTxn(() async {
      // --- Departments (real AVC departments) ---
      final departments = [
        DepartmentModel()..code = 'AIDS' ..fullName = 'Artificial Intelligence and Data Science',
        DepartmentModel()..code = 'CE'   ..fullName = 'Civil Engineering',
        DepartmentModel()..code = 'CSE'  ..fullName = 'Computer Science and Engineering',
        DepartmentModel()..code = 'EEE'  ..fullName = 'Electrical and Electronics Engineering',
        DepartmentModel()..code = 'ECE'  ..fullName = 'Electronics and Communication Engineering',
        DepartmentModel()..code = 'IT'   ..fullName = 'Information Technology',
        DepartmentModel()..code = 'ICE'  ..fullName = 'Instrumentation and Control Engineering',
        DepartmentModel()..code = 'ME'   ..fullName = 'Mechanical Engineering',
        DepartmentModel()..code = 'BA'   ..fullName = 'Business Administration',
        DepartmentModel()..code = 'CA'   ..fullName = 'Computer Applications',
        DepartmentModel()..code = 'SH'   ..fullName = 'Science and Humanities',
      ];
      await isar.departmentModels.putAll(departments);

      // --- Admin user ---
      final admin = UserModel()
        ..name = 'Principal Office'
        ..email = 'admin@avcconnect.edu'
        ..password = 'admin123'
        ..role = UserRole.admin;
      await isar.userModels.put(admin);

      // --- Faculty: a few real-flavored names across departments ---
      final facultySeed = [
        ('Dr. R. Kalaiselvi', 'CSE', 'Professor & HOD', ['Data Structures', 'Operating Systems']),
        ('Dr. S. Manikandan', 'IT', 'Associate Professor', ['Database Management Systems']),
        ('Dr. P. Vidhya', 'ECE', 'Assistant Professor', ['Digital Signal Processing']),
        ('Mr. T. Saravanan', 'AIDS', 'Assistant Professor', ['Machine Learning']),
        ('Mrs. K. Anitha', 'EEE', 'Assistant Professor', ['Electrical Machines']),
      ];

      final facultyProfileIds = <String, int>{}; // department -> facultyProfileId (first one)

      for (final (name, dept, designation, subjects) in facultySeed) {
        final user = UserModel()
          ..name = name
          ..email = '${name.split(' ').last.toLowerCase()}@avcconnect.edu'
          ..password = 'faculty123'
          ..role = UserRole.faculty
          ..department = dept;
        final userId = await isar.userModels.put(user);

        final facultyProfile = FacultyModel()
          ..userId = userId
          ..department = dept
          ..designation = designation
          ..subjectsTaught = subjects;
        final facultyId = await isar.facultyModels.put(facultyProfile);

        user.facultyProfileId = facultyId;
        await isar.userModels.put(user);

        facultyProfileIds.putIfAbsent(dept, () => facultyId);
      }

      // --- Students: sample set across CSE, IT, ECE, AIDS ---
      final studentSeed = [
        ('Arun Prakash', 'CSE', 2, 'A', 'AU24CSE014'),
        ('Divya Sri', 'CSE', 2, 'A', 'AU24CSE027'),
        ('Mohammed Yasin', 'IT', 3, 'B', 'AU23IT041'),
        ('Priya Dharshini', 'ECE', 1, 'A', 'AU25ECE009'),
        ('Karthik Raja', 'AIDS', 2, 'A', 'AU24AIDS018'),
        ('Swetha Lakshmi', 'CSE', 4, 'A', 'AU22CSE052'),
      ];

      for (final (name, dept, year, section, roll) in studentSeed) {
        final user = UserModel()
          ..name = name
          ..email = '${roll.toLowerCase()}@avcconnect.edu'
          ..password = 'student123'
          ..role = UserRole.student
          ..department = dept;
        final userId = await isar.userModels.put(user);

        final studentProfile = StudentModel()
          ..userId = userId
          ..rollNumber = roll
          ..department = dept
          ..yearOfStudy = year
          ..section = section
          ..hostelBlock = year.isEven ? "Men's Hostel - Block A" : null
          ..roomNumber = year.isEven ? '${100 + year}' : null;
        final studentId = await isar.studentModels.put(studentProfile);

        user.studentProfileId = studentId;
        await isar.userModels.put(user);
      }

      // --- A few timetable slots for CSE Year 2 Section A ---
      final cseFacultyId = facultyProfileIds['CSE'];
      if (cseFacultyId != null) {
        final slots = [
          ClassSlotModel()
            ..day = WeekDay.monday
            ..startTime = '09:00'
            ..endTime = '09:50'
            ..subjectName = 'Data Structures'
            ..subjectCode = 'CS8391'
            ..department = 'CSE'
            ..yearOfStudy = 2
            ..section = 'A'
            ..facultyProfileId = cseFacultyId
            ..roomNumber = 'Block C - 204',
          ClassSlotModel()
            ..day = WeekDay.monday
            ..startTime = '10:00'
            ..endTime = '10:50'
            ..subjectName = 'Operating Systems'
            ..subjectCode = 'CS8493'
            ..department = 'CSE'
            ..yearOfStudy = 2
            ..section = 'A'
            ..facultyProfileId = cseFacultyId
            ..roomNumber = 'Block C - 204',
        ];
        await isar.classSlotModels.putAll(slots);
      }

      // --- Notices ---
      final notices = [
        NoticeModel()
          ..title = 'Commencement of Class Work - Odd Semester 2026-27'
          ..body = 'All students are informed that odd semester classes commence as per the academic calendar.'
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(days: 2)),
        NoticeModel()
          ..title = 'Project Prototype Showcase 2026'
          ..body = 'Final year students across all departments are invited to showcase their project prototypes.'
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(days: 1)),
      ];
      await isar.noticeModels.putAll(notices);
    });
  }
}