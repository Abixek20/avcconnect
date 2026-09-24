// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNoticeModelCollection on Isar {
  IsarCollection<NoticeModel> get noticeModels => this.collection();
}

const NoticeModelSchema = CollectionSchema(
  name: r'NoticeModel',
  id: 4188865387800949871,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'departmentFilter': PropertySchema(
      id: 2,
      name: r'departmentFilter',
      type: IsarType.string,
    ),
    r'isRead': PropertySchema(
      id: 3,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'postedAt': PropertySchema(
      id: 4,
      name: r'postedAt',
      type: IsarType.dateTime,
    ),
    r'postedByUserId': PropertySchema(
      id: 5,
      name: r'postedByUserId',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    ),
    r'yearFilter': PropertySchema(
      id: 7,
      name: r'yearFilter',
      type: IsarType.long,
    )
  },
  estimateSize: _noticeModelEstimateSize,
  serialize: _noticeModelSerialize,
  deserialize: _noticeModelDeserialize,
  deserializeProp: _noticeModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'postedAt': IndexSchema(
      id: 9148949656314717099,
      name: r'postedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'postedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _noticeModelGetId,
  getLinks: _noticeModelGetLinks,
  attach: _noticeModelAttach,
  version: '3.3.2',
);

int _noticeModelEstimateSize(
  NoticeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.departmentFilter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _noticeModelSerialize(
  NoticeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeString(offsets[1], object.category);
  writer.writeString(offsets[2], object.departmentFilter);
  writer.writeBool(offsets[3], object.isRead);
  writer.writeDateTime(offsets[4], object.postedAt);
  writer.writeLong(offsets[5], object.postedByUserId);
  writer.writeString(offsets[6], object.title);
  writer.writeLong(offsets[7], object.yearFilter);
}

NoticeModel _noticeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NoticeModel();
  object.body = reader.readString(offsets[0]);
  object.category = reader.readStringOrNull(offsets[1]);
  object.departmentFilter = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isRead = reader.readBool(offsets[3]);
  object.postedAt = reader.readDateTime(offsets[4]);
  object.postedByUserId = reader.readLong(offsets[5]);
  object.title = reader.readString(offsets[6]);
  object.yearFilter = reader.readLongOrNull(offsets[7]);
  return object;
}

P _noticeModelDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _noticeModelGetId(NoticeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _noticeModelGetLinks(NoticeModel object) {
  return [];
}

void _noticeModelAttach(
    IsarCollection<dynamic> col, Id id, NoticeModel object) {
  object.id = id;
}

extension NoticeModelQueryWhereSort
    on QueryBuilder<NoticeModel, NoticeModel, QWhere> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhere> anyPostedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'postedAt'),
      );
    });
  }
}

extension NoticeModelQueryWhere
    on QueryBuilder<NoticeModel, NoticeModel, QWhereClause> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> postedAtEqualTo(
      DateTime postedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'postedAt',
        value: [postedAt],
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> postedAtNotEqualTo(
      DateTime postedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'postedAt',
              lower: [],
              upper: [postedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'postedAt',
              lower: [postedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'postedAt',
              lower: [postedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'postedAt',
              lower: [],
              upper: [postedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> postedAtGreaterThan(
    DateTime postedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'postedAt',
        lower: [postedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> postedAtLessThan(
    DateTime postedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'postedAt',
        lower: [],
        upper: [postedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterWhereClause> postedAtBetween(
    DateTime lowerPostedAt,
    DateTime upperPostedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'postedAt',
        lower: [lowerPostedAt],
        includeLower: includeLower,
        upper: [upperPostedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NoticeModelQueryFilter
    on QueryBuilder<NoticeModel, NoticeModel, QFilterCondition> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> categoryEqualTo(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryGreaterThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryLessThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> categoryBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryStartsWith(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryEndsWith(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departmentFilter',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departmentFilter',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departmentFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'departmentFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'departmentFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departmentFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      departmentFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'departmentFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> isReadEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> postedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> postedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedByUserIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedByUserIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedByUserIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postedByUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      postedByUserIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yearFilter',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yearFilter',
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearFilter',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearFilter',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearFilter',
        value: value,
      ));
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterFilterCondition>
      yearFilterBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NoticeModelQueryObject
    on QueryBuilder<NoticeModel, NoticeModel, QFilterCondition> {}

extension NoticeModelQueryLinks
    on QueryBuilder<NoticeModel, NoticeModel, QFilterCondition> {}

extension NoticeModelQuerySortBy
    on QueryBuilder<NoticeModel, NoticeModel, QSortBy> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      sortByDepartmentFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentFilter', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      sortByDepartmentFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentFilter', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByPostedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedAt', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByPostedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedAt', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByPostedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedByUserId', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      sortByPostedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedByUserId', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByYearFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFilter', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> sortByYearFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFilter', Sort.desc);
    });
  }
}

extension NoticeModelQuerySortThenBy
    on QueryBuilder<NoticeModel, NoticeModel, QSortThenBy> {
  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      thenByDepartmentFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentFilter', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      thenByDepartmentFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentFilter', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByPostedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedAt', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByPostedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedAt', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByPostedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedByUserId', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy>
      thenByPostedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postedByUserId', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByYearFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFilter', Sort.asc);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QAfterSortBy> thenByYearFilterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFilter', Sort.desc);
    });
  }
}

extension NoticeModelQueryWhereDistinct
    on QueryBuilder<NoticeModel, NoticeModel, QDistinct> {
  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByBody(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByDepartmentFilter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departmentFilter',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByPostedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postedAt');
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByPostedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postedByUserId');
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NoticeModel, NoticeModel, QDistinct> distinctByYearFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearFilter');
    });
  }
}

extension NoticeModelQueryProperty
    on QueryBuilder<NoticeModel, NoticeModel, QQueryProperty> {
  QueryBuilder<NoticeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<NoticeModel, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<NoticeModel, String?, QQueryOperations>
      departmentFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departmentFilter');
    });
  }

  QueryBuilder<NoticeModel, bool, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<NoticeModel, DateTime, QQueryOperations> postedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postedAt');
    });
  }

  QueryBuilder<NoticeModel, int, QQueryOperations> postedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postedByUserId');
    });
  }

  QueryBuilder<NoticeModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NoticeModel, int?, QQueryOperations> yearFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearFilter');
    });
  }
}
