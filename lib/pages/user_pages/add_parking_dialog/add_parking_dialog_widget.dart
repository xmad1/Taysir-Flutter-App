import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui'; // لا يزال مستخدماً للـ BackdropFilter في أماكن أخرى
import '/index.dart'; // لتشغيل get_current_user_location
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/random_data_util.dart'
    as random_data; // لإضافة الـ parkingid العشوائي

// يجب أن يتم إضافة هذا الاستيراد إذا لم يكن موجوداً
import '/flutter_flow/lat_lng.dart';

import 'add_parking_dialog_model.dart';
export 'add_parking_dialog_model.dart';

class AddParkingDialogWidget extends StatefulWidget {
  const AddParkingDialogWidget({super.key});

  @override
  State<AddParkingDialogWidget> createState() => _AddParkingDialogWidgetState();
}

class _AddParkingDialogWidgetState extends State<AddParkingDialogWidget> {
  late AddParkingDialogModel _model;

  // ✅ متغير جديد لحفظ إحداثيات GPS كنص (مهم)
  String? currentGpsLocationString;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddParkingDialogModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  // ✅ الدالة الجديدة: لالتقاط الموقع الحالي وعرض رسالة للمستخدم
  Future<void> _captureCurrentLocation() async {
    // 1. طلب الموقع
    final userLocation = await getCurrentUserLocation(
        defaultLocation: LatLng(0.0, 0.0), cached: false // نطلب موقع جديد
        );

    // 2. تحويل الإحداثيات إلى التنسيق النصي المطلوب في Supabase (مثال: "30.1234,46.6753")
    final String locationString =
        '${userLocation.latitude},${userLocation.longitude}';

    safeSetState(() {
      currentGpsLocationString = locationString;
    });

    // 3. عرض رسالة التأكيد للمستخدم
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Current GPS location attached for submission.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'fsav1xf1' /* Help others navigate easily! P... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
            ),
          ),

          // ----------------------------------------------------
          // ✅ الزر الجديد: الحصول على موقع GPS الحالي
          // ----------------------------------------------------
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: FFButtonWidget(
              onPressed:
                  _captureCurrentLocation, // استدعاء الدالة الجديدة لالتقاط الموقع
              text: currentGpsLocationString != null &&
                      currentGpsLocationString != '0.0,0.0'
                  ? FFLocalizations.of(context)
                      .getText('Location Attached! (GPS)')
                  : FFLocalizations.of(context).getText(
                      'Attach Current Location'), // نص يتغير بعد التقاط الموقع
              icon: Icon(
                Icons.gps_fixed,
                color: FlutterFlowTheme.of(context).info,
                size: 16.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                color: Color(0xFF0057F7),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          // ----------------------------------------------------

          Padding(
            // ✅ هذا ودجت زر الصورة الأصلي
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                // ... (منطق تحميل الصورة يبقى كما هو)
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  storageFolderPath: 'parking',
                  allowPhoto: true,
                );
                // ... (التحقق ورفع الملفات)
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(
                      () => _model.isDataUploading_uploadedPhotoURL = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                              originalFilename: m.originalFilename,
                            ))
                        .toList();

                    downloadUrls = await uploadSupabaseStorageFiles(
                      bucketName: 'taysir_image',
                      selectedFiles: selectedMedia,
                    );
                  } finally {
                    _model.isDataUploading_uploadedPhotoURL = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile_uploadedPhotoURL =
                          selectedUploadedFiles.first;
                      _model.uploadedFileUrl_uploadedPhotoURL =
                          downloadUrls.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }
              },
              text: FFLocalizations.of(context).getText(
                'oh02yu46' /* Add photo */,
              ),
              icon: Icon(
                Icons.photo_camera_back,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 35.9,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF0057F7),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          SizedBox(
            width: 270.0,
            child: Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  // ✅ 1. التحقق من أن الموقع تم التقاطه قبل الحفظ
                  if (currentGpsLocationString == null ||
                      currentGpsLocationString == '0.0,0.0') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Please attach current location first.')),
                    );
                    return;
                  }

                  await ParkingTable().insert({
                    'parkingid':
                        random_data.randomInteger(1, 99999999).toString(),
                    'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                    'addedby': currentUserUid,
                    'imageurl': _model.uploadedFileUrl_uploadedPhotoURL,
                    // ✅ حفظ إحداثيات GPS الملتقطة
                    'location': currentGpsLocationString,
                  });
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  'oa248lhz' /* Add Parkibg */,
                ),
                icon: Icon(
                  Icons.add_location,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
