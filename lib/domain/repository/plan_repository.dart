import 'package:scorn_clone/entity/plan_entity.dart';

abstract class PlanRepository {
  Future<List<PlanEntity>> getPlans();

  Future<PlanEntity> getById(int id);

  Future<void> create(PlanEntity plan);
}
