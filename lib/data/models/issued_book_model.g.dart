// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issued_book_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIssuedBookModelCollection on Isar {
  IsarCollection<IssuedBookModel> get issuedBookModels => this.collection();
}

const IssuedBookModelSchema = CollectionSchema(
  name: r'IssuedBookModel',
  id: -4914134414821738380,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.string,
    ),
    r'bookId': PropertySchema(
      id: 1,
      name: r'bookId',
      type: IsarType.long,
    ),
    r'bookTitle': PropertySchema(
      id: 2,
      name: r'bookTitle',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 3,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'fineAmount': PropertySchema(
      id: 4,
      name: r'fineAmount',
      type: IsarType.double,
    ),
    r'isReturned': PropertySchema(
      id: 5,
      name: r'isReturned',
      type: IsarType.bool,
    ),
    r'isbn': PropertySchema(
      id: 6,
      name: r'isbn',
      type: IsarType.string,
    ),
    r'issuedDate': PropertySchema(
      id: 7,
      name: r'issuedDate',
      type: IsarType.dateTime,
    ),
    r'returnDate': PropertySchema(
      id: 8,
      name: r'returnDate',
      type: IsarType.dateTime,
    ),
    r'studentProfileId': PropertySchema(
      id: 9,
      name: r'studentProfileId',
      type: IsarType.long,
    )
  },
  estimateSize: _issuedBookModelEstimateSize,
  serialize: _issuedBookModelSerialize,
  deserialize: _issuedBookModelDeserialize,
  deserializeProp: _issuedBookModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'issuedDate': IndexSchema(
      id: 5154051486524315182,
      name: r'issuedDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'issuedDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'dueDate': IndexSchema(
      id: -7871003637559820552,
      name: r'dueDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dueDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _issuedBookModelGetId,
  getLinks: _issuedBookModelGetLinks,
  attach: _issuedBookModelAttach,
  version: '3.3.2',
);

int _issuedBookModelEstimateSize(
  IssuedBookModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.author.length * 3;
  bytesCount += 3 + object.bookTitle.length * 3;
  bytesCount += 3 + object.isbn.length * 3;
  return bytesCount;
}

void _issuedBookModelSerialize(
  IssuedBookModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.author);
  writer.writeLong(offsets[1], object.bookId);
  writer.writeString(offsets[2], object.bookTitle);
  writer.writeDateTime(offsets[3], object.dueDate);
  writer.writeDouble(offsets[4], object.fineAmount);
  writer.writeBool(offsets[5], object.isReturned);
  writer.writeString(offsets[6], object.isbn);
  writer.writeDateTime(offsets[7], object.issuedDate);
  writer.writeDateTime(offsets[8], object.returnDate);
  writer.writeLong(offsets[9], object.studentProfileId);
}

IssuedBookModel _issuedBookModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IssuedBookModel();
  object.author = reader.readString(offsets[0]);
  object.bookId = reader.readLong(offsets[1]);
  object.bookTitle = reader.readString(offsets[2]);
  object.dueDate = reader.readDateTime(offsets[3]);
  object.fineAmount = reader.readDouble(offsets[4]);
  object.id = id;
  object.isReturned = reader.readBool(offsets[5]);
  object.isbn = reader.readString(offsets[6]);
  object.issuedDate = reader.readDateTime(offsets[7]);
  object.returnDate = reader.readDateTimeOrNull(offsets[8]);
  object.studentProfileId = reader.readLong(offsets[9]);
  return object;
}

P _issuedBookModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _issuedBookModelGetId(IssuedBookModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _issuedBookModelGetLinks(IssuedBookModel object) {
  return [];
}

void _issuedBookModelAttach(
    IsarCollection<dynamic> col, Id id, IssuedBookModel object) {
  object.id = id;
}

extension IssuedBookModelQueryWhereSort
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QWhere> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhere> anyIssuedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'issuedDate'),
      );
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhere> anyDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dueDate'),
      );
    });
  }
}

