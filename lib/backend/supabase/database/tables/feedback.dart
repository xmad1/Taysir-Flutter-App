import '../database.dart';

class FeedbackTable extends SupabaseTable<FeedbackRow> {
  @override
  String get tableName => 'Feedback';

  @override
  FeedbackRow createRow(Map<String, dynamic> data) => FeedbackRow(data);
}

class FeedbackRow extends SupabaseDataRow {
  FeedbackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedbackTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get submittedAt => getField<DateTime>('submitted_at')!;
  set submittedAt(DateTime value) => setField<DateTime>('submitted_at', value);

  String? get submittedby => getField<String>('submittedby');
  set submittedby(String? value) => setField<String>('submittedby', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
