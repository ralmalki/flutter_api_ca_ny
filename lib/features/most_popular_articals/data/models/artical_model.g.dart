// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artical_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetArticalModelCollection on Isar {
  IsarCollection<ArticalModel> get articalModels => this.collection();
}

const ArticalModelSchema = CollectionSchema(
  name: r'ArticalModel',
  id: -2025173491034161745,
  properties: {
    r'abstract': PropertySchema(
      id: 0,
      name: r'abstract',
      type: IsarType.string,
    ),
    r'byline': PropertySchema(
      id: 1,
      name: r'byline',
      type: IsarType.string,
    ),
    r'media': PropertySchema(
      id: 2,
      name: r'media',
      type: IsarType.objectList,
      target: r'MediaModel',
    ),
    r'published_date': PropertySchema(
      id: 3,
      name: r'published_date',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 5,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _articalModelEstimateSize,
  serialize: _articalModelSerialize,
  deserialize: _articalModelDeserialize,
  deserializeProp: _articalModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'MediaModel': MediaModelSchema,
    r'MediametadataModel': MediametadataModelSchema
  },
  getId: _articalModelGetId,
  getLinks: _articalModelGetLinks,
  attach: _articalModelAttach,
  version: '3.1.0+1',
);

int _articalModelEstimateSize(
  ArticalModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.abstract.length * 3;
  bytesCount += 3 + object.byline.length * 3;
  bytesCount += 3 + object.media.length * 3;
  {
    final offsets = allOffsets[MediaModel]!;
    for (var i = 0; i < object.media.length; i++) {
      final value = object.media[i];
      bytesCount += MediaModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.published_date.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _articalModelSerialize(
  ArticalModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.abstract);
  writer.writeString(offsets[1], object.byline);
  writer.writeObjectList<MediaModel>(
    offsets[2],
    allOffsets,
    MediaModelSchema.serialize,
    object.media,
  );
  writer.writeString(offsets[3], object.published_date);
  writer.writeString(offsets[4], object.title);
  writer.writeString(offsets[5], object.url);
}

ArticalModel _articalModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ArticalModel(
    abstract: reader.readString(offsets[0]),
    byline: reader.readString(offsets[1]),
    id: id,
    media: reader.readObjectList<MediaModel>(
          offsets[2],
          MediaModelSchema.deserialize,
          allOffsets,
          MediaModel(),
        ) ??
        [],
    published_date: reader.readString(offsets[3]),
    title: reader.readString(offsets[4]),
    url: reader.readString(offsets[5]),
  );
  return object;
}

P _articalModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<MediaModel>(
            offset,
            MediaModelSchema.deserialize,
            allOffsets,
            MediaModel(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _articalModelGetId(ArticalModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _articalModelGetLinks(ArticalModel object) {
  return [];
}

void _articalModelAttach(
    IsarCollection<dynamic> col, Id id, ArticalModel object) {
  object.id = id;
}

extension ArticalModelQueryWhereSort
    on QueryBuilder<ArticalModel, ArticalModel, QWhere> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ArticalModelQueryWhere
    on QueryBuilder<ArticalModel, ArticalModel, QWhereClause> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterWhereClause> idBetween(
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

extension ArticalModelQueryFilter
    on QueryBuilder<ArticalModel, ArticalModel, QFilterCondition> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abstract',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abstract',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abstract',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abstract',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      abstractIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abstract',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> bylineEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> bylineBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'byline',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'byline',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> bylineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'byline',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'byline',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      bylineIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'byline',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      mediaLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'media',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'published_date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'published_date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'published_date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'published_date',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      published_dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'published_date',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleContains(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension ArticalModelQueryObject
    on QueryBuilder<ArticalModel, ArticalModel, QFilterCondition> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterFilterCondition> mediaElement(
      FilterQuery<MediaModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'media');
    });
  }
}

extension ArticalModelQueryLinks
    on QueryBuilder<ArticalModel, ArticalModel, QFilterCondition> {}

extension ArticalModelQuerySortBy
    on QueryBuilder<ArticalModel, ArticalModel, QSortBy> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByAbstract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abstract', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByAbstractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abstract', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByByline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byline', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByBylineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byline', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy>
      sortByPublished_date() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'published_date', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy>
      sortByPublished_dateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'published_date', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ArticalModelQuerySortThenBy
    on QueryBuilder<ArticalModel, ArticalModel, QSortThenBy> {
  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByAbstract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abstract', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByAbstractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'abstract', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByByline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byline', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByBylineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'byline', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy>
      thenByPublished_date() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'published_date', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy>
      thenByPublished_dateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'published_date', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ArticalModelQueryWhereDistinct
    on QueryBuilder<ArticalModel, ArticalModel, QDistinct> {
  QueryBuilder<ArticalModel, ArticalModel, QDistinct> distinctByAbstract(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abstract', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QDistinct> distinctByByline(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'byline', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QDistinct> distinctByPublished_date(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'published_date',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArticalModel, ArticalModel, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension ArticalModelQueryProperty
    on QueryBuilder<ArticalModel, ArticalModel, QQueryProperty> {
  QueryBuilder<ArticalModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ArticalModel, String, QQueryOperations> abstractProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abstract');
    });
  }

  QueryBuilder<ArticalModel, String, QQueryOperations> bylineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'byline');
    });
  }

  QueryBuilder<ArticalModel, List<MediaModel>, QQueryOperations>
      mediaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'media');
    });
  }

  QueryBuilder<ArticalModel, String, QQueryOperations>
      published_dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'published_date');
    });
  }

  QueryBuilder<ArticalModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ArticalModel, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticalModel _$ArticalModelFromJson(Map<String, dynamic> json) => ArticalModel(
      id: json['id'] as int,
      url: json['url'] as String,
      published_date: json['published_date'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      byline: json['byline'] as String,
      media: (json['media'] as List<dynamic>)
          .map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticalModelToJson(ArticalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'published_date': instance.published_date,
      'title': instance.title,
      'abstract': instance.abstract,
      'byline': instance.byline,
      'media': instance.media,
    };
