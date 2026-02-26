// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalParkingSpotsStruct extends BaseStruct {
  LocalParkingSpotsStruct({
    LatLng? location,
  }) : _location = location;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  static LocalParkingSpotsStruct fromMap(Map<String, dynamic> data) =>
      LocalParkingSpotsStruct(
        location: data['location'] as LatLng?,
      );

  static LocalParkingSpotsStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalParkingSpotsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LocalParkingSpotsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LocalParkingSpotsStruct(
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LocalParkingSpotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocalParkingSpotsStruct && location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([location]);
}

LocalParkingSpotsStruct createLocalParkingSpotsStruct({
  LatLng? location,
}) =>
    LocalParkingSpotsStruct(
      location: location,
    );
