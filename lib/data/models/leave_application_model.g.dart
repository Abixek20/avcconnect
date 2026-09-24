// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_application_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLeaveApplicationModelCollection on Isar {
  IsarCollection<LeaveApplicationModel> get leaveApplicationModels =>
      this.collection();
}

const LeaveApplicationModelSchema = CollectionSchema(
  name: r'LeaveApplicationModel',
  id: -6126706577042344516,
  properties: {
    r'appliedAt': PropertySchema(
      id: 0,
      name: r'appliedAt',
      type: IsarType.dateTime,
    ),
    r'department': PropertySchema(
      id: 1,
      name: r'department',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 2,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'reason': PropertySchema(
      id: 3,
      name: r'reason',
      type: IsarType.string,
    ),
    r'remarksByFaculty': PropertySchema(
      id: 4,
      name: r'remarksByFaculty',
      type: IsarType.string,
    ),
    r'reviewedAt': PropertySchema(
      id: 5,
      name: r'reviewedAt',
      type: IsarType.dateTime,
    ),
    r'reviewedByUserId': PropertySchema(
      id: 6,
      name: r'reviewedByUserId',
      type: IsarType.long,
    ),
    r'rollNumber': PropertySchema(
      id: 7,
      name: r'rollNumber',
      type: IsarType.string,
    ),
    r'section': PropertySchema(
      id: 8,
      name: r'section',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 9,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _LeaveApplicationModelstatusEnumValueMap,
    ),
    r'studentName': PropertySchema(
      id: 11,
      name: r'studentName',
      type: IsarType.string,
    ),
    r'studentProfileId': PropertySchema(
      id: 12,
      name: r'studentProfileId',
      type: IsarType.long,
    ),
    r'totalDays': PropertySchema(
      id: 13,
      name: r'totalDays',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 14,
      name: r'type',
      type: IsarType.byte,
      enumMap: _LeaveApplicationModeltypeEnumValueMap,
    ),
    r'yearOfStudy': PropertySchema(
      id: 15,
      name: r'yearOfStudy',
      type: IsarType.long,
    )
  },
  estimateSize: _leaveApplicationModelEstimateSize,
  serialize: _leaveApplicationModelSerialize,
  deserialize: _leaveApplicationModelDeserialize,
  deserializeProp: _leaveApplicationModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'startDate': IndexSchema(
      id: 7723980484494730382,
      name: r'startDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _leaveApplicationModelGetId,
  getLinks: _leaveApplicationModelGetLinks,
  attach: _leaveApplicationModelAttach,
  version: '3.3.2',
);

int _leaveApplicationModelEstimateSize(
  LeaveApplicationModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.reason.length * 3;
  {
    final value = object.remarksByFaculty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.rollNumber.length * 3;
  bytesCount += 3 + object.section.length * 3;
  bytesCount += 3 + object.studentName.length * 3;
  return bytesCount;
}

void _leaveApplicationModelSerialize(
  LeaveApplicationModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.appliedAt);
  writer.writeString(offsets[1], object.department);
  writer.writeDateTime(offsets[2], object.endDate);
  writer.writeString(offsets[3], object.reason);
  writer.writeString(offsets[4], object.remarksByFaculty);
  writer.writeDateTime(offsets[5], object.reviewedAt);
  writer.writeLong(offsets[6], object.reviewedByUserId);
  writer.writeString(offsets[7], object.rollNumber);
  writer.writeString(offsets[8], object.section);
  writer.writeDateTime(offsets[9], object.startDate);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeString(offsets[11], object.studentName);
  writer.writeLong(offsets[12], object.studentProfileId);
  writer.writeLong(offsets[13], object.totalDays);
  writer.writeByte(offsets[14], object.type.index);
  writer.writeLong(offsets[15], object.yearOfStudy);
}

LeaveApplicationModel _leaveApplicationModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LeaveApplicationModel();
  object.appliedAt = reader.readDateTime(offsets[0]);
  object.department = reader.readString(offsets[1]);
  object.endDate = reader.readDateTime(offsets[2]);
  object.id = id;
  object.reason = reader.readString(offsets[3]);
  object.remarksByFaculty = reader.readStringOrNull(offsets[4]);
  object.reviewedAt = reader.readDateTimeOrNull(offsets[5]);
  object.reviewedByUserId = reader.readLongOrNull(offsets[6]);
  object.rollNumber = reader.readString(offsets[7]);
  object.section = reader.readString(offsets[8]);
  object.startDate = reader.readDateTime(offsets[9]);
  object.status = _LeaveApplicationModelstatusValueEnumMap[
          reader.readByteOrNull(offsets[10])] ??
      LeaveStatus.pending;
  object.studentName = reader.readString(offsets[11]);
  object.studentProfileId = reader.readLong(offsets[12]);
  object.totalDays = reader.readLong(offsets[13]);
  object.type = _LeaveApplicationModeltypeValueEnumMap[
          reader.readByteOrNull(offsets[14])] ??
      LeaveType.leave;
  object.yearOfStudy = reader.readLong(offsets[15]);
  return object;
}

P _leaveApplicationModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (_LeaveApplicationModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          LeaveStatus.pending) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (_LeaveApplicationModeltypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          LeaveType.leave) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LeaveApplicationModelstatusEnumValueMap = {
  'pending': 0,
  'approved': 1,
  'rejected': 2,
};
const _LeaveApplicationModelstatusValueEnumMap = {
  0: LeaveStatus.pending,
  1: LeaveStatus.approved,
  2: LeaveStatus.rejected,
};
const _LeaveApplicationModeltypeEnumValueMap = {
  'leave': 0,
  'onDuty': 1,
};
const _LeaveApplicationModeltypeValueEnumMap = {
  0: LeaveType.leave,
  1: LeaveType.onDuty,
};

Id _leaveApplicationModelGetId(LeaveApplicationModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _leaveApplicationModelGetLinks(
    LeaveApplicationModel object) {
  return [];
}

void _leaveApplicationModelAttach(
    IsarCollection<dynamic> col, Id id, LeaveApplicationModel object) {
  object.id = id;
}

extension LeaveApplicationModelQueryWhereSort
    on QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QWhere> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhere>
      anyStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startDate'),
      );
    });
  }
}

