import '/flutter_flow/flutter_flow_util.dart';
import 'sing_in_widget.dart' show SingInWidget;
import 'package:flutter/material.dart';

class SingInModel extends FlutterFlowModel<SingInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailSignIn widget.
  FocusNode? emailSignInFocusNode;
  TextEditingController? emailSignInController;
  String? Function(BuildContext, String?)? emailSignInControllerValidator;
  // State field(s) for PasswordSignIn widget.
  final passwordSignInKey = GlobalKey();
  FocusNode? passwordSignInFocusNode;
  TextEditingController? passwordSignInController;
  String? passwordSignInSelectedOption;
  late bool passwordSignInVisibility;
  String? Function(BuildContext, String?)? passwordSignInControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordSignInVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailSignInFocusNode?.dispose();
    emailSignInController?.dispose();

    passwordSignInFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
