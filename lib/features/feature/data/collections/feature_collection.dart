import 'package:isar/isar.dart';
import 'package:zen_flutter/features/feature/domain/entities/feature.dart';

part 'feature_collection.g.dart';

@collection
class FeatureCollection {
  final Id id;

  FeatureCollection({required this.id});

  Feature toDomain() => Feature(id: id);

  factory FeatureCollection.fromDomain(Feature _) => FeatureCollection(id: _.id);
}
