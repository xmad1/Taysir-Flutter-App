import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_update_store_page_model.dart';
export 'admin_update_store_page_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminUpdateStorePageWidget extends StatefulWidget {
  const AdminUpdateStorePageWidget({
    super.key,
    required this.ref,
  });

  // 💡 ref هو معرف المتجر (store UID)
  final String? ref;

  static String routeName = 'AdminUpdateStorePage';
  static String routePath = '/AdminUpdateStorePage';

  @override
  State<AdminUpdateStorePageWidget> createState() =>
      _AdminUpdateStorePageWidgetState();
}

class _AdminUpdateStorePageWidgetState
    extends State<AdminUpdateStorePageWidget> {
  late AdminUpdateStorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminUpdateStorePageModel());

    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // ✅ دالة مساعدة لإنشاء صف خيارات الوصول
  Widget _buildAccessibilityRow({
    required String textKey,
    required bool? checkboxValue,
    required void Function(bool?) onChanged,
    required IconData icon,
    required Color color,
  }) {
    final currentValue = checkboxValue ?? false;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8.0, 0),
                  child: Icon(icon, color: color, size: 24.0),
                ),
                Expanded(
                  child: Text(
                    FFLocalizations.of(context).getText(textKey),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
            ),
            child: Checkbox(
              value: currentValue,
              onChanged: onChanged,
              side: (FlutterFlowTheme.of(context).alternate != null)
                  ? BorderSide(
                      width: 2, color: FlutterFlowTheme.of(context).alternate!)
                  : null,
              activeColor: Color(0xF8814244),
              checkColor: FlutterFlowTheme.of(context).info,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    FocusNode focusNode,
    String labelText, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 9.0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          obscureText: false,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            labelText: labelText,
            labelStyle: FlutterFlowTheme.of(context).labelMedium,
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            focusedErrorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ✅ الفحص الأولي: إذا كان معرف المتجر مفقودًا، أعرض رسالة خطأ سريعة
    if (widget.ref == null || widget.ref!.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('خطأ في البيانات')),
        body: Center(child: Text("معرف المتجر مفقود، لا يمكن تحديث البيانات.")),
      );
    }

    return FutureBuilder<List<StoresRow>>(
      // ✅ التعديل 1: جلب البيانات بناءً على معرف المتجر (widget.ref!)
      future: (_model.requestCompleter ??= Completer<List<StoresRow>>()
            ..complete(StoresTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'uid', // البحث بمعرف المتجر (UID)
                widget.ref,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        List<StoresRow> adminUpdateStorePageStoresRowList = snapshot.data!;
        final adminUpdateStorePageStoresRow =
            adminUpdateStorePageStoresRowList.isNotEmpty
                ? adminUpdateStorePageStoresRowList.first
                : null;

        // 🛑 ✅ التعديل 2: فحص إذا لم يتم العثور على متجر بالـ ID المحدد
        if (adminUpdateStorePageStoresRow == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('خطأ في تحميل بيانات المتجر')),
            body: Center(
                child: Text("لم يتم العثور على المتجر بالمعرف: ${widget.ref}")),
          );
        }

        // ✅ التعديل 3: تهيئة المتحكمات والقيم الابتدائية (الآن بعد ضمان وجود البيانات)
        // يتم استخدام عامل ??= لتعيين القيمة فقط إذا كانت قيمة المتحكم فارغة (للحفاظ على التغييرات المدخلة من المستخدم)
        _model.textController1?.text = _model.textController1?.text ??
            adminUpdateStorePageStoresRow!.storename ??
            '';
        _model.textController2?.text = _model.textController2?.text ??
            adminUpdateStorePageStoresRow!.storedescription ??
            '';
        _model.textController3?.text = _model.textController3?.text ??
            adminUpdateStorePageStoresRow!.storephone ??
            '';
        _model.textController4?.text = _model.textController4?.text ??
            adminUpdateStorePageStoresRow!.storeemail ??
            '';
        _model.storeLocationString = _model.storeLocationString ??
            adminUpdateStorePageStoresRow!.storelocation;

        _model.checkboxValue1 = _model.checkboxValue1 ??
            adminUpdateStorePageStoresRow!.hasDedicatedParl;
        _model.checkboxValue2 =
            _model.checkboxValue2 ?? adminUpdateStorePageStoresRow!.hasRamp;
        _model.checkboxValue3 = _model.checkboxValue3 ??
            adminUpdateStorePageStoresRow!.hasAccessibleRes;
        _model.checkboxValue4 =
            _model.checkboxValue4 ?? adminUpdateStorePageStoresRow!.hasCharger;
        _model.checkboxValue5 = _model.checkboxValue5 ??
            adminUpdateStorePageStoresRow!.hasWideAisles;
        _model.checkboxValue6 =
            _model.checkboxValue6 ?? adminUpdateStorePageStoresRow!.hasElevator;
        _model.checkboxValue7 = _model.checkboxValue7 ??
            adminUpdateStorePageStoresRow!.staffAssistance;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFF814244),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon:
                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 24.0),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                'Modify Stores',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.interTight(),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(9.0, 9.0, 9.0, 5.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildTextField(
                                  _model.textController1!,
                                  _model.textFieldFocusNode1!,
                                  FFLocalizations.of(context)
                                      .getText('wvp4feh5' /* Store Name */)),
                              _buildTextField(
                                  _model.textController2!,
                                  _model.textFieldFocusNode2!,
                                  FFLocalizations.of(context).getText(
                                      'gokxqwpf' /* Store Description */),
                                  maxLines: 3),
                              _buildTextField(
                                  _model.textController3!,
                                  _model.textFieldFocusNode3!,
                                  FFLocalizations.of(context)
                                      .getText('rig8a3h5' /* Phone */),
                                  keyboardType: TextInputType.phone),
                              _buildTextField(
                                  _model.textController4!,
                                  _model.textFieldFocusNode4!,
                                  FFLocalizations.of(context)
                                      .getText('z2ojjw6t' /* Email */),
                                  keyboardType: TextInputType.emailAddress),

                              // زر الموقع
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 9.0, 9.0, 9.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final userLocation =
                                        await getCurrentUserLocation(
                                            defaultLocation: LatLng(0.0, 0.0),
                                            cached: false);
                                    if (userLocation.latitude != 0.0 ||
                                        userLocation.longitude != 0.0) {
                                      final String locationString =
                                          '${userLocation.latitude},${userLocation.longitude}';
                                      safeSetState(() {
                                        _model.storeLocationString =
                                            locationString;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Store GPS location attached.')));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Location not available.')));
                                    }
                                  },
                                  text: _model.storeLocationString != null
                                      ? FFLocalizations.of(context)
                                          .getText('Location Attached! (GPS)')
                                      : FFLocalizations.of(context)
                                          .getText('Attach Store Location'),
                                  icon: Icon(Icons.gps_fixed, size: 15.0),
                                  options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .tertiary),
                                ),
                              ),

                              // زر الصورة
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 0.0, 9.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            storageFolderPath: 'storeUp',
                                            allowPhoto: true);
                                    if (selectedMedia != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Image upload initiated.')));
                                    }
                                  },
                                  text: FFLocalizations.of(context)
                                      .getText('41rp1yop' /* Add Photo */),
                                  icon:
                                      Icon(Icons.photo_camera_back, size: 15.0),
                                  options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      color: Color(0x98814244)),
                                ),
                              ),

                              // قسم معايير الوصول
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 9.0, 0.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                        'buc6h429' /* Accessibility Services & Stand... */),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                            font: GoogleFonts.inter(),
                                            letterSpacing: 0.0),
                                  ),
                                ),
                              ),

                              // صفوف المعايير
                              _buildAccessibilityRow(
                                  textKey: 'wt2lqsaa',
                                  checkboxValue: _model.checkboxValue1,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue1 = newValue),
                                  icon: Icons.accessible_rounded,
                                  color: Color(0xFF0083E4)),
                              _buildAccessibilityRow(
                                  textKey: 'pj0wadnt',
                                  checkboxValue: _model.checkboxValue2,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue2 = newValue),
                                  icon: Icons.accessible_rounded,
                                  color: Color(0xFFD23939)),
                              _buildAccessibilityRow(
                                  textKey: 'c4fhefqw',
                                  checkboxValue: _model.checkboxValue3,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue3 = newValue),
                                  icon: Icons.wc,
                                  color: Color(0xFF1CB0F6)),
                              _buildAccessibilityRow(
                                  textKey: '6y9phel6',
                                  checkboxValue: _model.checkboxValue4,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue4 = newValue),
                                  icon: Icons.battery_charging_full,
                                  color: Color(0xFF43A047)),
                              _buildAccessibilityRow(
                                  textKey: 'q93imlcs',
                                  checkboxValue: _model.checkboxValue5,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue5 = newValue),
                                  icon: Icons.directions_walk,
                                  color: Color(0xFF9E9E9E)),
                              _buildAccessibilityRow(
                                  textKey: 'nnbvl7bj',
                                  checkboxValue: _model.checkboxValue6,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue6 = newValue),
                                  icon: Icons.elevator,
                                  color: Color(0xFF673AB7)),
                              _buildAccessibilityRow(
                                  textKey: '2orgjnik',
                                  checkboxValue: _model.checkboxValue7,
                                  onChanged: (newValue) => safeSetState(
                                      () => _model.checkboxValue7 = newValue),
                                  icon: Icons.hail,
                                  color: Color(0xFFF07540)),

                              SizedBox(height: 15.0),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // زر التحديث النهائي
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 30.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            String locationToSave = _model
                                    .storeLocationString ??
                                adminUpdateStorePageStoresRow!.storelocation ??
                                '';

                            await StoresTable().update(
                              data: {
                                'storename': _model.textController1?.text,
                                'storephone': _model.textController3?.text,
                                'storeemail': _model.textController4?.text,
                                'storelocation': locationToSave,
                                'hasAccessibleRes': _model.checkboxValue3,
                                'hasCharger': _model.checkboxValue4,
                                'hasDedicatedParl': _model.checkboxValue1,
                                'staffAssistance': _model.checkboxValue7,
                                'hasWideAisles': _model.checkboxValue5,
                                'hasElevator': _model.checkboxValue6,
                                'hasRamp': _model.checkboxValue2,
                                'storedescription':
                                    _model.textController2?.text,
                                'imageurl':
                                    _model.uploadedFileUrl_adminStorePhoto,
                              },
                              // ✅ هنا التعديل الحاسم: نستخدم widget.ref! لضمان أن القيمة غير خالية
                              matchingRows: (rows) =>
                                  rows.eq('uid', widget.ref!),
                            );

                            context.safePop();
                          },
                          text: FFLocalizations.of(context)
                              .getText('8qi7i1cu' /* Update Store Info */),
                          options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              color: Color(0xFF814244)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
