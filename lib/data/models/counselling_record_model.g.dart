// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counselling_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCounsellingRecordModelCollection on Isar {
  IsarCollection<CounsellingRecordModel> get counsellingRecordModels =>
      this.collection();
}

const CounsellingRecordModelSchema = CollectionSchema(
  name: r'CounsellingRecordModel',
  id: -8457280650665151622,
  properties: {
    r'aadhaarNumber': PropertySchema(
      id: 0,
      name: r'aadhaarNumber',
      type: IsarType.string,
    ),
    r'bloodGroup': PropertySchema(
      id: 1,
      name: r'bloodGroup',
      type: IsarType.string,
    ),
    r'busRouteNumber': PropertySchema(
      id: 2,
      name: r'busRouteNumber',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 3,
      name: r'category',
      type: IsarType.string,
    ),
    r'currentAddress': PropertySchema(
      id: 4,
      name: r'currentAddress',
      type: IsarType.string,
    ),
    r'emergencyContactName': PropertySchema(
      id: 5,
      name: r'emergencyContactName',
      type: IsarType.string,
    ),
    r'emergencyContactPhone': PropertySchema(
      id: 6,
      name: r'emergencyContactPhone',
      type: IsarType.string,
    ),
    r'facultyAdvisorId': PropertySchema(
      id: 7,
      name: r'facultyAdvisorId',
      type: IsarType.long,
    ),
    r'higherStudiesPlan': PropertySchema(
      id: 8,
      name: r'higherStudiesPlan',
      type: IsarType.string,
    ),
    r'medicalConditions': PropertySchema(
      id: 9,
      name: r'medicalConditions',
      type: IsarType.string,
    ),
    r'permanentAddress': PropertySchema(
      id: 10,
      name: r'permanentAddress',
      type: IsarType.string,
    ),
    r'resumeLink': PropertySchema(
      id: 11,
      name: r'resumeLink',
      type: IsarType.string,
    ),
    r'scholarshipDetails': PropertySchema(
      id: 12,
      name: r'scholarshipDetails',
      type: IsarType.string,
    ),
    r'siblingDetails': PropertySchema(
      id: 13,
      name: r'siblingDetails',
      type: IsarType.string,
    ),
    r'studentProfileId': PropertySchema(
      id: 14,
      name: r'studentProfileId',
      type: IsarType.long,
    ),
    r'tenthPercentage': PropertySchema(
      id: 15,
      name: r'tenthPercentage',
      type: IsarType.double,
    ),
    r'transportMode': PropertySchema(
      id: 16,
      name: r'transportMode',
      type: IsarType.byte,
      enumMap: _CounsellingRecordModeltransportModeEnumValueMap,
    ),
    r'twelfthPercentage': PropertySchema(
      id: 17,
      name: r'twelfthPercentage',
      type: IsarType.double,
    )
  },
  estimateSize: _counsellingRecordModelEstimateSize,
  serialize: _counsellingRecordModelSerialize,
  deserialize: _counsellingRecordModelDeserialize,
  deserializeProp: _counsellingRecordModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'studentProfileId': IndexSchema(
      id: 1915863105885676858,
      name: r'studentProfileId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentProfileId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _counsellingRecordModelGetId,
  getLinks: _counsellingRecordModelGetLinks,
  attach: _counsellingRecordModelAttach,
  version: '3.3.2',
);

int _counsellingRecordModelEstimateSize(
  CounsellingRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aadhaarNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bloodGroup;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.busRouteNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currentAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.emergencyContactName.length * 3;
  bytesCount += 3 + object.emergencyContactPhone.length * 3;
  {
    final value = object.higherStudiesPlan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.medicalConditions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.permanentAddress.length * 3;
  {
    final value = object.resumeLink;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scholarshipDetails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siblingDetails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _counsellingRecordModelSerialize(
  CounsellingRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aadhaarNumber);
  writer.writeString(offsets[1], object.bloodGroup);
  writer.writeString(offsets[2], object.busRouteNumber);
  writer.writeString(offsets[3], object.category);
  writer.writeString(offsets[4], object.currentAddress);
  writer.writeString(offsets[5], object.emergencyContactName);
  writer.writeString(offsets[6], object.emergencyContactPhone);
  writer.writeLong(offsets[7], object.facultyAdvisorId);
  writer.writeString(offsets[8], object.higherStudiesPlan);
  writer.writeString(offsets[9], object.medicalConditions);
  writer.writeString(offsets[10], object.permanentAddress);
  writer.writeString(offsets[11], object.resumeLink);
  writer.writeString(offsets[12], object.scholarshipDetails);
  writer.writeString(offsets[13], object.siblingDetails);
  writer.writeLong(offsets[14], object.studentProfileId);
  writer.writeDouble(offsets[15], object.tenthPercentage);
  writer.writeByte(offsets[16], object.transportMode.index);
  writer.writeDouble(offsets[17], object.twelfthPercentage);
}

CounsellingRecordModel _counsellingRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CounsellingRecordModel();
  object.aadhaarNumber = reader.readStringOrNull(offsets[0]);
  object.bloodGroup = reader.readStringOrNull(offsets[1]);
  object.busRouteNumber = reader.readStringOrNull(offsets[2]);
  object.category = reader.readStringOrNull(offsets[3]);
  object.currentAddress = reader.readStringOrNull(offsets[4]);
  object.emergencyContactName = reader.readString(offsets[5]);
  object.emergencyContactPhone = reader.readString(offsets[6]);
  object.facultyAdvisorId = reader.readLong(offsets[7]);
  object.higherStudiesPlan = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.medicalConditions = reader.readStringOrNull(offsets[9]);
  object.permanentAddress = reader.readString(offsets[10]);
  object.resumeLink = reader.readStringOrNull(offsets[11]);
  object.scholarshipDetails = reader.readStringOrNull(offsets[12]);
  object.siblingDetails = reader.readStringOrNull(offsets[13]);
  object.studentProfileId = reader.readLong(offsets[14]);
  object.tenthPercentage = reader.readDoubleOrNull(offsets[15]);
  object.transportMode = _CounsellingRecordModeltransportModeValueEnumMap[
          reader.readByteOrNull(offsets[16])] ??
      TransportMode.collegeBus;
  object.twelfthPercentage = reader.readDoubleOrNull(offsets[17]);
  return object;
}

P _counsellingRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (_CounsellingRecordModeltransportModeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TransportMode.collegeBus) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CounsellingRecordModeltransportModeEnumValueMap = {
  'collegeBus': 0,
  'hosteller': 1,
  'ownTransport': 2,
  'other': 3,
};
const _CounsellingRecordModeltransportModeValueEnumMap = {
  0: TransportMode.collegeBus,
  1: TransportMode.hosteller,
  2: TransportMode.ownTransport,
  3: TransportMode.other,
};

Id _counsellingRecordModelGetId(CounsellingRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _counsellingRecordModelGetLinks(
    CounsellingRecordModel object) {
  return [];
}

void _counsellingRecordModelAttach(
    IsarCollection<dynamic> col, Id id, CounsellingRecordModel object) {
  object.id = id;
}

extension CounsellingRecordModelByIndex
    on IsarCollection<CounsellingRecordModel> {
  Future<CounsellingRecordModel?> getByStudentProfileId(int studentProfileId) {
    return getByIndex(r'studentProfileId', [studentProfileId]);
  }

  CounsellingRecordModel? getByStudentProfileIdSync(int studentProfileId) {
    return getByIndexSync(r'studentProfileId', [studentProfileId]);
  }

  Future<bool> deleteByStudentProfileId(int studentProfileId) {
    return deleteByIndex(r'studentProfileId', [studentProfileId]);
  }

  bool deleteByStudentProfileIdSync(int studentProfileId) {
    return deleteByIndexSync(r'studentProfileId', [studentProfileId]);
  }

  Future<List<CounsellingRecordModel?>> getAllByStudentProfileId(
      List<int> studentProfileIdValues) {
    final values = studentProfileIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'studentProfileId', values);
  }

  List<CounsellingRecordModel?> getAllByStudentProfileIdSync(
      List<int> studentProfileIdValues) {
    final values = studentProfileIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'studentProfileId', values);
  }

  Future<int> deleteAllByStudentProfileId(List<int> studentProfileIdValues) {
    final values = studentProfileIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'studentProfileId', values);
  }

  int deleteAllByStudentProfileIdSync(List<int> studentProfileIdValues) {
    final values = studentProfileIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'studentProfileId', values);
  }

  Future<Id> putByStudentProfileId(CounsellingRecordModel object) {
    return putByIndex(r'studentProfileId', object);
  }

  Id putByStudentProfileIdSync(CounsellingRecordModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'studentProfileId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStudentProfileId(
      List<CounsellingRecordModel> objects) {
    return putAllByIndex(r'studentProfileId', objects);
  }

  List<Id> putAllByStudentProfileIdSync(List<CounsellingRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'studentProfileId', objects,
        saveLinks: saveLinks);
  }
}

