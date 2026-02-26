import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'sign_widget.dart' show SignWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignModel extends FlutterFlowModel<SignWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadUserPhoto = false;
  FFUploadedFile uploadedLocalFile_uploadUserPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadUserPhoto = '';

  // State field(s) for fullNameCreate widget.
  FocusNode? fullNameCreateFocusNode;
  TextEditingController? fullNameCreateTextController;
  String? Function(BuildContext, String?)?
      fullNameCreateTextControllerValidator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  // State field(s) for phoneNumper_Create widget.
  FocusNode? phoneNumperCreateFocusNode;
  TextEditingController? phoneNumperCreateTextController;
  String? Function(BuildContext, String?)?
      phoneNumperCreateTextControllerValidator;
  // State field(s) for username_Create widget.
  FocusNode? usernameCreateFocusNode;
  TextEditingController? usernameCreateTextController;
  String? Function(BuildContext, String?)?
      usernameCreateTextControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  // State field(s) for confirmPassword_Create widget.
  FocusNode? confirmPasswordCreateFocusNode;
  TextEditingController? confirmPasswordCreateTextController;
  late bool confirmPasswordCreateVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordCreateTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    confirmPasswordCreateVisibility = false;
  }

  @override
  void dispose() {
    fullNameCreateFocusNode?.dispose();
    fullNameCreateTextController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    phoneNumperCreateFocusNode?.dispose();
    phoneNumperCreateTextController?.dispose();

    usernameCreateFocusNode?.dispose();
    usernameCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    confirmPasswordCreateFocusNode?.dispose();
    confirmPasswordCreateTextController?.dispose();
  }
}
