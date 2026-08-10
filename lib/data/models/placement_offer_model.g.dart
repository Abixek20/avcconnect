// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement_offer_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlacementOfferModelCollection on Isar {
  IsarCollection<PlacementOfferModel> get placementOfferModels =>
      this.collection();
}

const PlacementOfferModelSchema = CollectionSchema(
  name: r'PlacementOfferModel',
  id: -2423453932684295929,
  properties: {
    r'companyName': PropertySchema(
      id: 0,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'offerDate': PropertySchema(
      id: 1,
      name: r'offerDate',
      type: IsarType.dateTime,
    ),
    r'packageOrStipend': PropertySchema(
      id: 2,
      name: r'packageOrStipend',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 3,
      name: r'role',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.byte,
      enumMap: _PlacementOfferModelstatusEnumValueMap,
    ),
    r'studentProfileId': PropertySchema(
      id: 5,
      name: r'studentProfileId',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.byte,
      enumMap: _PlacementOfferModeltypeEnumValueMap,
    )
  },
  estimateSize: _placementOfferModelEstimateSize,
  serialize: _placementOfferModelSerialize,
  deserialize: _placementOfferModelDeserialize,
  deserializeProp: _placementOfferModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _placementOfferModelGetId,
  getLinks: _placementOfferModelGetLinks,
  attach: _placementOfferModelAttach,
  version: '3.3.2',
);

int _placementOfferModelEstimateSize(
  PlacementOfferModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.companyName.length * 3;
  bytesCount += 3 + object.packageOrStipend.length * 3;
  bytesCount += 3 + object.role.length * 3;
  return bytesCount;
}

void _placementOfferModelSerialize(
  PlacementOfferModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.companyName);
  writer.writeDateTime(offsets[1], object.offerDate);
  writer.writeString(offsets[2], object.packageOrStipend);
  writer.writeString(offsets[3], object.role);
  writer.writeByte(offsets[4], object.status.index);
  writer.writeLong(offsets[5], object.studentProfileId);
  writer.writeByte(offsets[6], object.type.index);
}

PlacementOfferModel _placementOfferModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlacementOfferModel();
  object.companyName = reader.readString(offsets[0]);
  object.id = id;
  object.offerDate = reader.readDateTime(offsets[1]);
  object.packageOrStipend = reader.readString(offsets[2]);
  object.role = reader.readString(offsets[3]);
  object.status = _PlacementOfferModelstatusValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      OfferStatus.offered;
  object.studentProfileId = reader.readLong(offsets[5]);
  object.type =
      _PlacementOfferModeltypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          OfferType.internship;
  return object;
}

P _placementOfferModelDeserializeProp<P>(
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
      return (_PlacementOfferModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          OfferStatus.offered) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (_PlacementOfferModeltypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          OfferType.internship) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PlacementOfferModelstatusEnumValueMap = {
  'offered': 0,
  'accepted': 1,
  'declined': 2,
  'completed': 3,
};
const _PlacementOfferModelstatusValueEnumMap = {
  0: OfferStatus.offered,
  1: OfferStatus.accepted,
  2: OfferStatus.declined,
  3: OfferStatus.completed,
};
const _PlacementOfferModeltypeEnumValueMap = {
  'internship': 0,
  'fullTime': 1,
};
const _PlacementOfferModeltypeValueEnumMap = {
  0: OfferType.internship,
  1: OfferType.fullTime,
};

Id _placementOfferModelGetId(PlacementOfferModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _placementOfferModelGetLinks(
    PlacementOfferModel object) {
  return [];
}

void _placementOfferModelAttach(
    IsarCollection<dynamic> col, Id id, PlacementOfferModel object) {
  object.id = id;
}

extension PlacementOfferModelQueryWhereSort
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QWhere> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlacementOfferModelQueryWhere
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QWhereClause> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhereClause>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterWhereClause>
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

extension PlacementOfferModelQueryFilter on QueryBuilder<PlacementOfferModel,
    PlacementOfferModel, QFilterCondition> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'companyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      offerDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'offerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      offerDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'offerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      offerDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'offerDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      offerDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'offerDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageOrStipend',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageOrStipend',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageOrStipend',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageOrStipend',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      packageOrStipendIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageOrStipend',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      statusEqualTo(OfferStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      statusGreaterThan(
    OfferStatus value, {
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      statusLessThan(
    OfferStatus value, {
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      statusBetween(
    OfferStatus lower,
    OfferStatus upper, {
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      typeEqualTo(OfferType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      typeGreaterThan(
    OfferType value, {
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      typeLessThan(
    OfferType value, {
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

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterFilterCondition>
      typeBetween(
    OfferType lower,
    OfferType upper, {
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
}

extension PlacementOfferModelQueryObject on QueryBuilder<PlacementOfferModel,
    PlacementOfferModel, QFilterCondition> {}

extension PlacementOfferModelQueryLinks on QueryBuilder<PlacementOfferModel,
    PlacementOfferModel, QFilterCondition> {}

extension PlacementOfferModelQuerySortBy
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QSortBy> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByOfferDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offerDate', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByOfferDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offerDate', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByPackageOrStipend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageOrStipend', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByPackageOrStipendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageOrStipend', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension PlacementOfferModelQuerySortThenBy
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QSortThenBy> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByOfferDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offerDate', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByOfferDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'offerDate', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByPackageOrStipend() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageOrStipend', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByPackageOrStipendDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageOrStipend', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension PlacementOfferModelQueryWhereDistinct
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct> {
  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByCompanyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByOfferDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'offerDate');
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByPackageOrStipend({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageOrStipend',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByRole({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }

  QueryBuilder<PlacementOfferModel, PlacementOfferModel, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension PlacementOfferModelQueryProperty
    on QueryBuilder<PlacementOfferModel, PlacementOfferModel, QQueryProperty> {
  QueryBuilder<PlacementOfferModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlacementOfferModel, String, QQueryOperations>
      companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<PlacementOfferModel, DateTime, QQueryOperations>
      offerDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'offerDate');
    });
  }

  QueryBuilder<PlacementOfferModel, String, QQueryOperations>
      packageOrStipendProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageOrStipend');
    });
  }

  QueryBuilder<PlacementOfferModel, String, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<PlacementOfferModel, OfferStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PlacementOfferModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }

  QueryBuilder<PlacementOfferModel, OfferType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
