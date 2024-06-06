// import 'package:drift/drift.dart';
//
// import '../database.dart';
// import '../dto/plan_dto.dart';
// import '../table/plan_table.dart';
//
// part 'plan_dao.g.dart';
//
// @DriftAccessor(tables: [Plan])
// class PlanDao extends DatabaseAccessor<Database> with _$PlanDaoMixin {
//   PlanDao(super.db);
//
//   Future<List<PlanDto>> getAll() => db.select(plan).get();
//   Future<void> create(PlanDto plan) async {
//     into(plan).insert(PlanCompanion(
//       startDate: Value(plan.startDate),
//       endDate: Value(plan.endDate),
//       type: Value(plan.type),
//       name: Value(plan.name),
//       memo: Value(plan.memo),
//       icon: Value(plan.icon),
//       totalAmount: Value(plan.totalAmount),
//       createdAt: Value(DateTime.now()),
//     ));
//   }
// }
