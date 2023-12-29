import '/flutter_flow/flutter_flow_util.dart';
import 'sing_up_widget.dart' show SingUpWidget;
import 'package:flutter/material.dart';

class SingUpModel extends FlutterFlowModel<SingUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  final textFieldKey4 = GlobalKey();
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? textFieldSelectedOption4;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
