import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'User';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String get username => getField<String>('username')!;
  set username(String value) => setField<String>('username', value);

  String get email => getField<String>('Email')!;
  set email(String value) => setField<String>('Email', value);

  String? get password => getField<String>('Password');
  set password(String? value) => setField<String>('Password', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get fullname => getField<String>('fullname');
  set fullname(String? value) => setField<String>('fullname', value);

  String? get phoroUrl => getField<String>('phoro_url');
  set phoroUrl(String? value) => setField<String>('phoro_url', value);

  DateTime? get createdTime => getField<DateTime>('created_time');
  set createdTime(DateTime? value) => setField<DateTime>('created_time', value);

  String get phoneNumber => getField<String>('phone_number')!;
  set phoneNumber(String value) => setField<String>('phone_number', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
