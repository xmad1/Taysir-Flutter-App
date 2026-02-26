import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cachedParkingLocations = prefs
              .getStringList('ff_cachedParkingLocations')
              ?.map(latLngFromString)
              .withoutNulls ??
          _cachedParkingLocations;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _uploadedImagePath = '';
  String get uploadedImagePath => _uploadedImagePath;
  set uploadedImagePath(String value) {
    _uploadedImagePath = value;
  }

  List<LatLng> _cachedParkingLocations = [];
  List<LatLng> get cachedParkingLocations => _cachedParkingLocations;
  set cachedParkingLocations(List<LatLng> value) {
    _cachedParkingLocations = value;
    prefs.setStringList(
        'ff_cachedParkingLocations', value.map((x) => x.serialize()).toList());
  }

  void addToCachedParkingLocations(LatLng value) {
    cachedParkingLocations.add(value);
    prefs.setStringList('ff_cachedParkingLocations',
        _cachedParkingLocations.map((x) => x.serialize()).toList());
  }

  void removeFromCachedParkingLocations(LatLng value) {
    cachedParkingLocations.remove(value);
    prefs.setStringList('ff_cachedParkingLocations',
        _cachedParkingLocations.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCachedParkingLocations(int index) {
    cachedParkingLocations.removeAt(index);
    prefs.setStringList('ff_cachedParkingLocations',
        _cachedParkingLocations.map((x) => x.serialize()).toList());
  }

  void updateCachedParkingLocationsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    cachedParkingLocations[index] = updateFn(_cachedParkingLocations[index]);
    prefs.setStringList('ff_cachedParkingLocations',
        _cachedParkingLocations.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCachedParkingLocations(int index, LatLng value) {
    cachedParkingLocations.insert(index, value);
    prefs.setStringList('ff_cachedParkingLocations',
        _cachedParkingLocations.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
