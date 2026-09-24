import 'package:isar_community/isar.dart';

import '../models/academic_event_model.dart';
import '../models/advisor_meeting_log_model.dart';
import '../models/attendance_model.dart';
import '../models/book_model.dart';
import '../models/class_slot_model.dart';
import '../models/co_curricular_model.dart';
import '../models/complaint_model.dart';
import '../models/counselling_record_model.dart';
import '../models/department_model.dart';
import '../models/exam_schedule_model.dart';
import '../models/faculty_model.dart';
import '../models/fee_model.dart';
import '../models/issued_book_model.dart';
import '../models/leave_application_model.dart';
import '../models/notice_model.dart';
import '../models/parent_guardian_model.dart';
import '../models/placement_training_model.dart';
import '../models/semester_record_model.dart';
import '../models/student_model.dart';
import '../models/subject_grade_model.dart';
import '../models/user_model.dart';
import 'database_service.dart';

/// Seeds the local Isar DB with rich mock data modeled on
/// A.V.C. College of Engineering, Mannampandal, Mayiladuthurai.
///
/// Seed version: 4 — updated with multi-department timetables, library catalog,
/// academic events, exam schedules, leave applications, and categorized notices.
class SeedService {
  static const _seedVersion = 4;

  static Future<void> seedIfEmpty() async {
    final isar = DatabaseService.instance;

    final versionMarker = await isar.departmentModels
        .filter()
        .codeEqualTo('__seed_v$_seedVersion')
        .findFirst();
    if (versionMarker != null) return; // already at version 4

    // Clear existing data for fresh seed
    await isar.writeTxn(() async {
      await isar.departmentModels.clear();
      await isar.userModels.clear();
      await isar.facultyModels.clear();
      await isar.studentModels.clear();
      await isar.classSlotModels.clear();
      await isar.attendanceModels.clear();
      await isar.noticeModels.clear();
      await isar.feeModels.clear();
      await isar.counsellingRecordModels.clear();
      await isar.parentGuardianModels.clear();
      await isar.semesterRecordModels.clear();
      await isar.subjectGradeModels.clear();
      await isar.placementTrainingModels.clear();
      await isar.coCurricularModels.clear();
      await isar.advisorMeetingLogModels.clear();
      await isar.academicEventModels.clear();
      await isar.examScheduleModels.clear();
      await isar.leaveApplicationModels.clear();
      await isar.bookModels.clear();
      await isar.issuedBookModels.clear();
      await isar.complaintModels.clear();
    });

    await isar.writeTxn(() async {
      // Version marker
      await isar.departmentModels.put(
        DepartmentModel()..code = '__seed_v$_seedVersion' ..fullName = 'Seed Version Marker',
      );

      // Departments
      final departments = [
        DepartmentModel()..code = 'AIDS' ..fullName = 'Artificial Intelligence and Data Science',
        DepartmentModel()..code = 'CE'   ..fullName = 'Civil Engineering',
        DepartmentModel()..code = 'CSE'  ..fullName = 'Computer Science and Engineering',
        DepartmentModel()..code = 'EEE'  ..fullName = 'Electrical and Electronics Engineering',
        DepartmentModel()..code = 'ECE'  ..fullName = 'Electronics and Communication Engineering',
        DepartmentModel()..code = 'IT'   ..fullName = 'Information Technology',
        DepartmentModel()..code = 'ICE'  ..fullName = 'Instrumentation and Control Engineering',
        DepartmentModel()..code = 'ME'   ..fullName = 'Mechanical Engineering',
      ];
      await isar.departmentModels.putAll(departments);

      // Admin User
      final admin = UserModel()
        ..name = 'Principal Office'
        ..email = 'admin@avcconnect.edu'
        ..password = 'admin123'
        ..role = UserRole.admin;
      await isar.userModels.put(admin);

      // Faculty Profiles
      final facultySeed = [
        ('Dr. R. Kalaiselvi',  'CSE', 'Professor & HOD',      ['Data Structures', 'Operating Systems']),
        ('Dr. S. Manikandan',  'IT',  'Associate Professor',  ['Database Management Systems', 'Web Tech']),
        ('Dr. P. Vidhya',      'ECE', 'Assistant Professor',  ['Digital Signal Processing', 'VLSI']),
        ('Mr. T. Saravanan',   'AIDS','Assistant Professor',  ['Machine Learning', 'Python AI']),
        ('Mrs. K. Anitha',     'EEE', 'Assistant Professor',  ['Electrical Machines', 'Power Systems']),
      ];

      final facultyProfileIds = <String, int>{};

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
        facultyProfileIds[dept] = facultyId;
      }

      // Student Profiles across multiple departments
      final studentSeed = [
        ('Arun Prakash',      'CSE', 2, 'A', 'AU24CSE014'),
        ('Divya Sri',         'CSE', 2, 'A', 'AU24CSE027'),
        ('Mohammed Yasin',    'IT',  3, 'B', 'AU23IT041'),
        ('Priya Dharshini',   'ECE', 1, 'A', 'AU25ECE009'),
        ('Karthik Raja',      'AIDS',2, 'A', 'AU24AIDS018'),
        ('Swetha Lakshmi',    'CSE', 4, 'A', 'AU22CSE052'),
      ];

      final allStudentIds = <String, int>{};

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
        allStudentIds[roll] = studentId;
      }

      // Timetable Slots for CSE Yr 2 Sec A
      final cseFacultyId = facultyProfileIds['CSE']!;
      ClassSlotModel _slot(WeekDay day, String start, String end, String subj, String code, String dept, int year, String sec, int facId, String room) =>
          ClassSlotModel()
            ..day = day
            ..startTime = start
            ..endTime = end
            ..subjectName = subj
            ..subjectCode = code
            ..department = dept
            ..yearOfStudy = year
            ..section = sec
            ..facultyProfileId = facId
            ..roomNumber = room;

      final allSlots = <ClassSlotModel>[
        // CSE Yr 2 A
        _slot(WeekDay.monday, '09:00', '09:50', 'Data Structures', 'CS3301', 'CSE', 2, 'A', cseFacultyId, 'Block C – 204'),
        _slot(WeekDay.monday, '09:50', '10:40', 'Object Oriented Programming', 'CS3391', 'CSE', 2, 'A', cseFacultyId, 'Block C – 204'),
        _slot(WeekDay.monday, '10:55', '11:45', 'Discrete Mathematics', 'MA3354', 'CSE', 2, 'A', cseFacultyId, 'Block C – 204'),
        _slot(WeekDay.tuesday, '09:00', '09:50', 'Operating Systems', 'CS3451', 'CSE', 2, 'A', cseFacultyId, 'Block C – 204'),
        _slot(WeekDay.tuesday, '10:55', '11:45', 'Database Management Systems', 'CS3492', 'CSE', 2, 'A', cseFacultyId, 'Block C – 204'),

        // IT Yr 3 B
        _slot(WeekDay.monday, '09:00', '09:50', 'Web Technology', 'IT3501', 'IT', 3, 'B', facultyProfileIds['IT']!, 'Block B – 301'),
        _slot(WeekDay.monday, '09:50', '10:40', 'Database Systems', 'IT3502', 'IT', 3, 'B', facultyProfileIds['IT']!, 'Block B – 301'),
        _slot(WeekDay.tuesday, '09:00', '09:50', 'Cloud Computing', 'IT3503', 'IT', 3, 'B', facultyProfileIds['IT']!, 'Block B – 301'),

        // ECE Yr 1 A
        _slot(WeekDay.monday, '09:00', '09:50', 'Circuit Analysis', 'EC3151', 'ECE', 1, 'A', facultyProfileIds['ECE']!, 'Block E – 102'),
        _slot(WeekDay.tuesday, '09:50', '10:40', 'Engineering Physics', 'PH3151', 'ECE', 1, 'A', facultyProfileIds['ECE']!, 'Block E – 102'),

        // AIDS Yr 2 A
        _slot(WeekDay.monday, '09:00', '09:50', 'Machine Learning Foundations', 'AD3301', 'AIDS', 2, 'A', facultyProfileIds['AIDS']!, 'Block A – 402'),
        _slot(WeekDay.tuesday, '09:00', '09:50', 'Python for Data Science', 'AD3351', 'AIDS', 2, 'A', facultyProfileIds['AIDS']!, 'Block A – 402'),
      ];

      final insertedSlots = <ClassSlotModel>[];
      for (final s in allSlots) {
        final id = await isar.classSlotModels.put(s);
        s.id = id;
        insertedSlots.add(s);
      }

      // Attendance records for all seeded students
      final random = _SeededRandom(42);
      final attendanceList = <AttendanceModel>[];
      for (final studentId in allStudentIds.values) {
        for (final slot in insertedSlots) {
          for (int d = 0; d < 20; d++) {
            attendanceList.add(
              AttendanceModel()
                ..studentProfileId = studentId
                ..classSlotId = slot.id
                ..date = DateTime.now().subtract(Duration(days: 20 - d))
                ..status = (random.nextInt(100) < 85) ? AttendanceStatus.present : AttendanceStatus.absent
                ..markedByFacultyId = cseFacultyId,
            );
          }
        }
      }
      await isar.attendanceModels.putAll(attendanceList);

      // Categorized Notices
      final notices = [
        NoticeModel()
          ..title = 'Commencement of CIA-I Examinations 2026'
          ..body = 'Internal Assessment I commences on Oct 5th. All hall tickets can be viewed under the Exams tab on AVC Connect.'
          ..category = 'Exam'
          ..isRead = false
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(hours: 3)),
        NoticeModel()
          ..title = 'AVTECH 2026 National Technical Symposium'
          ..body = 'Registration is now open for AVTECH 2026! Events include Paper Presentation, Coding Contest, and Robotics Challenge.'
          ..category = 'Event'
          ..isRead = false
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(days: 1)),
        NoticeModel()
          ..title = 'Odd Semester Academic Calendar Schedule'
          ..body = 'Classes will remain suspended on Oct 2nd on account of Gandhi Jayanti. Revised lab schedules are updated on the portal.'
          ..category = 'Academic'
          ..isRead = true
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(days: 2)),
        NoticeModel()
          ..title = 'Library Book Return & Renewal Guidelines'
          ..body = 'Students with overdue library books are requested to clear fines or submit renewal requests through the digital library view.'
          ..category = 'General'
          ..isRead = true
          ..postedByUserId = admin.id
          ..postedAt = DateTime.now().subtract(const Duration(days: 4)),
      ];
      await isar.noticeModels.putAll(notices);

      // Academic Events (Holidays, Exams, Fests)
      final events = [
        AcademicEventModel()
          ..title = 'Gandhi Jayanti Holiday'
          ..description = 'National holiday - Campus offices and academic blocks remain closed.'
          ..eventDate = DateTime(2026, 10, 2)
          ..category = EventCategory.holiday
          ..isHoliday = true
          ..location = 'Campus Wide',
        AcademicEventModel()
          ..title = 'CIA-I Internal Assessment Exams'
          ..description = 'First continuous internal assessment examinations for 2nd, 3rd, and 4th year B.E. students.'
          ..eventDate = DateTime(2026, 10, 5)
          ..endDate = DateTime(2026, 10, 10)
          ..category = EventCategory.exam
          ..isHoliday = false
          ..location = 'Examination Block C & Main Hall',
        AcademicEventModel()
          ..title = 'AVTECH 2026 Technical Fest'
          ..description = 'Annual inter-collegiate technical fest featuring hackathons, paper presentations, and tech quizzes.'
          ..eventDate = DateTime(2026, 10, 22)
          ..endDate = DateTime(2026, 10, 23)
          ..category = EventCategory.fest
          ..isHoliday = false
          ..location = 'Main Auditorium',
        AcademicEventModel()
          ..title = 'Deepavali Festival Vacation'
          ..description = 'College closes for Deepavali festival celebrations.'
          ..eventDate = DateTime(2026, 11, 8)
          ..endDate = DateTime(2026, 11, 12)
          ..category = EventCategory.holiday
          ..isHoliday = true
          ..location = 'Campus Wide',
      ];
      await isar.academicEventModels.putAll(events);

      // Exam Schedules
      final examSchedules = [
        ExamScheduleModel()
          ..department = 'CSE'
          ..yearOfStudy = 2
          ..semester = 'Sem 3'
          ..subjectCode = 'CS3301'
          ..subjectName = 'Data Structures'
          ..examDate = DateTime(2026, 10, 5)
          ..session = 'FN'
          ..timeSlot = '09:30 AM - 12:30 PM'
          ..hallNumber = 'Block C - Hall 102'
          ..examType = 'CIA-I',
        ExamScheduleModel()
          ..department = 'CSE'
          ..yearOfStudy = 2
          ..semester = 'Sem 3'
          ..subjectCode = 'CS3391'
          ..subjectName = 'Object Oriented Programming'
          ..examDate = DateTime(2026, 10, 6)
          ..session = 'AN'
          ..timeSlot = '01:30 PM - 04:30 PM'
          ..hallNumber = 'Block C - Hall 102'
          ..examType = 'CIA-I',
        ExamScheduleModel()
          ..department = 'CSE'
          ..yearOfStudy = 2
          ..semester = 'Sem 3'
          ..subjectCode = 'CS3451'
          ..subjectName = 'Operating Systems'
          ..examDate = DateTime(2026, 10, 7)
          ..session = 'FN'
          ..timeSlot = '09:30 AM - 12:30 PM'
          ..hallNumber = 'Block C - Hall 102'
          ..examType = 'CIA-I',
        ExamScheduleModel()
          ..department = 'IT'
          ..yearOfStudy = 3
          ..semester = 'Sem 5'
          ..subjectCode = 'IT3501'
          ..subjectName = 'Web Technology'
          ..examDate = DateTime(2026, 10, 5)
          ..session = 'FN'
          ..timeSlot = '09:30 AM - 12:30 PM'
          ..hallNumber = 'Block B - Hall 301'
          ..examType = 'CIA-I',
      ];
      await isar.examScheduleModels.putAll(examSchedules);

      // Leave & OD Applications
      final arunProfileId = allStudentIds['AU24CSE014']!;
      final yasinProfileId = allStudentIds['AU23IT041']!;
      final leaveApps = [
        LeaveApplicationModel()
          ..studentProfileId = arunProfileId
          ..studentName = 'Arun Prakash'
          ..rollNumber = 'AU24CSE014'
          ..department = 'CSE'
          ..yearOfStudy = 2
          ..section = 'A'
          ..type = LeaveType.onDuty
          ..reason = 'Representing AVC College at Smart India Hackathon zonal round'
          ..startDate = DateTime.now().add(const Duration(days: 3))
          ..endDate = DateTime.now().add(const Duration(days: 5))
          ..totalDays = 3
          ..status = LeaveStatus.approved
          ..remarksByFaculty = 'Approved. Produce attendance certificate post return.'
          ..appliedAt = DateTime.now().subtract(const Duration(days: 1)),
        LeaveApplicationModel()
          ..studentProfileId = yasinProfileId
          ..studentName = 'Mohammed Yasin'
          ..rollNumber = 'AU23IT041'
          ..department = 'IT'
          ..yearOfStudy = 3
          ..section = 'B'
          ..type = LeaveType.leave
          ..reason = 'Medical leave due to viral fever'
          ..startDate = DateTime.now().subtract(const Duration(days: 2))
          ..endDate = DateTime.now()
          ..totalDays = 3
          ..status = LeaveStatus.pending
          ..appliedAt = DateTime.now().subtract(const Duration(days: 2)),
      ];
      await isar.leaveApplicationModels.putAll(leaveApps);

      // Library Catalog & Borrowed Books
      final books = [
        BookModel()
          ..isbn = '978-0131103627'
          ..title = 'The C Programming Language'
          ..author = 'Brian W. Kernighan, Dennis M. Ritchie'
          ..department = 'CSE'
          ..category = 'Textbook'
          ..totalCopies = 12
          ..availableCopies = 8
          ..shelfLocation = 'Rack A - Shelf 2',
        BookModel()
          ..isbn = '978-0262033848'
          ..title = 'Introduction to Algorithms (CLRS)'
          ..author = 'Thomas H. Cormen, Charles E. Leiserson'
          ..department = 'CSE'
          ..category = 'Reference'
          ..totalCopies = 8
          ..availableCopies = 3
          ..shelfLocation = 'Rack A - Shelf 4',
        BookModel()
          ..isbn = '978-0136086208'
          ..title = 'Artificial Intelligence: A Modern Approach'
          ..author = 'Stuart Russell, Peter Norvig'
          ..department = 'AIDS'
          ..category = 'Textbook'
          ..totalCopies = 10
          ..availableCopies = 6
          ..shelfLocation = 'Rack D - Shelf 1',
        BookModel()
          ..isbn = '978-0133970777'
          ..title = 'Operating System Concepts'
          ..author = 'Abraham Silberschatz, Peter B. Galvin'
          ..department = 'CSE'
          ..category = 'Textbook'
          ..totalCopies = 15
          ..availableCopies = 10
          ..shelfLocation = 'Rack B - Shelf 3',
        BookModel()
          ..isbn = '978-0078028229'
          ..title = 'Database System Concepts'
          ..author = 'Henry F. Korth, S. Sudarshan'
          ..department = 'IT'
          ..category = 'Textbook'
          ..totalCopies = 14
          ..availableCopies = 5
          ..shelfLocation = 'Rack C - Shelf 2',
      ];
      await isar.bookModels.putAll(books);

      final issuedBooks = [
        IssuedBookModel()
          ..bookId = 2
          ..studentProfileId = arunProfileId
          ..bookTitle = 'Introduction to Algorithms (CLRS)'
          ..author = 'Thomas H. Cormen'
          ..isbn = '978-0262033848'
          ..issuedDate = DateTime.now().subtract(const Duration(days: 10))
          ..dueDate = DateTime.now().add(const Duration(days: 4))
          ..fineAmount = 0.0
          ..isReturned = false,
        IssuedBookModel()
          ..bookId = 4
          ..studentProfileId = arunProfileId
          ..bookTitle = 'Operating System Concepts'
          ..author = 'Abraham Silberschatz'
          ..isbn = '978-0133970777'
          ..issuedDate = DateTime.now().subtract(const Duration(days: 20))
          ..dueDate = DateTime.now().subtract(const Duration(days: 2)) // past due date
          ..fineAmount = 10.0
          ..isReturned = false,
      ];
      await isar.issuedBookModels.putAll(issuedBooks);

      // Fee records for all students
      final allStudents = await isar.studentModels.where().findAll();
      final feeStatuses = [FeeStatus.paid, FeeStatus.due, FeeStatus.overdue];
      var idx = 0;
      for (final student in allStudents) {
        final fee = FeeModel()
          ..studentProfileId = student.id
          ..term = 'Semester ${student.yearOfStudy * 2 - 1}'
          ..amount = 45000
          ..dueDate = DateTime.now().add(const Duration(days: 15))
          ..status = feeStatuses[idx % feeStatuses.length];
        await isar.feeModels.put(fee);
        idx++;
      }

      // Counselling records for ALL students so no blank errors
      for (final student in allStudents) {
        final advisorId = facultyProfileIds[student.department] ?? facultyProfileIds.values.first;

        if (student.rollNumber == 'AU24CSE014') {
          final record = CounsellingRecordModel()
            ..studentProfileId = student.id
            ..facultyAdvisorId = advisorId
            ..bloodGroup = 'B+'
            ..category = 'General'
            ..permanentAddress = '12, Kovil Street, Mayiladuthurai, Tamil Nadu – 609001'
            ..emergencyContactName = 'Prakash Raman'
            ..emergencyContactPhone = '9876543210'
            ..transportMode = TransportMode.collegeBus
            ..busRouteNumber = 'Route 7'
            ..tenthPercentage = 91.4
            ..twelfthPercentage = 88.2
            ..scholarshipDetails = 'Tamil Nadu First Graduate Scholarship';
          await isar.counsellingRecordModels.put(record);

          await isar.parentGuardianModels.putAll([
            ParentGuardianModel()
              ..studentProfileId = student.id
              ..relation = GuardianRelation.father
              ..name = 'Prakash Raman'
              ..occupation = 'Farmer'
              ..phone = '9876543210',
            ParentGuardianModel()
              ..studentProfileId = student.id
              ..relation = GuardianRelation.mother
              ..name = 'Kalaivani Prakash'
              ..occupation = 'Homemaker'
              ..phone = '9876543211',
          ]);

          final sem1 = SemesterRecordModel()
            ..studentProfileId = student.id
            ..semesterNumber = 1
            ..sgpa = 8.4
            ..attendancePercent = 92
            ..arrearCount = 0;
          final sem1Id = await isar.semesterRecordModels.put(sem1);

          final sem2 = SemesterRecordModel()
            ..studentProfileId = student.id
            ..semesterNumber = 2
            ..sgpa = 8.7
            ..attendancePercent = 94
            ..arrearCount = 0;
          final sem2Id = await isar.semesterRecordModels.put(sem2);

          await isar.subjectGradeModels.putAll([
            SubjectGradeModel()
              ..semesterRecordId = sem1Id
              ..subjectName = 'Programming in C'
              ..subjectCode = 'CS8151'
              ..ciaMarks = 45
              ..semesterExamMarks = 82
              ..grade = 'A'
              ..gradePoint = 8.0,
            SubjectGradeModel()
              ..semesterRecordId = sem1Id
              ..subjectName = 'Engineering Mathematics I'
              ..subjectCode = 'MA8151'
              ..ciaMarks = 42
              ..semesterExamMarks = 78
              ..grade = 'B+'
              ..gradePoint = 7.5,
            SubjectGradeModel()
              ..semesterRecordId = sem2Id
              ..subjectName = 'Data Structures'
              ..subjectCode = 'CS3301'
              ..ciaMarks = 48
              ..semesterExamMarks = 88
              ..grade = 'A+'
              ..gradePoint = 9.0,
          ]);
        } else {
          final record = CounsellingRecordModel()
            ..studentProfileId = student.id
            ..facultyAdvisorId = advisorId
            ..bloodGroup = 'O+'
            ..category = 'General'
            ..permanentAddress = 'Mayiladuthurai Main Road, Tamil Nadu'
            ..emergencyContactName = 'Guardian Contact'
            ..emergencyContactPhone = '9876500000'
            ..transportMode = (student.hostelBlock != null) ? TransportMode.hosteller : TransportMode.collegeBus;
          await isar.counsellingRecordModels.put(record);

          final sem = SemesterRecordModel()
            ..studentProfileId = student.id
            ..semesterNumber = 1
            ..sgpa = 8.2
            ..attendancePercent = 88
            ..arrearCount = 0;
          final semId = await isar.semesterRecordModels.put(sem);

          await isar.subjectGradeModels.put(
            SubjectGradeModel()
              ..semesterRecordId = semId
              ..subjectName = 'Engineering Mathematics'
              ..subjectCode = 'MA3151'
              ..ciaMarks = 44
              ..semesterExamMarks = 80
              ..grade = 'A'
              ..gradePoint = 8.0,
          );
        }
      }
    });
  }
}

class _SeededRandom {
  int _state;
  _SeededRandom(this._state);

  int nextInt(int max) {
    _state = (_state * 1664525 + 1013904223) & 0xFFFFFFFF;
    return (_state >> 1) % max;
  }
}