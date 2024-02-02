import 'package:zen_flutter/features/feature/domain/entities/feature.dart';
import 'package:zen_flutter/features/shared/domain/failures/app_failure.dart';

abstract class IFeatureRepository {
  Future<(AppFailure?, Iterable<Feature>?)> getAll();
}
