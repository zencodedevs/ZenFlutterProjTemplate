// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFeatureCollectionCollection on Isar {
  IsarCollection<FeatureCollection> get featureCollections => this.collection();
}

const FeatureCollectionSchema = CollectionSchema(
  name: r'FeatureCollection',
  id: -2315690774608799830,
  properties: {},
  estimateSize: _featureCollectionEstimateSize,
  serialize: _featureCollectionSerialize,
  deserialize: _featureCollectionDeserialize,
  deserializeProp: _featureCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _featureCollectionGetId,
  getLinks: _featureCollectionGetLinks,
  attach: _featureCollectionAttach,
  version: '3.1.0+1',
);

int _featureCollectionEstimateSize(
  FeatureCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _featureCollectionSerialize(
  FeatureCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
FeatureCollection _featureCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeatureCollection(
    id: id,
  );
  return object;
}

P _featureCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _featureCollectionGetId(FeatureCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _featureCollectionGetLinks(
    FeatureCollection object) {
  return [];
}

void _featureCollectionAttach(
    IsarCollection<dynamic> col, Id id, FeatureCollection object) {}

extension FeatureCollectionQueryWhereSort
    on QueryBuilder<FeatureCollection, FeatureCollection, QWhere> {
  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FeatureCollectionQueryWhere
    on QueryBuilder<FeatureCollection, FeatureCollection, QWhereClause> {
  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhereClause>
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

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterWhereClause>
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

extension FeatureCollectionQueryFilter
    on QueryBuilder<FeatureCollection, FeatureCollection, QFilterCondition> {
  QueryBuilder<FeatureCollection, FeatureCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterFilterCondition>
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

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterFilterCondition>
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

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterFilterCondition>
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
}

extension FeatureCollectionQueryObject
    on QueryBuilder<FeatureCollection, FeatureCollection, QFilterCondition> {}

extension FeatureCollectionQueryLinks
    on QueryBuilder<FeatureCollection, FeatureCollection, QFilterCondition> {}

extension FeatureCollectionQuerySortBy
    on QueryBuilder<FeatureCollection, FeatureCollection, QSortBy> {}

extension FeatureCollectionQuerySortThenBy
    on QueryBuilder<FeatureCollection, FeatureCollection, QSortThenBy> {
  QueryBuilder<FeatureCollection, FeatureCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FeatureCollection, FeatureCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FeatureCollectionQueryWhereDistinct
    on QueryBuilder<FeatureCollection, FeatureCollection, QDistinct> {}

extension FeatureCollectionQueryProperty
    on QueryBuilder<FeatureCollection, FeatureCollection, QQueryProperty> {
  QueryBuilder<FeatureCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
