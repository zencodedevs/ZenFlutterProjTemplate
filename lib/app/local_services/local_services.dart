import 'package:isar/isar.dart';
import 'package:zen_flutter/app/injector/di.dart';

class LocalServices<T> {
  LocalServices();

  final Isar _isar = i.get<Isar>();

  Future<void> save(IsarLink<T> value) async {
    await _isar.writeTxn(() async {
      await value.save();
    });
  }

  Future<void> put(T value) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().put(value);
    });
  }

  Future<void> saveAll(List<T> values) async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().putAll(values);
    });
  }

  Future<void> clearCollection() async {
    await _isar.writeTxn(() async {
      await _isar.collection<T>().clear();
    });
  }

  Future<List<T>> findAll() async {
    final values = await _isar.collection<T>().where().findAll();
    return values;
  }

  IsarCollection<T> query() {
    return _isar.collection<T>();
  }

  Future<T?> findFirst() async {
    final value = await _isar.collection<T>().where().findFirst();
    return value;
  }

  Future<void> deleteSingle(int id) async {
    await _isar.writeTxn(() => _isar.collection<T>().delete(id));
  }
}
