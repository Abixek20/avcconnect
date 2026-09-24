// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_schedule_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExamScheduleModelCollection on Isar {
  IsarCollection<ExamScheduleModel> get examScheduleModels => this.collection();
}

const ExamScheduleModelSchema = CollectionSchema(
  name: r'ExamScheduleModel',
  id: 9206218543297368095,
  properties: {
    r'department': PropertySchema(
      id: 0,
      name: r'department',
      type: IsarType.string,
    ),
    r'examDate': PropertySchema(
      id: 1,
      name: r'examDate',
      type: IsarType.dateTime,
    ),
    r'examType': PropertySchema(
      id: 2,
      name: r'examType',
      type: IsarType.string,
    ),
    r'hallNumber': PropertySchema(
      id: 3,
      name: r'hallNumber',
      type: IsarType.string,
    ),
    r'semester': PropertySchema(
      id: 4,
      name: r'semester',
      type: IsarType.string,
    ),
    r'session': PropertySchema(
      id: 5,
      name: r'session',
      type: IsarType.string,
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
    ),
    r'timeSlot': PropertySchema(
      id: 8,
      name: r'timeSlot',
      type: IsarType.string,
    ),
    r'yearOfStudy': PropertySchema(
      id: 9,
      name: r'yearOfStudy',
      type: IsarType.long,
    )
  },
  estimateSize: _examScheduleModelEstimateSize,
  serialize: _examScheduleModelSerialize,
  deserialize: _examScheduleModelDeserialize,
  deserializeProp: _examScheduleModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'examDate': IndexSchema(
      id: 1028411097148556109,
      name: r'examDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'examDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _examScheduleModelGetId,
  getLinks: _examScheduleModelGetLinks,
  attach: _examScheduleModelAttach,
  version: '3.3.2',
);

int _examScheduleModelEstimateSize(
  ExamScheduleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.examType.length * 3;
  bytesCount += 3 + object.hallNumber.length * 3;
  bytesCount += 3 + object.semester.length * 3;
  bytesCount += 3 + object.session.length * 3;
  bytesCount += 3 + object.subjectCode.length * 3;
  bytesCount += 3 + object.subjectName.length * 3;
  bytesCount += 3 + object.timeSlot.length * 3;
  return bytesCount;
}

void _examScheduleModelSerialize(
  ExamScheduleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.department);
  writer.writeDateTime(offsets[1], object.examDate);
  writer.writeString(offsets[2], object.examType);
  writer.writeString(offsets[3], object.hallNumber);
  writer.writeString(offsets[4], object.semester);
  writer.writeString(offsets[5], object.session);
  writer.writeString(offsets[6], object.subjectCode);
  writer.writeString(offsets[7], object.subjectName);
  writer.writeString(offsets[8], object.timeSlot);
  writer.writeLong(offsets[9], object.yearOfStudy);
}

ExamScheduleModel _examScheduleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExamScheduleModel();
  object.department = reader.readString(offsets[0]);
  object.examDate = reader.readDateTime(offsets[1]);
  object.examType = reader.readString(offsets[2]);
  object.hallNumber = reader.readString(offsets[3]);
  object.id = id;
  object.semester = reader.readString(offsets[4]);
  object.session = reader.readString(offsets[5]);
  object.subjectCode = reader.readString(offsets[6]);
  object.subjectName = reader.readString(offsets[7]);
  object.timeSlot = reader.readString(offsets[8]);
  object.yearOfStudy = reader.readLong(offsets[9]);
  return object;
}

P _examScheduleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _examScheduleModelGetId(ExamScheduleModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _examScheduleModelGetLinks(
    ExamScheduleModel object) {
  return [];
}

void _examScheduleModelAttach(
    IsarCollection<dynamic> col, Id id, ExamScheduleModel object) {
  object.id = id;
}

extension ExamScheduleModelQueryWhereSort
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QWhere> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhere>
      anyExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'examDate'),
      );
    });
  }
}

extension ExamScheduleModelQueryWhere
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QWhereClause> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      examDateEqualTo(DateTime examDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'examDate',
        value: [examDate],
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      examDateNotEqualTo(DateTime examDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [],
              upper: [examDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [examDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [examDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [],
              upper: [examDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      examDateGreaterThan(
    DateTime examDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [examDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      examDateLessThan(
    DateTime examDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [],
        upper: [examDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterWhereClause>
      examDateBetween(
    DateTime lowerExamDate,
    DateTime upperExamDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [lowerExamDate],
        includeLower: includeLower,
        upper: [upperExamDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExamScheduleModelQueryFilter
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QFilterCondition> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentEqualTo(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentGreaterThan(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentLessThan(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentBetween(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentStartsWith(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentEndsWith(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examType',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      examTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examType',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hallNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hallNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hallNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hallNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      hallNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hallNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'semester',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'semester',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'semester',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'semester',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      semesterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'semester',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'session',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'session',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'session',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      sessionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'session',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjectCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subjectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subjectName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subjectName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      subjectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subjectName',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeSlot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeSlot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeSlot',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeSlot',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      timeSlotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeSlot',
        value: '',
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      yearOfStudyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearOfStudy',
        value: value,
      ));
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      yearOfStudyGreaterThan(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      yearOfStudyLessThan(
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

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterFilterCondition>
      yearOfStudyBetween(
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

extension ExamScheduleModelQueryObject
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QFilterCondition> {}

extension ExamScheduleModelQueryLinks
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QFilterCondition> {}

extension ExamScheduleModelQuerySortBy
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QSortBy> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByExamDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByExamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examType', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByExamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examType', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByHallNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hallNumber', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByHallNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hallNumber', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySemester() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semester', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySemesterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semester', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'session', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'session', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySubjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySubjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySubjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortBySubjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByTimeSlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSlot', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByTimeSlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSlot', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      sortByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension ExamScheduleModelQuerySortThenBy
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QSortThenBy> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByExamDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByExamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examType', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByExamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examType', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByHallNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hallNumber', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByHallNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hallNumber', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySemester() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semester', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySemesterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'semester', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySession() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'session', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySessionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'session', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySubjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySubjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectCode', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySubjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenBySubjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subjectName', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByTimeSlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSlot', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByTimeSlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeSlot', Sort.desc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QAfterSortBy>
      thenByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension ExamScheduleModelQueryWhereDistinct
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct> {
  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examDate');
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByExamType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByHallNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hallNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctBySemester({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'semester', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctBySession({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'session', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctBySubjectCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctBySubjectName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subjectName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByTimeSlot({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeSlot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExamScheduleModel, ExamScheduleModel, QDistinct>
      distinctByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearOfStudy');
    });
  }
}

extension ExamScheduleModelQueryProperty
    on QueryBuilder<ExamScheduleModel, ExamScheduleModel, QQueryProperty> {
  QueryBuilder<ExamScheduleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<ExamScheduleModel, DateTime, QQueryOperations>
      examDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examDate');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations> examTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examType');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations>
      hallNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hallNumber');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations> semesterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'semester');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations> sessionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'session');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations>
      subjectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjectCode');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations>
      subjectNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subjectName');
    });
  }

  QueryBuilder<ExamScheduleModel, String, QQueryOperations> timeSlotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeSlot');
    });
  }

  QueryBuilder<ExamScheduleModel, int, QQueryOperations> yearOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearOfStudy');
    });
  }
}
