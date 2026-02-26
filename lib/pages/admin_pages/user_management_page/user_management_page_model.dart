import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/admin_pages/admin_change_role_dialog/admin_change_role_dialog_widget.dart';
import 'dart:ui';
import 'user_management_page_widget.dart' show UserManagementPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserManagementPageModel
    extends FlutterFlowModel<UserManagementPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<UserRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
