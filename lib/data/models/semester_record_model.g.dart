// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSemesterRecordModelCollection on Isar {
  IsarCollection<SemesterRecordModel> get semesterRecordModels =>
      this.collection();
}

const SemesterRecordModelSchema = CollectionSchema(
  name: r'SemesterRecordModel',
  id: -5965449989839501107,
  properties: {
    r'arrearCount': PropertySchema(
      id: 0,
      name: r'arrearCount',
      type: IsarType.long,
    ),
    r'attendancePercent': PropertySchema(
      id: 1,
      name: r'attendancePercent',
      type: IsarType.double,
    ),
    r'semesterNumber': PropertySchema(
      id: 2,
      name: r'semesterNumber',
      type: IsarType.long,
    ),
    r'sgpa': PropertySchema(
      id: 3,
      name: r'sgpa',
      type: IsarType.double,
    ),
    r'studentProfileId': PropertySchema(
      id: 4,
      name: r'studentProfileId',
      type: IsarType.long,
    )
  },
  estimateSize: _semesterRecordModelEstimateSize,
  serialize: _semesterRecordModelSerialize,
  deserialize: _semesterRecordModelDeserialize,
  deserializeProp: _semesterRecordModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _semesterRecordModelGetId,
  getLinks: _semesterRecordModelGetLinks,
  attach: _semesterRecordModelAttach,
  version: '3.3.2',
);

int _semesterRecordModelEstimateSize(
  SemesterRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _semesterRecordModelSerialize(
  SemesterRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.arrearCount);
  writer.writeDouble(offsets[1], object.attendancePercent);
  writer.writeLong(offsets[2], object.semesterNumber);
  writer.writeDouble(offsets[3], object.sgpa);
  writer.writeLong(offsets[4], object.studentProfileId);
}

SemesterRecordModel _semesterRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SemesterRecordModel();
  object.arrearCount = reader.readLong(offsets[0]);
  object.attendancePercent = reader.readDoubleOrNull(offsets[1]);
  object.id = id;
  object.semesterNumber = reader.readLong(offsets[2]);
  object.sgpa = reader.readDoubleOrNull(offsets[3]);
  object.studentProfileId = reader.readLong(offsets[4]);
  return object;
}

P _semesterRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _semesterRecordModelGetId(SemesterRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _semesterRecordModelGetLinks(
    SemesterRecordModel object) {
  return [];
}

void _semesterRecordModelAttach(
    IsarCollection<dynamic> col, Id id, SemesterRecordModel object) {
  object.id = id;
}

extension SemesterRecordModelQueryWhereSort
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QWhere> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SemesterRecordModelQueryWhere
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QWhereClause> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhereClause>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterWhereClause>
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
}

extension SemesterRecordModelQueryFilter on QueryBuilder<SemesterRecordModel,
    SemesterRecordModel, QFilterCondition> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      arrearCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arrearCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      arrearCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'arrearCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      arrearCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'arrearCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      arrearCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'arrearCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attendancePercent',
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attendancePercent',
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attendancePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attendancePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attendancePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      attendancePercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attendancePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      semesterNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semesterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      semesterNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'semesterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      semesterNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'semesterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      semesterNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'semesterNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sgpa',
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sgpa',
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sgpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sgpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sgpa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      sgpaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sgpa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
      studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterFilterCondition>
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

extension SemesterRecordModelQueryObject on QueryBuilder<SemesterRecordModel,
    SemesterRecordModel, QFilterCondition> {}

extension SemesterRecordModelQueryLinks on QueryBuilder<SemesterRecordModel,
    SemesterRecordModel, QFilterCondition> {}

extension SemesterRecordModelQuerySortBy
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QSortBy> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByArrearCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrearCount', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByArrearCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrearCount', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByAttendancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendancePercent', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByAttendancePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendancePercent', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortBySemesterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterNumber', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortBySemesterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterNumber', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortBySgpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sgpa', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortBySgpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sgpa', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension SemesterRecordModelQuerySortThenBy
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QSortThenBy> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByArrearCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrearCount', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByArrearCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arrearCount', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByAttendancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendancePercent', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByAttendancePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attendancePercent', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenBySemesterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterNumber', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenBySemesterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterNumber', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenBySgpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sgpa', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenBySgpaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sgpa', Sort.desc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension SemesterRecordModelQueryWhereDistinct
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct> {
  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct>
      distinctByArrearCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arrearCount');
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct>
      distinctByAttendancePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attendancePercent');
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct>
      distinctBySemesterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'semesterNumber');
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct>
      distinctBySgpa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sgpa');
    });
  }

  QueryBuilder<SemesterRecordModel, SemesterRecordModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }
}

extension SemesterRecordModelQueryProperty
    on QueryBuilder<SemesterRecordModel, SemesterRecordModel, QQueryProperty> {
  QueryBuilder<SemesterRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SemesterRecordModel, int, QQueryOperations>
      arrearCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arrearCount');
    });
  }

  QueryBuilder<SemesterRecordModel, double?, QQueryOperations>
      attendancePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attendancePercent');
    });
  }

  QueryBuilder<SemesterRecordModel, int, QQueryOperations>
      semesterNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'semesterNumber');
    });
  }

  QueryBuilder<SemesterRecordModel, double?, QQueryOperations> sgpaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sgpa');
    });
  }

  QueryBuilder<SemesterRecordModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }
}
