import '../database.dart';

class StoresTable extends SupabaseTable<StoresRow> {
  @override
  String get tableName => 'Stores';

  @override
  StoresRow createRow(Map<String, dynamic> data) => StoresRow(data);
}

class StoresRow extends SupabaseDataRow {
  StoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoresTable();

  String get storename => getField<String>('storename')!;
  set storename(String value) => setField<String>('storename', value);

  String? get storelocation => getField<String>('storelocation');
  set storelocation(String? value) => setField<String>('storelocation', value);

  String? get storephone => getField<String>('storephone');
  set storephone(String? value) => setField<String>('storephone', value);

  String? get storeemail => getField<String>('storeemail');
  set storeemail(String? value) => setField<String>('storeemail', value);

  String? get vendorRef => getField<String>('vendorRef');
  set vendorRef(String? value) => setField<String>('vendorRef', value);

  bool? get hasAccessibleRes => getField<bool>('hasAccessibleRes');
  set hasAccessibleRes(bool? value) =>
      setField<bool>('hasAccessibleRes', value);

  bool? get hasCharger => getField<bool>('hasCharger');
  set hasCharger(bool? value) => setField<bool>('hasCharger', value);

  bool? get hasDedicatedParl => getField<bool>('hasDedicatedParl');
  set hasDedicatedParl(bool? value) =>
      setField<bool>('hasDedicatedParl', value);

  bool? get staffAssistance => getField<bool>('staffAssistance');
  set staffAssistance(bool? value) => setField<bool>('staffAssistance', value);

  bool? get hasWideAisles => getField<bool>('hasWideAisles');
  set hasWideAisles(bool? value) => setField<bool>('hasWideAisles', value);

  bool? get hasElevator => getField<bool>('hasElevator');
  set hasElevator(bool? value) => setField<bool>('hasElevator', value);

  bool? get hasRamp => getField<bool>('hasRamp');
  set hasRamp(bool? value) => setField<bool>('hasRamp', value);

  String? get storedescription => getField<String>('storedescription');
  set storedescription(String? value) =>
      setField<String>('storedescription', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);
}
