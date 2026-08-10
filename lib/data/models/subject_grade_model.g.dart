// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_grade_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubjectGradeModelCollection on Isar {
  IsarCollection<SubjectGradeModel> get subjectGradeModels => this.collection();
}

const SubjectGradeModelSchema = CollectionSchema(
  name: r'SubjectGradeModel',
  id: -698840276930604930,
  properties: {
    r'ciaMarks': PropertySchema(
      id: 0,
      name: r'ciaMarks',
      type: IsarType.double,
    ),
    r'grade': PropertySchema(
      id: 1,
      name: r'grade',
      type: IsarType.string,
    ),
    r'gradePoint': PropertySchema(
      id: 2,
      name: r'gradePoint',
      type: IsarType.double,
    ),
    r'isArrear': PropertySchema(
      id: 3,
      name: r'isArrear',
      type: IsarType.bool,
    ),
    r'semesterExamMarks': PropertySchema(
      id: 4,
      name: r'semesterExamMarks',
      type: IsarType.double,
    ),
    r'semesterRecordId': PropertySchema(
      id: 5,
      name: r'semesterRecordId',
      type: IsarType.long,
    ),
    r'subjectCode': PropertySchema(
      id: 6,
      name: r'subjectCode',
      type: IsarType.string,
    ),
    r'subjectName': PropertySchema(
      id: 7,
      name: r'subjectName',
      type: IsarType.string,
    )
  },
  estimateSize: _subjectGradeModelEstimateSize,
  serialize: _subjectGradeModelSerialize,
  deserialize: _subjectGradeModelDeserialize,
  deserializeProp: _subjectGradeModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _subjectGradeModelGetId,
  getLinks: _subjectGradeModelGetLinks,
  attach: _subjectGradeModelAttach,
  version: '3.3.2',
);

int _subjectGradeModelEstimateSize(
  SubjectGradeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.grade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.subjectCode.length * 3;
  bytesCount += 3 + object.subjectName.length * 3;
  return bytesCount;
}

void _subjectGradeModelSerialize(
  SubjectGradeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.ciaMarks);
  writer.writeString(offsets[1], object.grade);
  writer.writeDouble(offsets[2], object.gradePoint);
  writer.writeBool(offsets[3], object.isArrear);
  writer.writeDouble(offsets[4], object.semesterExamMarks);
  writer.writeLong(offsets[5], object.semesterRecordId);
  writer.writeString(offsets[6], object.subjectCode);
  writer.writeString(offsets[7], object.subjectName);
}

SubjectGradeModel _subjectGradeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubjectGradeModel();
  object.ciaMarks = reader.readDoubleOrNull(offsets[0]);
  object.grade = reader.readStringOrNull(offsets[1]);
  object.gradePoint = reader.readDoubleOrNull(offsets[2]);
  object.id = id;
  object.isArrear = reader.readBool(offsets[3]);
  object.semesterExamMarks = reader.readDoubleOrNull(offsets[4]);
  object.semesterRecordId = reader.readLong(offsets[5]);
  object.subjectCode = reader.readString(offsets[6]);
  object.subjectName = reader.readString(offsets[7]);
  return object;
}

P _subjectGradeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subjectGradeModelGetId(SubjectGradeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subjectGradeModelGetLinks(
    SubjectGradeModel object) {
  return [];
}

void _subjectGradeModelAttach(
    IsarCollection<dynamic> col, Id id, SubjectGradeModel object) {
  object.id = id;
}

extension SubjectGradeModelQueryWhereSort
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QWhere> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubjectGradeModelQueryWhere
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QWhereClause> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhereClause>
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

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterWhereClause>
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

extension SubjectGradeModelQueryFilter
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QFilterCondition> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ciaMarks',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ciaMarks',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciaMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ciaMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ciaMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      ciaMarksBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ciaMarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gradePoint',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gradePoint',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gradePoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gradePoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gradePoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      gradePointBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gradePoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
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

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
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

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
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

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      isArrearEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isArrear',
        value: value,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'semesterExamMarks',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'semesterExamMarks',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semesterExamMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'semesterExamMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'semesterExamMarks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterExamMarksBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'semesterExamMarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterRecordIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semesterRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterRecordIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'semesterRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterRecordIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'semesterRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      semesterRecordIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'semesterRecordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subjectCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjectCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subjectName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjectName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectName',
        value: '',
      ));
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterFilterCondition>
      subjectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjectName',
        value: '',
      ));
    });
  }
}

extension SubjectGradeModelQueryObject
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QFilterCondition> {}

extension SubjectGradeModelQueryLinks
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QFilterCondition> {}

extension SubjectGradeModelQuerySortBy
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QSortBy> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByCiaMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciaMarks', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByCiaMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciaMarks', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradePoint', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradePoint', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByIsArrear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArrear', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortByIsArrearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArrear', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySemesterExamMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterExamMarks', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySemesterExamMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterExamMarks', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySemesterRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterRecordId', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySemesterRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterRecordId', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySubjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySubjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySubjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      sortBySubjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.desc);
    });
  }
}

extension SubjectGradeModelQuerySortThenBy
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QSortThenBy> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByCiaMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciaMarks', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByCiaMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciaMarks', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradePoint', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByGradePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gradePoint', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByIsArrear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArrear', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenByIsArrearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArrear', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySemesterExamMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterExamMarks', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySemesterExamMarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterExamMarks', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySemesterRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterRecordId', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySemesterRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semesterRecordId', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySubjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySubjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.desc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySubjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.asc);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QAfterSortBy>
      thenBySubjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.desc);
    });
  }
}

extension SubjectGradeModelQueryWhereDistinct
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct> {
  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctByCiaMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ciaMarks');
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctByGradePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gradePoint');
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctByIsArrear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isArrear');
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctBySemesterExamMarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'semesterExamMarks');
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctBySemesterRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'semesterRecordId');
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctBySubjectCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubjectGradeModel, SubjectGradeModel, QDistinct>
      distinctBySubjectName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjectName', caseSensitive: caseSensitive);
    });
  }
}

extension SubjectGradeModelQueryProperty
    on QueryBuilder<SubjectGradeModel, SubjectGradeModel, QQueryProperty> {
  QueryBuilder<SubjectGradeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SubjectGradeModel, double?, QQueryOperations>
      ciaMarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ciaMarks');
    });
  }

  QueryBuilder<SubjectGradeModel, String?, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<SubjectGradeModel, double?, QQueryOperations>
      gradePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gradePoint');
    });
  }

  QueryBuilder<SubjectGradeModel, bool, QQueryOperations> isArrearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isArrear');
    });
  }

  QueryBuilder<SubjectGradeModel, double?, QQueryOperations>
      semesterExamMarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'semesterExamMarks');
    });
  }

  QueryBuilder<SubjectGradeModel, int, QQueryOperations>
      semesterRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'semesterRecordId');
    });
  }

  QueryBuilder<SubjectGradeModel, String, QQueryOperations>
      subjectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjectCode');
    });
  }

  QueryBuilder<SubjectGradeModel, String, QQueryOperations>
      subjectNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjectName');
    });
  }
}
