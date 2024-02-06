import '/flutter_flow/flutter_flow_util.dart';
import 'new_entry_widget.dart' show NewEntryWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class NewEntryModel extends FlutterFlowModel<NewEntryWidget> {
  ///  Local state fields for this page.

  String isRecording = 'False';

  String uploadedImages = 'False';

  String uploadedVideos = 'false';

  bool? locationadded = false;

  bool blankimage = false;

  String yploadedimaagecamera = 'False';

  List<String> photosforupload = [];
  void addToPhotosforupload(String item) => photosforupload.add(item);
  void removeFromPhotosforupload(String item) => photosforupload.remove(item);
  void removeAtIndexFromPhotosforupload(int index) =>
      photosforupload.removeAt(index);
  void insertAtIndexInPhotosforupload(int index, String item) =>
      photosforupload.insert(index, item);
  void updatePhotosforuploadAtIndex(int index, Function(String) updateFn) =>
      photosforupload[index] = updateFn(photosforupload[index]);

  List<String> photosforview = [];
  void addToPhotosforview(String item) => photosforview.add(item);
  void removeFromPhotosforview(String item) => photosforview.remove(item);
  void removeAtIndexFromPhotosforview(int index) =>
      photosforview.removeAt(index);
  void insertAtIndexInPhotosforview(int index, String item) =>
      photosforview.insert(index, item);
  void updatePhotosforviewAtIndex(int index, Function(String) updateFn) =>
      photosforview[index] = updateFn(photosforview[index]);

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
  AudioRecorder? audioRecorder;
  String? audionote;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
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
