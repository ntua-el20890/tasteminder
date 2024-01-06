import '/flutter_flow/flutter_flow_util.dart';
import 'sing_up_widget.dart' show SingUpWidget;
import 'package:flutter/material.dart';

class SingUpModel extends FlutterFlowModel<SingUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for UserNameSignUp widget.
  FocusNode? userNameSignUpFocusNode;
  TextEditingController? userNameSignUpController;
  String? Function(BuildContext, String?)? userNameSignUpControllerValidator;
  // State field(s) for EmailSignUp widget.
  FocusNode? emailSignUpFocusNode;
  TextEditingController? emailSignUpController;
  String? Function(BuildContext, String?)? emailSignUpControllerValidator;
  // State field(s) for PasswordSignUp widget.
  final passwordSignUpKey = GlobalKey();
  FocusNode? passwordSignUpFocusNode;
  TextEditingController? passwordSignUpController;
  String? passwordSignUpSelectedOption;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for ConfirmPasswordSignUp widget.
  final confirmPasswordSignUpKey = GlobalKey();
  FocusNode? confirmPasswordSignUpFocusNode;
  TextEditingController? confirmPasswordSignUpController;
  String? confirmPasswordSignUpSelectedOption;
  late bool confirmPasswordSignUpVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordSignUpControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordSignUpVisibility = false;
    confirmPasswordSignUpVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameSignUpFocusNode?.dispose();
    userNameSignUpController?.dispose();

    emailSignUpFocusNode?.dispose();
    emailSignUpController?.dispose();

    passwordSignUpFocusNode?.dispose();

    confirmPasswordSignUpFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
