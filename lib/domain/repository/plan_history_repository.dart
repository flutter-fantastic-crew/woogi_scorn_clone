import 'package:scorn_clone/entity/plan_history_entity.dart';

abstract class PlanHistoryRepository {
  Future<PlanHistoryEntity> getByPlanId(int id);
  Future<void> create(PlanHistoryEntity planHistory);
}
