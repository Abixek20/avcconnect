import 'package:flutter/material.dart';

import '../../data/models/complaint_model.dart';

String complaintCategoryLabel(ComplaintCategory category) {
  switch (category) {
    case ComplaintCategory.academic:
      return 'Academic';
    case ComplaintCategory.hostel:
      return 'Hostel';
    case ComplaintCategory.canteen:
      return 'Canteen';
    case ComplaintCategory.infrastructure:
      return 'Infrastructure';
    case ComplaintCategory.other:
      return 'Other';
  }
}

IconData complaintCategoryIcon(ComplaintCategory category) {
  switch (category) {
    case ComplaintCategory.academic:
      return Icons.school_outlined;
    case ComplaintCategory.hostel:
      return Icons.holiday_village_outlined;
    case ComplaintCategory.canteen:
      return Icons.restaurant_outlined;
    case ComplaintCategory.infrastructure:
      return Icons.construction_outlined;
    case ComplaintCategory.other:
      return Icons.more_horiz;
  }
}

String complaintStatusLabel(ComplaintStatus status) {
  switch (status) {
    case ComplaintStatus.open:
      return 'Open';
    case ComplaintStatus.inProgress:
      return 'In Progress';
    case ComplaintStatus.resolved:
      return 'Resolved';
  }
}

Color complaintStatusColor(ComplaintStatus status) {
  switch (status) {
    case ComplaintStatus.open:
      return Colors.redAccent;
    case ComplaintStatus.inProgress:
      return Colors.orange;
    case ComplaintStatus.resolved:
      return Colors.green;
  }
}
