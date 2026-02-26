import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'add_parking_dialog_widget.dart' show AddParkingDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddParkingDialogModel extends FlutterFlowModel<AddParkingDialogWidget> {
  ///  Local state fields for this component.

  String? tempImageURL;

  String? tempStatus;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  bool isDataUploading_uploadedPhotoURL = false;
  FFUploadedFile uploadedLocalFile_uploadedPhotoURL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedPhotoURL = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
