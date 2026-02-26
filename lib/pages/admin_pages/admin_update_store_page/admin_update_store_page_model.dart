import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_model.dart';
import 'package:flutter/material.dart';
import 'admin_update_store_page_widget.dart';
import 'dart:async';
import '/backend/supabase/supabase.dart';

class AdminUpdateStorePageModel
    extends FlutterFlowModel<AdminUpdateStorePageWidget> {
  // 1. حالة الـ FutureBuilder
  Completer<List<StoresRow>>? requestCompleter;

  // 2. متحكمات حقول الإدخال (Text Controllers & Focus Nodes)
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  // 3. حالة الموقع الملتقط
  String? storeLocationString;

  // 4. متغيرات تحميل الصور
  bool isDataUploading_adminStorePhoto = false;
  // FFUploadedFile uploadedLocalFile_adminStorePhoto =
  //     FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: ''); // تم التعليق لتجنب استيراد Uint8List إذا لم يكن ضرورياً
  String uploadedFileUrl_adminStorePhoto = '';

  // 5. متغيرات الـ Checkbox (لحفظ حالة معايير الوصول)
  bool? checkboxValue1; // Dedicated Parking
  bool? checkboxValue2; // Has Ramp
  bool? checkboxValue3; // Accessible Restrooms
  bool? checkboxValue4; // Has Charger
  bool? checkboxValue5; // Wide Aisles
  bool? checkboxValue6; // Has Elevator
  bool? checkboxValue7; // Staff Assistance

  @override
  void initState(BuildContext context) {
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }

  Future<void> waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