extension IssuedBookModelQueryWhere
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QWhereClause> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      issuedDateEqualTo(DateTime issuedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issuedDate',
        value: [issuedDate],
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      issuedDateNotEqualTo(DateTime issuedDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuedDate',
              lower: [],
              upper: [issuedDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuedDate',
              lower: [issuedDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuedDate',
              lower: [issuedDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuedDate',
              lower: [],
              upper: [issuedDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      issuedDateGreaterThan(
    DateTime issuedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issuedDate',
        lower: [issuedDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      issuedDateLessThan(
    DateTime issuedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issuedDate',
        lower: [],
        upper: [issuedDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      issuedDateBetween(
    DateTime lowerIssuedDate,
    DateTime upperIssuedDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issuedDate',
        lower: [lowerIssuedDate],
        includeLower: includeLower,
        upper: [upperIssuedDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      dueDateEqualTo(DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dueDate',
        value: [dueDate],
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      dueDateNotEqualTo(DateTime dueDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [],
              upper: [dueDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [dueDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [dueDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dueDate',
              lower: [],
              upper: [dueDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      dueDateGreaterThan(
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [dueDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      dueDateLessThan(
    DateTime dueDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [],
        upper: [dueDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterWhereClause>
      dueDateBetween(
    DateTime lowerDueDate,
    DateTime upperDueDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dueDate',
        lower: [lowerDueDate],
        includeLower: includeLower,
        upper: [upperDueDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IssuedBookModelQueryFilter
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QFilterCondition> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookId',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      bookTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      dueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      dueDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      fineAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fineAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      fineAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fineAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      fineAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fineAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      fineAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fineAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isReturnedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      issuedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issuedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      issuedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issuedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      issuedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issuedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      issuedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issuedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnDate',
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      returnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
      studentProfileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentProfileId',
        value: value,
      ));
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterFilterCondition>
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

extension IssuedBookModelQueryObject
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QFilterCondition> {}

extension IssuedBookModelQueryLinks
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QFilterCondition> {}

extension IssuedBookModelQuerySortBy
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QSortBy> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByBookTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByBookTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByFineAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fineAmount', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByFineAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fineAmount', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByIssuedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByIssuedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      sortByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension IssuedBookModelQuerySortThenBy
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QSortThenBy> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByBookTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByBookTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookTitle', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByFineAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fineAmount', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByFineAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fineAmount', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByIssuedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByIssuedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuedDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.asc);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QAfterSortBy>
      thenByStudentProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentProfileId', Sort.desc);
    });
  }
}

extension IssuedBookModelQueryWhereDistinct
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct> {
  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct> distinctByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct> distinctByBookTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByFineAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fineAmount');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReturned');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByIssuedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issuedDate');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDate');
    });
  }

  QueryBuilder<IssuedBookModel, IssuedBookModel, QDistinct>
      distinctByStudentProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentProfileId');
    });
  }
}

extension IssuedBookModelQueryProperty
    on QueryBuilder<IssuedBookModel, IssuedBookModel, QQueryProperty> {
  QueryBuilder<IssuedBookModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IssuedBookModel, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<IssuedBookModel, int, QQueryOperations> bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<IssuedBookModel, String, QQueryOperations> bookTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookTitle');
    });
  }

  QueryBuilder<IssuedBookModel, DateTime, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<IssuedBookModel, double, QQueryOperations> fineAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fineAmount');
    });
  }

  QueryBuilder<IssuedBookModel, bool, QQueryOperations> isReturnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReturned');
    });
  }

  QueryBuilder<IssuedBookModel, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }

  QueryBuilder<IssuedBookModel, DateTime, QQueryOperations>
      issuedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issuedDate');
    });
  }

  QueryBuilder<IssuedBookModel, DateTime?, QQueryOperations>
      returnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDate');
    });
  }

  QueryBuilder<IssuedBookModel, int, QQueryOperations>
      studentProfileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentProfileId');
    });
  }
}
