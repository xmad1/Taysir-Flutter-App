import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'parking_details_sheet_widget.dart' show ParkingDetailsSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingDetailsSheetModel
    extends FlutterFlowModel<ParkingDetailsSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in ParkingDetailsSheet widget.
  List<ParkingRow>? parkingDetails;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
