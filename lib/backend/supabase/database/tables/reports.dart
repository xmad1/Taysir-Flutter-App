import '../database.dart';

class ReportsTable extends SupabaseTable<ReportsRow> {
  @override
  String get tableName => 'Reports';

  @override
  ReportsRow createRow(Map<String, dynamic> data) => ReportsRow(data);
}

class ReportsRow extends SupabaseDataRow {
  ReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get reportedAt => getField<DateTime>('reported_at')!;
  set reportedAt(DateTime value) => setField<DateTime>('reported_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imagurl => getField<String>('imagurl');
  set imagurl(String? value) => setField<String>('imagurl', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get reportedby => getField<String>('reportedby');
  set reportedby(String? value) => setField<String>('reportedby', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get assignedto => getField<String>('assignedto');
  set assignedto(String? value) => setField<String>('assignedto', value);
}
