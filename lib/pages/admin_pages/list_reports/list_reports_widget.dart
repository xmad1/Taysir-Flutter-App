import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_reports_model.dart';
export 'list_reports_model.dart';

class ListReportsWidget extends StatefulWidget {
  const ListReportsWidget({super.key});

  static String routeName = 'ListReports';
  static String routePath = '/listReports';

  @override
  State<ListReportsWidget> createState() => _ListReportsWidgetState();
}

class _ListReportsWidgetState extends State<ListReportsWidget>
    with TickerProviderStateMixin {
  late ListReportsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListReportsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // ✅ دالة مساعدة لإنشاء تبويب قائمة التقارير (لتقليل التكرار)
  Widget _buildReportTab({required String statusFilter}) {
    return SingleChildScrollView(
      // 🛑 الحل 1: إزالة physics: NeverScrollableScrollPhysics() لتمكين التمرير
      child: Column(
        // ✅ استخدام MIN لضمان أن العمود يأخذ فقط المساحة المطلوبة (حل مشكلة التجاوز)
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<List<ReportsRow>>(
            future: ReportsTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'status',
                statusFilter,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ReportsRow> listViewReportsRowList = snapshot.data!;

              // 🛑 الحل 2: يجب أن تكون ListView.builder هنا تستخدم shrinkWrap و NeverScrollablePhysics
              // لتعمل بشكل صحيح داخل SingleChildScrollView
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                // ✅ تعطيل التمرير الداخلي والاعتماد على SingleChildScrollView الأب
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listViewReportsRowList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewReportsRow =
                      listViewReportsRowList[listViewIndex];

                  // 💡 تحديد أيقونة الحالة ولونها بناءً على الحالة
                  final (statusIcon, statusColor) = switch (statusFilter) {
                    'archived' => (
                        Icons.archive_rounded,
                        FlutterFlowTheme.of(context).primaryText
                      ),
                    'sended' => (Icons.send_to_mobile_sharp, Color(0xFF18D500)),
                    'ignored' => (
                        Icons.folder_delete_outlined,
                        Color(0xFFB00A15)
                      ),
                    _ => (Icons.error, FlutterFlowTheme.of(context).error),
                  };

                  return Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      9.0, 5.0, 0.0, 5.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      listViewReportsRow.type,
                                      'type',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.interTight(),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  listViewReportsRow.imagurl!,
                                  width: 361.5,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 5.0, 0.0),
                                    child: Icon(
                                      Icons.person_2,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      listViewReportsRow.reportedby,
                                      '00000000000000000',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(),
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              // 🛑 ✅ التعديل المطلوب: وضع الأيقونة والحالة جنباً إلى جنب
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 5.0), // إضافة Padding
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.end, // محاذاة لليمين
                                  children: [
                                    // أيقونة الحالة
                                    Icon(
                                      statusIcon,
                                      color: statusColor,
                                      size: 24.0,
                                    ),
                                    SizedBox(
                                        width: 8.0), // مسافة بين الأيقونة والنص
                                    // نص الحالة
                                    Text(
                                      valueOrDefault<String>(
                                        listViewReportsRow.status,
                                        'status',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight
                                                .w500, // جعل الخط أوضح
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      listViewReportsRow.description,
                                      'description',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // ✅ إضافة مساحة سفلية صغيرة لضمان عمل التمرير
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF814244),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Past Report',
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
          child: Column(
            // ✅ تركها max لتملأ المساحة بين AppBar والقاع
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: FlutterFlowButtonTabBar(
                  useToggleButtonStyle: true,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.interTight(),
                        letterSpacing: 0.0,
                      ),
                  unselectedLabelStyle:
                      FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.interTight(),
                            letterSpacing: 0.0,
                          ),
                  labelColor: FlutterFlowTheme.of(context).alternate,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  backgroundColor: Color(0xB5814244),
                  unselectedBackgroundColor: Color(0x55814244),
                  borderColor: Color(0xFF814244),
                  unselectedBorderColor: Color(0x4D814244),
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  elevation: 0.0,
                  buttonMargin:
                      EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  padding: EdgeInsets.all(3.0),
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'j01x6awv' /* archived */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '5cjel3vy' /* sended */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'vhq0i42z' /* ignored */,
                      ),
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}, () async {}][i]();
                  },
                ),
              ),
              // ✅ Expanded ضروري لتمكين TabBarView من احتلال باقي المساحة
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    // 1. تبويب Archived
                    _buildReportTab(statusFilter: 'archived'),
                    // 2. تبويب Sended
                    _buildReportTab(statusFilter: 'sended'),
                    // 3. تبويب Ignored
                    _buildReportTab(statusFilter: 'ignored'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
