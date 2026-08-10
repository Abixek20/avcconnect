// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAttendanceModelCollection on Isar {
  IsarCollection<AttendanceModel> get attendanceModels => this.collection();
}

const AttendanceModelSchema = CollectionSchema(
  name: r'AttendanceModel',
  id: -8601204094621324448,
  properties: {
    r'classSlotId': PropertySchema(
      id: 0,
      name: r'classSlotId',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'markedByFacultyId': PropertySchema(
      id: 2,
      name: r'markedByFacultyId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.byte,
      enumMap: _AttendanceModelstatusEnumValueMap,
    ),
    r'studentProfileId': PropertySchema(
      id: 4,
      name: r'studentProfileId',
      type: IsarType.long,
    )
  },
  estimateSize: _attendanceModelEstimateSize,
  serialize: _attendanceModelSerialize,
  deserialize: _attendanceModelDeserialize,
  deserializeProp: _attendanceModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _attendanceModelGetId,
  getLinks: _attendanceModelGetLinks,
  attach: _attendanceModelAttach,
  version: '3.3.2',
);

int _attendanceModelEstimateSize(
  AttendanceModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _attendanceModelSerialize(
  AttendanceModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.classSlotId);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeLong(offsets[2], object.markedByFacultyId);
  writer.writeByte(offsets[3], object.status.index);
  writer.writeLong(offsets[4], object.studentProfileId);
}

AttendanceModel _attendanceModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AttendanceModel();
  object.classSlotId = reader.readLong(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.id = id;
  object.markedByFacultyId = reader.readLong(offsets[2]);
  object.status =
      _AttendanceModelstatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          AttendanceStatus.present;
  object.studentProfileId = reader.readLong(offsets[4]);
  return object;
}

P _attendanceModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (_AttendanceModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AttendanceStatus.present) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AttendanceModelstatusEnumValueMap = {
  'present': 0,
  'absent': 1,
};
const _AttendanceModelstatusValueEnumMap = {
  0: AttendanceStatus.present,
  1: AttendanceStatus.absent,
};

Id _attendanceModelGetId(AttendanceModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _attendanceModelGetLinks(AttendanceModel object) {
  return [];
}

void _attendanceModelAttach(
    IsarCollection<dynamic> col, Id id, AttendanceModel object) {
  object.id = id;
}

extension AttendanceModelQueryWhereSort
    on QueryBuilder<AttendanceModel, AttendanceModel, QWhere> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension AttendanceModelQueryWhere
    on QueryBuilder<AttendanceModel, AttendanceModel, QWhereClause> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause>
      dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AttendanceModelQueryFilter
    on QueryBuilder<AttendanceModel, AttendanceModel, QFilterCondition> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      classSlotIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      classSlotIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      classSlotIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      classSlotIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classSlotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      markedByFacultyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'markedByFacultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      markedByFacultyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'markedByFacultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      markedByFacultyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'markedByFacultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      markedByFacultyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'markedByFacultyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      statusEqualTo(AttendanceStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      statusGreaterThan(
    AttendanceStatus value, {
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      statusLessThan(
    AttendanceStatus value, {
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      statusBetween(
    AttendanceStatus lower,
    AttendanceStatus upper, {
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      studentProfileIdGreaterThan(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      studentProfileIdLessThan(
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

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterFilterCondition>
      studentProfileIdBetween(
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
}

extension AttendanceModelQueryObject
    on QueryBuilder<AttendanceModel, AttendanceModel, QFilterCondition> {}

extension AttendanceModelQueryLinks
    on QueryBuilder<AttendanceModel, AttendanceModel, QFilterCondition> {}

extension AttendanceModelQuerySortBy
    on QueryBuilder<AttendanceModel, AttendanceModel, QSortBy> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByClassSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classSlotId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByClassSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classSlotId', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByMarkedByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByFacultyId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByMarkedByFacultyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByFacultyId', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension AttendanceModelQuerySortThenBy
    on QueryBuilder<AttendanceModel, AttendanceModel, QSortThenBy> {
  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByClassSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classSlotId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByClassSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classSlotId', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByMarkedByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByFacultyId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByMarkedByFacultyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'markedByFacultyId', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension AttendanceModelQueryWhereDistinct
    on QueryBuilder<AttendanceModel, AttendanceModel, QDistinct> {
  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByClassSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classSlotId');
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByMarkedByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'markedByFacultyId');
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<AttendanceModel, AttendanceModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }
}

extension AttendanceModelQueryProperty
    on QueryBuilder<AttendanceModel, AttendanceModel, QQueryProperty> {
  QueryBuilder<AttendanceModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AttendanceModel, int, QQueryOperations> classSlotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classSlotId');
    });
  }

  QueryBuilder<AttendanceModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<AttendanceModel, int, QQueryOperations>
      markedByFacultyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'markedByFacultyId');
    });
  }

  QueryBuilder<AttendanceModel, AttendanceStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<AttendanceModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }
}
