import '../database.dart';

class AuditLogsTable extends SupabaseTable<AuditLogsRow> {
  @override
  String get tableName => 'Audit_Logs';

  @override
  AuditLogsRow createRow(Map<String, dynamic> data) => AuditLogsRow(data);
}

class AuditLogsRow extends SupabaseDataRow {
  AuditLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AuditLogsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get adminID => getField<String>('adminID')!;
  set adminID(String value) => setField<String>('adminID', value);

  String? get actionType => getField<String>('actionType');
  set actionType(String? value) => setField<String>('actionType', value);

  String? get targetUserID => getField<String>('targetUserID');
  set targetUserID(String? value) => setField<String>('targetUserID', value);

  PostgresTime? get timestanp => getField<PostgresTime>('timestanp');
  set timestanp(PostgresTime? value) =>
      setField<PostgresTime>('timestanp', value);
}
