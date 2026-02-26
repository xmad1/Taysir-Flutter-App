import '../database.dart';

class AdsTable extends SupabaseTable<AdsRow> {
  @override
  String get tableName => 'Ads';

  @override
  AdsRow createRow(Map<String, dynamic> data) => AdsRow(data);
}

class AdsRow extends SupabaseDataRow {
  AdsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdsTable();

  DateTime get startdate => getField<DateTime>('startdate')!;
  set startdate(DateTime value) => setField<DateTime>('startdate', value);

  DateTime? get enddate => getField<DateTime>('enddate');
  set enddate(DateTime? value) => setField<DateTime>('enddate', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get vendorid => getField<String>('vendorid');
  set vendorid(String? value) => setField<String>('vendorid', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);

  String? get pD => getField<String>('P/D');
  set pD(String? value) => setField<String>('P/D', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);
}
