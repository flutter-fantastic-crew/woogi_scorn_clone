import 'package:drift/drift.dart';

import '../dto/plan_dto.dart';

@UseRowClass(PlanDto)
class Plans extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get type =>
      textEnum<PlanType>().withDefault(Constant(PlanType.plan.toString()))();
  TextColumn get name => text()();
  TextColumn get memo => text()();
  TextColumn get icon => text()();
  IntColumn get totalAmount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

enum PlanType {
  plan,
  free,
}
