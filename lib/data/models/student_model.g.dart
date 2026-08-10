// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudentModelCollection on Isar {
  IsarCollection<StudentModel> get studentModels => this.collection();
}

const StudentModelSchema = CollectionSchema(
  name: r'StudentModel',
  id: -1023695268111720628,
  properties: {
    r'department': PropertySchema(
      id: 0,
      name: r'department',
      type: IsarType.string,
    ),
    r'hostelBlock': PropertySchema(
      id: 1,
      name: r'hostelBlock',
      type: IsarType.string,
    ),
    r'rollNumber': PropertySchema(
      id: 2,
      name: r'rollNumber',
      type: IsarType.string,
    ),
    r'roomNumber': PropertySchema(
      id: 3,
      name: r'roomNumber',
      type: IsarType.string,
    ),
    r'section': PropertySchema(
      id: 4,
      name: r'section',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.long,
    ),
    r'yearOfStudy': PropertySchema(
      id: 6,
      name: r'yearOfStudy',
      type: IsarType.long,
    )
  },
  estimateSize: _studentModelEstimateSize,
  serialize: _studentModelSerialize,
  deserialize: _studentModelDeserialize,
  deserializeProp: _studentModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'rollNumber': IndexSchema(
      id: 3556189331601028594,
      name: r'rollNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'rollNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _studentModelGetId,
  getLinks: _studentModelGetLinks,
  attach: _studentModelAttach,
  version: '3.3.2',
);

int _studentModelEstimateSize(
  StudentModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.department.length * 3;
  {
    final value = object.hostelBlock;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.rollNumber.length * 3;
  {
    final value = object.roomNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.section.length * 3;
  return bytesCount;
}

void _studentModelSerialize(
  StudentModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.department);
  writer.writeString(offsets[1], object.hostelBlock);
  writer.writeString(offsets[2], object.rollNumber);
  writer.writeString(offsets[3], object.roomNumber);
  writer.writeString(offsets[4], object.section);
  writer.writeLong(offsets[5], object.userId);
  writer.writeLong(offsets[6], object.yearOfStudy);
}

StudentModel _studentModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudentModel();
  object.department = reader.readString(offsets[0]);
  object.hostelBlock = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.rollNumber = reader.readString(offsets[2]);
  object.roomNumber = reader.readStringOrNull(offsets[3]);
  object.section = reader.readString(offsets[4]);
  object.userId = reader.readLong(offsets[5]);
  object.yearOfStudy = reader.readLong(offsets[6]);
  return object;
}

P _studentModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studentModelGetId(StudentModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studentModelGetLinks(StudentModel object) {
  return [];
}

void _studentModelAttach(
    IsarCollection<dynamic> col, Id id, StudentModel object) {
  object.id = id;
}

extension StudentModelQueryWhereSort
    on QueryBuilder<StudentModel, StudentModel, QWhere> {
  QueryBuilder<StudentModel, StudentModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudentModelQueryWhere
    on QueryBuilder<StudentModel, StudentModel, QWhereClause> {
  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause> rollNumberEqualTo(
      String rollNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rollNumber',
        value: [rollNumber],
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterWhereClause>
      rollNumberNotEqualTo(String rollNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rollNumber',
              lower: [],
              upper: [rollNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rollNumber',
              lower: [rollNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rollNumber',
              lower: [rollNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rollNumber',
              lower: [],
              upper: [rollNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension StudentModelQueryFilter
    on QueryBuilder<StudentModel, StudentModel, QFilterCondition> {
  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hostelBlock',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hostelBlock',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hostelBlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hostelBlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hostelBlock',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hostelBlock',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      hostelBlockIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hostelBlock',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberEqualTo(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberGreaterThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberLessThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberBetween(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberStartsWith(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberEndsWith(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rollNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rollNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rollNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      rollNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rollNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roomNumber',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roomNumber',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      roomNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionEqualTo(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionGreaterThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionLessThan(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionBetween(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionStartsWith(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionEndsWith(
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'section',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'section',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'section',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      sectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'section',
        value: '',
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
      yearOfStudyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearOfStudy',
        value: value,
      ));
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

  QueryBuilder<StudentModel, StudentModel, QAfterFilterCondition>
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

extension StudentModelQueryObject
    on QueryBuilder<StudentModel, StudentModel, QFilterCondition> {}

extension StudentModelQueryLinks
    on QueryBuilder<StudentModel, StudentModel, QFilterCondition> {}

extension StudentModelQuerySortBy
    on QueryBuilder<StudentModel, StudentModel, QSortBy> {
  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByHostelBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hostelBlock', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      sortByHostelBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hostelBlock', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByRollNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      sortByRollNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByRoomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      sortByRoomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> sortByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      sortByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension StudentModelQuerySortThenBy
    on QueryBuilder<StudentModel, StudentModel, QSortThenBy> {
  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByHostelBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hostelBlock', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      thenByHostelBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hostelBlock', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByRollNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      thenByRollNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rollNumber', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByRoomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      thenByRoomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenBySection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenBySectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy> thenByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.asc);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QAfterSortBy>
      thenByYearOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearOfStudy', Sort.desc);
    });
  }
}

extension StudentModelQueryWhereDistinct
    on QueryBuilder<StudentModel, StudentModel, QDistinct> {
  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByDepartment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByHostelBlock(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hostelBlock', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByRollNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rollNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByRoomNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctBySection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<StudentModel, StudentModel, QDistinct> distinctByYearOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearOfStudy');
    });
  }
}

extension StudentModelQueryProperty
    on QueryBuilder<StudentModel, StudentModel, QQueryProperty> {
  QueryBuilder<StudentModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudentModel, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<StudentModel, String?, QQueryOperations> hostelBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hostelBlock');
    });
  }

  QueryBuilder<StudentModel, String, QQueryOperations> rollNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rollNumber');
    });
  }

  QueryBuilder<StudentModel, String?, QQueryOperations> roomNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomNumber');
    });
  }

  QueryBuilder<StudentModel, String, QQueryOperations> sectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<StudentModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<StudentModel, int, QQueryOperations> yearOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearOfStudy');
    });
  }
}
