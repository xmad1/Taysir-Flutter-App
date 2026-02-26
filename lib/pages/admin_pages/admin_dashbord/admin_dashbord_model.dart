import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/vendor_pages/log_out/log_out_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'admin_dashbord_widget.dart' show AdminDashbordWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminDashbordModel extends FlutterFlowModel<AdminDashbordWidget> {
  ///  Local state fields for this page.

  List<bool> isExpanded = [];
  void addToIsExpanded(bool item) => isExpanded.add(item);
  void removeFromIsExpanded(bool item) => isExpanded.remove(item);
  void removeAtIndexFromIsExpanded(int index) => isExpanded.removeAt(index);
  void insertAtIndexInIsExpanded(int index, bool item) =>
      isExpanded.insert(index, item);
  void updateIsExpandedAtIndex(int index, Function(bool) updateFn) =>
      isExpanded[index] = updateFn(isExpanded[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  Stream<List<AdsRow>>? listViewSupabaseStream1;
  Stream<List<StoresRow>>? listViewStoresRecordSupabaseStream;
  Stream<List<UserRow>>? listViewSupabaseStream2;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
