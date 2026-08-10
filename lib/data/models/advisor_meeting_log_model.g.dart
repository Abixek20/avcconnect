// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advisor_meeting_log_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdvisorMeetingLogModelCollection on Isar {
  IsarCollection<AdvisorMeetingLogModel> get advisorMeetingLogModels =>
      this.collection();
}

const AdvisorMeetingLogModelSchema = CollectionSchema(
  name: r'AdvisorMeetingLogModel',
  id: -4437279456218879941,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'facultyId': PropertySchema(
      id: 1,
      name: r'facultyId',
      type: IsarType.long,
    ),
    r'followUpNeeded': PropertySchema(
      id: 2,
      name: r'followUpNeeded',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'studentProfileId': PropertySchema(
      id: 4,
      name: r'studentProfileId',
      type: IsarType.long,
    )
  },
  estimateSize: _advisorMeetingLogModelEstimateSize,
  serialize: _advisorMeetingLogModelSerialize,
  deserialize: _advisorMeetingLogModelDeserialize,
  deserializeProp: _advisorMeetingLogModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _advisorMeetingLogModelGetId,
  getLinks: _advisorMeetingLogModelGetLinks,
  attach: _advisorMeetingLogModelAttach,
  version: '3.3.2',
);

int _advisorMeetingLogModelEstimateSize(
  AdvisorMeetingLogModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.notes.length * 3;
  return bytesCount;
}

void _advisorMeetingLogModelSerialize(
  AdvisorMeetingLogModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.facultyId);
  writer.writeBool(offsets[2], object.followUpNeeded);
  writer.writeString(offsets[3], object.notes);
  writer.writeLong(offsets[4], object.studentProfileId);
}

AdvisorMeetingLogModel _advisorMeetingLogModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdvisorMeetingLogModel();
  object.date = reader.readDateTime(offsets[0]);
  object.facultyId = reader.readLong(offsets[1]);
  object.followUpNeeded = reader.readBool(offsets[2]);
  object.id = id;
  object.notes = reader.readString(offsets[3]);
  object.studentProfileId = reader.readLong(offsets[4]);
  return object;
}

P _advisorMeetingLogModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _advisorMeetingLogModelGetId(AdvisorMeetingLogModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _advisorMeetingLogModelGetLinks(
    AdvisorMeetingLogModel object) {
  return [];
}

void _advisorMeetingLogModelAttach(
    IsarCollection<dynamic> col, Id id, AdvisorMeetingLogModel object) {
  object.id = id;
}

extension AdvisorMeetingLogModelQueryWhereSort
    on QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QWhere> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AdvisorMeetingLogModelQueryWhere on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QWhereClause> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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
}

extension AdvisorMeetingLogModelQueryFilter on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QFilterCondition> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> dateBetween(
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> facultyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> facultyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> facultyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facultyId',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> facultyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facultyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> followUpNeededEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'followUpNeeded',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
      QAfterFilterCondition> studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel,
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
}

extension AdvisorMeetingLogModelQueryObject on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QFilterCondition> {}

extension AdvisorMeetingLogModelQueryLinks on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QFilterCondition> {}

extension AdvisorMeetingLogModelQuerySortBy
    on QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QSortBy> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyId', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByFacultyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyId', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByFollowUpNeeded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followUpNeeded', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByFollowUpNeededDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followUpNeeded', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension AdvisorMeetingLogModelQuerySortThenBy on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QSortThenBy> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyId', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByFacultyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facultyId', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByFollowUpNeeded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followUpNeeded', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByFollowUpNeededDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followUpNeeded', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension AdvisorMeetingLogModelQueryWhereDistinct
    on QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct> {
  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct>
      distinctByFacultyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facultyId');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct>
      distinctByFollowUpNeeded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'followUpNeeded');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, AdvisorMeetingLogModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }
}

extension AdvisorMeetingLogModelQueryProperty on QueryBuilder<
    AdvisorMeetingLogModel, AdvisorMeetingLogModel, QQueryProperty> {
  QueryBuilder<AdvisorMeetingLogModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, DateTime, QQueryOperations>
      dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, int, QQueryOperations>
      facultyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facultyId');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, bool, QQueryOperations>
      followUpNeededProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'followUpNeeded');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, String, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<AdvisorMeetingLogModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }
}