extension CounsellingRecordModelQueryWhereSort
    on QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QWhere> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterWhere>
      anyStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'studentProfileId'),
      );
    });
  }
}

extension CounsellingRecordModelQueryWhere on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QWhereClause> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> studentProfileIdEqualTo(int studentProfileId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentProfileId',
        value: [studentProfileId],
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> studentProfileIdNotEqualTo(int studentProfileId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentProfileId',
              lower: [],
              upper: [studentProfileId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentProfileId',
              lower: [studentProfileId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentProfileId',
              lower: [studentProfileId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentProfileId',
              lower: [],
              upper: [studentProfileId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> studentProfileIdGreaterThan(
    int studentProfileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentProfileId',
        lower: [studentProfileId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> studentProfileIdLessThan(
    int studentProfileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentProfileId',
        lower: [],
        upper: [studentProfileId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterWhereClause> studentProfileIdBetween(
    int lowerStudentProfileId,
    int upperStudentProfileId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'studentProfileId',
        lower: [lowerStudentProfileId],
        includeLower: includeLower,
        upper: [upperStudentProfileId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CounsellingRecordModelQueryFilter on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QFilterCondition> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aadhaarNumber',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aadhaarNumber',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aadhaarNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      aadhaarNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aadhaarNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      aadhaarNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aadhaarNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aadhaarNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> aadhaarNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aadhaarNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodGroup',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodGroup',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      bloodGroupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      bloodGroupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodGroup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> bloodGroupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'busRouteNumber',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'busRouteNumber',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'busRouteNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      busRouteNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'busRouteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      busRouteNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'busRouteNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'busRouteNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> busRouteNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'busRouteNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentAddress',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentAddress',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      currentAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      currentAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> currentAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emergencyContactName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      emergencyContactNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emergencyContactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      emergencyContactNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emergencyContactName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContactName',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emergencyContactName',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emergencyContactPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      emergencyContactPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emergencyContactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      emergencyContactPhoneMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emergencyContactPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> emergencyContactPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emergencyContactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> facultyAdvisorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facultyAdvisorId',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> facultyAdvisorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facultyAdvisorId',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> facultyAdvisorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facultyAdvisorId',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> facultyAdvisorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facultyAdvisorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'higherStudiesPlan',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'higherStudiesPlan',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'higherStudiesPlan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      higherStudiesPlanContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'higherStudiesPlan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      higherStudiesPlanMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'higherStudiesPlan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'higherStudiesPlan',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> higherStudiesPlanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'higherStudiesPlan',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medicalConditions',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medicalConditions',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicalConditions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      medicalConditionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicalConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      medicalConditionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicalConditions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicalConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> medicalConditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicalConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'permanentAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      permanentAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'permanentAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      permanentAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'permanentAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'permanentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> permanentAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'permanentAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resumeLink',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resumeLink',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resumeLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      resumeLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'resumeLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      resumeLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'resumeLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resumeLink',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> resumeLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'resumeLink',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scholarshipDetails',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scholarshipDetails',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scholarshipDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      scholarshipDetailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scholarshipDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      scholarshipDetailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scholarshipDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarshipDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> scholarshipDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scholarshipDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siblingDetails',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siblingDetails',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siblingDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      siblingDetailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siblingDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
          QAfterFilterCondition>
      siblingDetailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siblingDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siblingDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> siblingDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siblingDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
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

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenthPercentage',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenthPercentage',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> tenthPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenthPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> transportModeEqualTo(TransportMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transportMode',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> transportModeGreaterThan(
    TransportMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transportMode',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> transportModeLessThan(
    TransportMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transportMode',
        value: value,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> transportModeBetween(
    TransportMode lower,
    TransportMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transportMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'twelfthPercentage',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'twelfthPercentage',
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twelfthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'twelfthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'twelfthPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel,
      QAfterFilterCondition> twelfthPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'twelfthPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CounsellingRecordModelQueryObject on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QFilterCondition> {}

extension CounsellingRecordModelQueryLinks on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QFilterCondition> {}

extension CounsellingRecordModelQuerySortBy
    on QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QSortBy> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByAadhaarNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByAadhaarNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByBloodGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByBloodGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByBusRouteNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'busRouteNumber', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByBusRouteNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'busRouteNumber', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByCurrentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentAddress', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByCurrentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentAddress', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByEmergencyContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactName', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByEmergencyContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactName', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByEmergencyContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactPhone', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByEmergencyContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactPhone', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByFacultyAdvisorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyAdvisorId', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByFacultyAdvisorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyAdvisorId', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByHigherStudiesPlan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'higherStudiesPlan', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByHigherStudiesPlanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'higherStudiesPlan', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByMedicalConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalConditions', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByMedicalConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalConditions', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByPermanentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanentAddress', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByPermanentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanentAddress', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByResumeLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumeLink', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByResumeLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumeLink', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByScholarshipDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipDetails', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByScholarshipDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipDetails', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortBySiblingDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siblingDetails', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortBySiblingDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siblingDetails', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTenthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenthPercentage', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTenthPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenthPercentage', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTransportMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportMode', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTransportModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportMode', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTwelfthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twelfthPercentage', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      sortByTwelfthPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twelfthPercentage', Sort.desc);
    });
  }
}

extension CounsellingRecordModelQuerySortThenBy on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QSortThenBy> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByAadhaarNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByAadhaarNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aadhaarNumber', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByBloodGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByBloodGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByBusRouteNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'busRouteNumber', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByBusRouteNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'busRouteNumber', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByCurrentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentAddress', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByCurrentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentAddress', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByEmergencyContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactName', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByEmergencyContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactName', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByEmergencyContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactPhone', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByEmergencyContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContactPhone', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByFacultyAdvisorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyAdvisorId', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByFacultyAdvisorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyAdvisorId', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByHigherStudiesPlan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'higherStudiesPlan', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByHigherStudiesPlanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'higherStudiesPlan', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByMedicalConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalConditions', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByMedicalConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalConditions', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByPermanentAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanentAddress', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByPermanentAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'permanentAddress', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByResumeLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumeLink', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByResumeLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resumeLink', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByScholarshipDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipDetails', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByScholarshipDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarshipDetails', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenBySiblingDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siblingDetails', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenBySiblingDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siblingDetails', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTenthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenthPercentage', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTenthPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenthPercentage', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTransportMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportMode', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTransportModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportMode', Sort.desc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTwelfthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twelfthPercentage', Sort.asc);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QAfterSortBy>
      thenByTwelfthPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twelfthPercentage', Sort.desc);
    });
  }
}

extension CounsellingRecordModelQueryWhereDistinct
    on QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct> {
  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByAadhaarNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aadhaarNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByBloodGroup({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bloodGroup', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByBusRouteNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'busRouteNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByCurrentAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByEmergencyContactName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emergencyContactName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByEmergencyContactPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emergencyContactPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByFacultyAdvisorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facultyAdvisorId');
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByHigherStudiesPlan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'higherStudiesPlan',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByMedicalConditions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicalConditions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByPermanentAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'permanentAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByResumeLink({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resumeLink', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByScholarshipDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scholarshipDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctBySiblingDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siblingDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByTenthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenthPercentage');
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByTransportMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transportMode');
    });
  }

  QueryBuilder<CounsellingRecordModel, CounsellingRecordModel, QDistinct>
      distinctByTwelfthPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twelfthPercentage');
    });
  }
}

extension CounsellingRecordModelQueryProperty on QueryBuilder<
    CounsellingRecordModel, CounsellingRecordModel, QQueryProperty> {
  QueryBuilder<CounsellingRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      aadhaarNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aadhaarNumber');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      bloodGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bloodGroup');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      busRouteNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'busRouteNumber');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      currentAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentAddress');
    });
  }

  QueryBuilder<CounsellingRecordModel, String, QQueryOperations>
      emergencyContactNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emergencyContactName');
    });
  }

  QueryBuilder<CounsellingRecordModel, String, QQueryOperations>
      emergencyContactPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emergencyContactPhone');
    });
  }

  QueryBuilder<CounsellingRecordModel, int, QQueryOperations>
      facultyAdvisorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facultyAdvisorId');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      higherStudiesPlanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'higherStudiesPlan');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      medicalConditionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicalConditions');
    });
  }

  QueryBuilder<CounsellingRecordModel, String, QQueryOperations>
      permanentAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'permanentAddress');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      resumeLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resumeLink');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      scholarshipDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scholarshipDetails');
    });
  }

  QueryBuilder<CounsellingRecordModel, String?, QQueryOperations>
      siblingDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siblingDetails');
    });
  }

  QueryBuilder<CounsellingRecordModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }

  QueryBuilder<CounsellingRecordModel, double?, QQueryOperations>
      tenthPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenthPercentage');
    });
  }

  QueryBuilder<CounsellingRecordModel, TransportMode, QQueryOperations>
      transportModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transportMode');
    });
  }

  QueryBuilder<CounsellingRecordModel, double?, QQueryOperations>
      twelfthPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twelfthPercentage');
    });
  }
}
