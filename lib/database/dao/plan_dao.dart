import 'package:drift/drift.dart';

import '../database.dart';
import '../dto/plan_dto.dart';
import '../table/plan_table.dart';

part 'plan_dao.g.dart';

@DriftAccessor(tables: [Plans])
class PlanDao extends DatabaseAccessor<Database> with _$PlanDaoMixin {
  PlanDao(super.db);

  Future<List<PlanDto>> getAll() => db.select(plans).get();
  Future<void> create(PlanDto planDto) async {
    into(plans).insert(PlansCompanion(
      startDate: Value(planDto.startDate),
      endDate: Value(planDto.endDate),
      type: Value(planDto.type),
      name: Value(planDto.name),
      memo: Value(planDto.memo),
      icon: Value(planDto.icon),
      totalAmount: Value(planDto.totalAmount),
      createdAt: Value(DateTime.now()),
    ));
  }
}
