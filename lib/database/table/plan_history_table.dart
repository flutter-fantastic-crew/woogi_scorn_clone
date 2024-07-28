import 'package:drift/drift.dart';
import 'package:scorn_clone/database/table/plan_table.dart';

import '../dto/plan_history_dto.dart';

@UseRowClass(PlanHistoryDto)
class PlanHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get icon => text().withDefault(const Constant(''))();
  IntColumn get planId => integer().references(Plans, #id)();
  IntColumn get amount => integer()();
  TextColumn get memo => text().withDefault(const Constant(''))();
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
}
