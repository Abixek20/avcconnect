// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetComplaintModelCollection on Isar {
  IsarCollection<ComplaintModel> get complaintModels => this.collection();
}

const ComplaintModelSchema = CollectionSchema(
  name: r'ComplaintModel',
  id: 2872413302886980564,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.byte,
      enumMap: _ComplaintModelcategoryEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'raisedByUserId': PropertySchema(
      id: 3,
      name: r'raisedByUserId',
      type: IsarType.long,
    ),
    r'resolvedAt': PropertySchema(
      id: 4,
      name: r'resolvedAt',
      type: IsarType.dateTime,
    ),
    r'resolvedByUserId': PropertySchema(
      id: 5,
      name: r'resolvedByUserId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _ComplaintModelstatusEnumValueMap,
    )
  },
  estimateSize: _complaintModelEstimateSize,
  serialize: _complaintModelSerialize,
  deserialize: _complaintModelDeserialize,
  deserializeProp: _complaintModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _complaintModelGetId,
  getLinks: _complaintModelGetLinks,
  attach: _complaintModelAttach,
  version: '3.3.2',
);

int _complaintModelEstimateSize(
  ComplaintModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  return bytesCount;
}

void _complaintModelSerialize(
  ComplaintModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.category.index);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeLong(offsets[3], object.raisedByUserId);
  writer.writeDateTime(offsets[4], object.resolvedAt);
  writer.writeLong(offsets[5], object.resolvedByUserId);
  writer.writeByte(offsets[6], object.status.index);
}

ComplaintModel _complaintModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ComplaintModel();
  object.category =
      _ComplaintModelcategoryValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          ComplaintCategory.academic;
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.id = id;
  object.raisedByUserId = reader.readLong(offsets[3]);
  object.resolvedAt = reader.readDateTimeOrNull(offsets[4]);
  object.resolvedByUserId = reader.readLongOrNull(offsets[5]);
  object.status =
      _ComplaintModelstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          ComplaintStatus.open;
  return object;
}

P _complaintModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ComplaintModelcategoryValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ComplaintCategory.academic) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (_ComplaintModelstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ComplaintStatus.open) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ComplaintModelcategoryEnumValueMap = {
  'academic': 0,
  'hostel': 1,
  'canteen': 2,
  'infrastructure': 3,
  'other': 4,
};
const _ComplaintModelcategoryValueEnumMap = {
  0: ComplaintCategory.academic,
  1: ComplaintCategory.hostel,
  2: ComplaintCategory.canteen,
  3: ComplaintCategory.infrastructure,
  4: ComplaintCategory.other,
};
const _ComplaintModelstatusEnumValueMap = {
  'open': 0,
  'inProgress': 1,
  'resolved': 2,
};
const _ComplaintModelstatusValueEnumMap = {
  0: ComplaintStatus.open,
  1: ComplaintStatus.inProgress,
  2: ComplaintStatus.resolved,
};

Id _complaintModelGetId(ComplaintModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _complaintModelGetLinks(ComplaintModel object) {
  return [];
}

void _complaintModelAttach(
    IsarCollection<dynamic> col, Id id, ComplaintModel object) {
  object.id = id;
}

extension ComplaintModelQueryWhereSort
    on QueryBuilder<ComplaintModel, ComplaintModel, QWhere> {
  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ComplaintModelQueryWhere
    on QueryBuilder<ComplaintModel, ComplaintModel, QWhereClause> {
  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterWhereClause> idBetween(
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

extension ComplaintModelQueryFilter
    on QueryBuilder<ComplaintModel, ComplaintModel, QFilterCondition> {
  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      categoryEqualTo(ComplaintCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      categoryGreaterThan(
    ComplaintCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      categoryLessThan(
    ComplaintCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      categoryBetween(
    ComplaintCategory lower,
    ComplaintCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      raisedByUserIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raisedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      raisedByUserIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'raisedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      raisedByUserIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'raisedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      raisedByUserIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'raisedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolvedByUserId',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolvedByUserId',
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      resolvedByUserIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      statusEqualTo(ComplaintStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      statusGreaterThan(
    ComplaintStatus value, {
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      statusLessThan(
    ComplaintStatus value, {
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

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterFilterCondition>
      statusBetween(
    ComplaintStatus lower,
    ComplaintStatus upper, {
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
}

extension ComplaintModelQueryObject
    on QueryBuilder<ComplaintModel, ComplaintModel, QFilterCondition> {}

extension ComplaintModelQueryLinks
    on QueryBuilder<ComplaintModel, ComplaintModel, QFilterCondition> {}

extension ComplaintModelQuerySortBy
    on QueryBuilder<ComplaintModel, ComplaintModel, QSortBy> {
  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByRaisedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raisedByUserId', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByRaisedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raisedByUserId', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByResolvedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedByUserId', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByResolvedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedByUserId', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension ComplaintModelQuerySortThenBy
    on QueryBuilder<ComplaintModel, ComplaintModel, QSortThenBy> {
  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByRaisedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raisedByUserId', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByRaisedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raisedByUserId', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByResolvedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedByUserId', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByResolvedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedByUserId', Sort.desc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension ComplaintModelQueryWhereDistinct
    on QueryBuilder<ComplaintModel, ComplaintModel, QDistinct> {
  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct>
      distinctByRaisedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'raisedByUserId');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct>
      distinctByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedAt');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct>
      distinctByResolvedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedByUserId');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension ComplaintModelQueryProperty
    on QueryBuilder<ComplaintModel, ComplaintModel, QQueryProperty> {
  QueryBuilder<ComplaintModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ComplaintModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ComplaintModel, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ComplaintModel, int, QQueryOperations> raisedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'raisedByUserId');
    });
  }

  QueryBuilder<ComplaintModel, DateTime?, QQueryOperations>
      resolvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedAt');
    });
  }

  QueryBuilder<ComplaintModel, int?, QQueryOperations>
      resolvedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedByUserId');
    });
  }

  QueryBuilder<ComplaintModel, ComplaintStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
