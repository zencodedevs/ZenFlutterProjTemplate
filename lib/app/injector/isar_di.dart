import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zen_flutter/app/injector/di.dart';
import 'package:zen_flutter/features/feature/data/collections/feature_collection.dart';

final _name = 'zencode';

Future<void> initIsarDi() async {
  final dir = await getApplicationDocumentsDirectory();
  var isar = Isar.getInstance(_name);
  if (!(isar != null && isar.isOpen)) {
    isar = await Isar.open(
      [
        FeatureCollectionSchema,
      ],
      name: _name,
      directory: dir.path,
    );
  }

  i.registerLazySingleton<Isar>(() => isar!);
}
