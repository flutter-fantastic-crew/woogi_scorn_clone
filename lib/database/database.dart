// import 'dart:io';
// import 'package:path/path.dart' as p;
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:scorn_clone/database/table/plan_table.dart';
//
// import 'dao/plan_dao.dart';
//
// part 'database.g.dart';
//
// @DriftDatabase(tables: [Plan], daos: [PlanDao])
// class Database extends _$Database {
//   Database._internal() : super(_openConnection());
//   static final Database _instance = Database._internal();
//
//   factory Database() {
//     return _instance;
//   }
//
//   @override
//   int get schemaVersion => 1;
//
//   @override
//   MigrationStrategy get migration {
//     return MigrationStrategy(
//       onCreate: (Migrator m) async {
//         await m.createAll();
//       },
//       onUpgrade: (Migrator m, int from, int to) async {},
//     );
//   }
// }
//
// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'sqlite.db'));
//     return NativeDatabase(file);
//   });
// }
