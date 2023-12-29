import '/components/card_copy_widget.dart';
import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for card component.
  late CardModel cardModel1;
  // Model for card component.
  late CardModel cardModel2;
  // Model for card component.
  late CardModel cardModel3;
  // Model for cardCopy component.
  late CardCopyModel cardCopyModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cardModel1 = createModel(context, () => CardModel());
    cardModel2 = createModel(context, () => CardModel());
    cardModel3 = createModel(context, () => CardModel());
    cardCopyModel = createModel(context, () => CardCopyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardModel1.dispose();
    cardModel2.dispose();
    cardModel3.dispose();
    cardCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
