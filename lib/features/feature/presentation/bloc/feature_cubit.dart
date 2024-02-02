import 'package:bloc/bloc.dart';
import 'package:zen_flutter/features/feature/presentation/bloc/feature_state.dart';
import 'package:zen_flutter/features/shared/presentation/state/loading_state.dart';

class FeatureCubit extends Cubit<FeatureState> {
  FeatureCubit() : super(const LoadingState.initial());
}
