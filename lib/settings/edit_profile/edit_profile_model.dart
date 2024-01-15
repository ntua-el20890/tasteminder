import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for DisplayNameUpdate widget.
  FocusNode? displayNameUpdateFocusNode;
  TextEditingController? displayNameUpdateController;
  String? Function(BuildContext, String?)? displayNameUpdateControllerValidator;
  // State field(s) for EmailUpdate widget.
  FocusNode? emailUpdateFocusNode;
  TextEditingController? emailUpdateController;
  String? Function(BuildContext, String?)? emailUpdateControllerValidator;
  // State field(s) for DescriptionUpdate widget.
  FocusNode? descriptionUpdateFocusNode;
  TextEditingController? descriptionUpdateController;
  String? Function(BuildContext, String?)? descriptionUpdateControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameUpdateFocusNode?.dispose();
    displayNameUpdateController?.dispose();

    emailUpdateFocusNode?.dispose();
    emailUpdateController?.dispose();

    descriptionUpdateFocusNode?.dispose();
    descriptionUpdateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
