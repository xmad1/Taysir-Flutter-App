import '../database.dart';

class ParkingTable extends SupabaseTable<ParkingRow> {
  @override
  String get tableName => 'Parking';

  @override
  ParkingRow createRow(Map<String, dynamic> data) => ParkingRow(data);
}

class ParkingRow extends SupabaseDataRow {
  ParkingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParkingTable();

  String get parkingid => getField<String>('parkingid')!;
  set parkingid(String value) => setField<String>('parkingid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get addedby => getField<String>('addedby');
  set addedby(String? value) => setField<String>('addedby', value);

  DateTime? get lastupdated => getField<DateTime>('lastupdated');
  set lastupdated(DateTime? value) => setField<DateTime>('lastupdated', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);
}
