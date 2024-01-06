import '/flutter_flow/flutter_flow_util.dart';
import 'new_entry_widget.dart' show NewEntryWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class NewEntryModel extends FlutterFlowModel<NewEntryWidget> {
  ///  Local state fields for this page.

  String isRecording = 'False';

  String uploadedImages = 'False';

  String uploadedVideos = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NewTitle widget.
  FocusNode? newTitleFocusNode;
  TextEditingController? newTitleController;
  String? Function(BuildContext, String?)? newTitleControllerValidator;
  // State field(s) for NewDescription widget.
  FocusNode? newDescriptionFocusNode;
  TextEditingController? newDescriptionController;
  String? Function(BuildContext, String?)? newDescriptionControllerValidator;
  // State field(s) for NewRecipie widget.
  FocusNode? newRecipieFocusNode;
  TextEditingController? newRecipieController;
  String? Function(BuildContext, String?)? newRecipieControllerValidator;
  // State field(s) for NewIngredients widget.
  FocusNode? newIngredientsFocusNode;
  TextEditingController? newIngredientsController;
  String? Function(BuildContext, String?)? newIngredientsControllerValidator;
  // State field(s) for NewTags widget.
  FocusNode? newTagsFocusNode;
  TextEditingController? newTagsController;
  String? Function(BuildContext, String?)? newTagsControllerValidator;
  // State field(s) for NewSatLvl widget.
  double? newSatLvlValue;
  // State field(s) for NewHungerLvl widget.
  double? newHungerLvlValue;
  // State field(s) for NewComfortLvl widget.
  double? newComfortLvlValue;
  // State field(s) for NewConvLvl widget.
  double? newConvLvlValue;
  // State field(s) for NewOverallLvl widget.
  double? newOverallLvlValue;
  Record? audioRecorder;
  String? audionote;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];
  List<String> uploadedFileUrls1 = [];

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    newTitleFocusNode?.dispose();
    newTitleController?.dispose();

    newDescriptionFocusNode?.dispose();
    newDescriptionController?.dispose();

    newRecipieFocusNode?.dispose();
    newRecipieController?.dispose();

    newIngredientsFocusNode?.dispose();
    newIngredientsController?.dispose();

    newTagsFocusNode?.dispose();
    newTagsController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
