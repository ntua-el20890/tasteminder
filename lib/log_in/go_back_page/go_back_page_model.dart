import '/flutter_flow/flutter_flow_util.dart';
import 'go_back_page_widget.dart' show GoBackPageWidget;
import 'package:flutter/material.dart';

class GoBackPageModel extends FlutterFlowModel<GoBackPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