extension LeaveApplicationModelQueryWhere on QueryBuilder<LeaveApplicationModel,
    LeaveApplicationModel, QWhereClause> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      startDateEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startDate',
        value: [startDate],
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      startDateNotEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      startDateGreaterThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [startDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      startDateLessThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [],
        upper: [startDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterWhereClause>
      startDateBetween(
    DateTime lowerStartDate,
    DateTime upperStartDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [lowerStartDate],
        includeLower: includeLower,
        upper: [upperStartDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LeaveApplicationModelQueryFilter on QueryBuilder<
    LeaveApplicationModel, LeaveApplicationModel, QFilterCondition> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> appliedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appliedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> appliedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appliedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> appliedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appliedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> appliedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appliedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      reasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      reasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reason',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remarksByFaculty',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remarksByFaculty',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remarksByFaculty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      remarksByFacultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarksByFaculty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      remarksByFacultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarksByFaculty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarksByFaculty',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> remarksByFacultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarksByFaculty',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewedAt',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewedAt',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewedByUserId',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewedByUserId',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> reviewedByUserIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rollNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      rollNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      rollNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rollNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rollNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> rollNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rollNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'section',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      sectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      sectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'section',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'section',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> sectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'section',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> statusEqualTo(LeaveStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> statusGreaterThan(
    LeaveStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> statusLessThan(
    LeaveStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> statusBetween(
    LeaveStatus lower,
    LeaveStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      studentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
          QAfterFilterCondition>
      studentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentName',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentName',
        value: '',
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentProfileIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentProfileIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> studentProfileIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentProfileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> totalDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> totalDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> totalDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDays',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> totalDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> typeEqualTo(LeaveType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> typeGreaterThan(
    LeaveType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> typeLessThan(
    LeaveType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> typeBetween(
    LeaveType lower,
    LeaveType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> yearOfStudyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearOfStudy',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> yearOfStudyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearOfStudy',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> yearOfStudyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearOfStudy',
        value: value,
      ));
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel,
      QAfterFilterCondition> yearOfStudyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearOfStudy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LeaveApplicationModelQueryObject on QueryBuilder<
    LeaveApplicationModel, LeaveApplicationModel, QFilterCondition> {}

extension LeaveApplicationModelQueryLinks on QueryBuilder<LeaveApplicationModel,
    LeaveApplicationModel, QFilterCondition> {}

extension LeaveApplicationModelQuerySortBy
    on QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QSortBy> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByAppliedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appliedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByAppliedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appliedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByRemarksByFaculty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarksByFaculty', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByRemarksByFacultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarksByFaculty', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReviewedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedByUserId', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByReviewedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedByUserId', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByRollNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByRollNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStudentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentName', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStudentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentName', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByTotalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      sortByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension LeaveApplicationModelQuerySortThenBy
    on QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QSortThenBy> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByAppliedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appliedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByAppliedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appliedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reason', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByRemarksByFaculty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarksByFaculty', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByRemarksByFacultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarksByFaculty', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedAt', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReviewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedAt', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReviewedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedByUserId', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByReviewedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewedByUserId', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByRollNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByRollNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStudentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentName', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStudentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentName', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByTotalDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDays', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QAfterSortBy>
      thenByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension LeaveApplicationModelQueryWhereDistinct
    on QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct> {
  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByAppliedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appliedAt');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reason', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByRemarksByFaculty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarksByFaculty',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByReviewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewedAt');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByReviewedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewedByUserId');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByRollNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rollNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctBySection({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByStudentName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByTotalDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDays');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveApplicationModel, QDistinct>
      distinctByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearOfStudy');
    });
  }
}

extension LeaveApplicationModelQueryProperty on QueryBuilder<
    LeaveApplicationModel, LeaveApplicationModel, QQueryProperty> {
  QueryBuilder<LeaveApplicationModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LeaveApplicationModel, DateTime, QQueryOperations>
      appliedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appliedAt');
    });
  }

  QueryBuilder<LeaveApplicationModel, String, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<LeaveApplicationModel, DateTime, QQueryOperations>
      endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<LeaveApplicationModel, String, QQueryOperations>
      reasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reason');
    });
  }

  QueryBuilder<LeaveApplicationModel, String?, QQueryOperations>
      remarksByFacultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarksByFaculty');
    });
  }

  QueryBuilder<LeaveApplicationModel, DateTime?, QQueryOperations>
      reviewedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewedAt');
    });
  }

  QueryBuilder<LeaveApplicationModel, int?, QQueryOperations>
      reviewedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewedByUserId');
    });
  }

  QueryBuilder<LeaveApplicationModel, String, QQueryOperations>
      rollNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rollNumber');
    });
  }

  QueryBuilder<LeaveApplicationModel, String, QQueryOperations>
      sectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<LeaveApplicationModel, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LeaveApplicationModel, String, QQueryOperations>
      studentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentName');
    });
  }

  QueryBuilder<LeaveApplicationModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }

  QueryBuilder<LeaveApplicationModel, int, QQueryOperations>
      totalDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDays');
    });
  }

  QueryBuilder<LeaveApplicationModel, LeaveType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<LeaveApplicationModel, int, QQueryOperations>
      yearOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearOfStudy');
    });
  }
}
