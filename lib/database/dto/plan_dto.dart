import '../table/plan_table.dart';

class PlanDto {
  final int? id;
  final DateTime startDate;
  final DateTime endDate;
  final PlanType type;
  final String name;
  final String memo;
  final String icon;
  final int totalAmount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const PlanDto(
      {this.id,
      required this.startDate,
      required this.endDate,
      required this.type,
      required this.name,
      required this.memo,
      required this.icon,
      required this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
}
