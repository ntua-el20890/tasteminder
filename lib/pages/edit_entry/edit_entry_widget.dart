import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_entry_card_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'edit_entry_model.dart';
export 'edit_entry_model.dart';

class EditEntryWidget extends StatefulWidget {
  const EditEntryWidget({
    super.key,
    required this.entryRecievedEdit,
    bool? hasblankimage,
    required this.imagesinentryreci,
    this.audioinentryrec,
  })  : hasblankimage = hasblankimage ?? false;

  final DocumentReference? entryRecievedEdit;
  final bool hasblankimage;
  final List<String>? imagesinentryreci;
  final String? audioinentryrec;

  @override
  _EditEntryWidgetState createState() => _EditEntryWidgetState();
}

class _EditEntryWidgetState extends State<EditEntryWidget> {
  late EditEntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEntryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!widget.hasblankimage) {
        setState(() {
          _model.photosupload =
              widget.imagesinentryreci!.toList().cast<String>();
        });
      }
      setState(() {
        _model.record = widget.audioinentryrec!;
      });
    });

    _model.newTitleFocusNode ??= FocusNode();

    _model.newDescriptionFocusNode ??= FocusNode();

    _model.newRecipieFocusNode ??= FocusNode();

    _model.newIngredientsFocusNode ??= FocusNode();

    _model.newTagsFocusNode ??= FocusNode();

    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<EntryRecord>(
      stream: EntryRecord.getDocument(widget.entryRecievedEdit!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final editEntryEntryRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 15.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 42.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.isRecording = 'False';
                                      });
                                      if (_model.uploadedImages == 'True') {
                                        await editEntryEntryRecord.reference
                                            .update({
                                          ...createEntryRecordData(
                                            hasblankimage: false,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'Image': _model.photosupload,
                                            },
                                          ),
                                        });
                                      }
                                      if (_model.uploadedFileUrl3 != '') {
                                        await editEntryEntryRecord.reference
                                            .update(createEntryRecordData(
                                          video: _model.uploadedFileUrl3,
                                        ));
                                      }
                                      if (_model.locationupdated!) {
                                        await editEntryEntryRecord.reference
                                            .update(createEntryRecordData(
                                          mapLocation:
                                              _model.placePickerValue.latLng,
                                        ));
                                      }

                                      await editEntryEntryRecord.reference
                                          .update(createEntryRecordData(
                                        creationName:
                                            _model.newTitleController.text,
                                        description: _model
                                            .newDescriptionController.text,
                                        recipe:
                                            _model.newRecipieController.text,
                                        tags: editEntryEntryRecord.tags,
                                        ingredients: _model
                                            .newIngredientsController.text,
                                        satisfactionLvl: _model.newSatLvlValue,
                                        hungerLvl: _model.newHungerLvlValue,
                                        comfortLvl: _model.newComfortLvlValue,
                                        conveniencLvl: _model.newConvLvlValue,
                                        overallLvl: _model.newOverallLvlValue,
                                        locationNote:
                                            _model.textController6.text,
                                        audio: _model.audionote,
                                      ));

                                      context.pushNamed('CollectionPage');
                                    },
                                    child: Icon(
                                      Icons.check,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 40.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 4.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 42.0,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 95.0, 0.0, 10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Title',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: TextFormField(
                                  controller: _model.newTitleController ??=
                                      TextEditingController(
                                    text: editEntryEntryRecord.creationName,
                                  ),
                                  focusNode: _model.newTitleFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Give a Title to your Creation',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model.newTitleControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Describe your Creation',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.newDescriptionController ??=
                                          TextEditingController(
                                    text: editEntryEntryRecord.description,
                                  ),
                                  focusNode: _model.newDescriptionFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Add a Description',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model
                                      .newDescriptionControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: TextFormField(
                                  controller: _model.newRecipieController ??=
                                      TextEditingController(
                                    text: editEntryEntryRecord.recipe,
                                  ),
                                  focusNode: _model.newRecipieFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Add a Recipe',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model
                                      .newRecipieControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.newIngredientsController ??=
                                          TextEditingController(
                                    text: editEntryEntryRecord.ingredients,
                                  ),
                                  focusNode: _model.newIngredientsFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Add the Ingredients',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model
                                      .newIngredientsControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: TextFormField(
                                  controller: _model.newTagsController ??=
                                      TextEditingController(
                                    text: editEntryEntryRecord.tags,
                                  ),
                                  focusNode: _model.newTagsFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Add tags ',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                    alignLabelWithHint: false,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    contentPadding: const EdgeInsets.all(15.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  minLines: 1,
                                  validator: _model.newTagsControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Rate your Creation',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Satisfaction Level ',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'How satisfied where you when eating this creation?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                              Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.newSatLvlValue ??=
                                    editEntryEntryRecord.satisfactionLvl,
                                label: _model.newSatLvlValue.toString(),
                                divisions: 100,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(
                                      () => _model.newSatLvlValue = newValue);
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Hunger Lever',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'How hungry where you when eating this creation?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                              Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.newHungerLvlValue ??=
                                    editEntryEntryRecord.hungerLvl,
                                label: _model.newHungerLvlValue.toString(),
                                divisions: 100,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(() =>
                                      _model.newHungerLvlValue = newValue);
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Comfort Level ',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'How comfortable where you when eating this creation?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                              Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.newComfortLvlValue ??=
                                    editEntryEntryRecord.comfortLvl,
                                label: _model.newComfortLvlValue.toString(),
                                divisions: 100,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(() =>
                                      _model.newComfortLvlValue = newValue);
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Convenience Level ',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'How convenient was to make this creation? ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                              Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.newConvLvlValue ??=
                                    editEntryEntryRecord.conveniencLvl,
                                label: _model.newConvLvlValue.toString(),
                                divisions: 100,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(
                                      () => _model.newConvLvlValue = newValue);
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Overall Rating ',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'How would you rate this creation overall? ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                              Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 10.0,
                                value: _model.newOverallLvlValue ??=
                                    editEntryEntryRecord.overallLvl,
                                label: _model.newOverallLvlValue.toString(),
                                divisions: 100,
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(2));
                                  setState(() =>
                                      _model.newOverallLvlValue = newValue);
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Add Media',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    editEntryEntryRecord.audio != ''
                                        ? 'Replace Audio Note'
                                        : 'Add Audio Note',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (_model.isRecording != 'True')
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  await requestPermission(
                                                      microphonePermission);
                                                  if (await getPermissionStatus(
                                                      microphonePermission)) {
                                                    _model.audioRecorder ??=
                                                        AudioRecorder();
                                                    if (await _model
                                                        .audioRecorder!
                                                        .hasPermission()) {
                                                      final String path;
                                                      final AudioEncoder
                                                          encoder;
                                                      if (kIsWeb) {
                                                        path = '';
                                                        encoder =
                                                            AudioEncoder.opus;
                                                      } else {
                                                        final dir =
                                                            await getApplicationDocumentsDirectory();
                                                        path =
                                                            '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
                                                        encoder =
                                                            AudioEncoder.aacLc;
                                                      }
                                                      await _model
                                                          .audioRecorder!
                                                          .start(
                                                        RecordConfig(
                                                            encoder: encoder),
                                                        path: path,
                                                      );
                                                    } else {
                                                      showSnackbar(
                                                        context,
                                                        'You have not provided permission to record audio.',
                                                      );
                                                    }

                                                    setState(() {
                                                      _model.isRecording =
                                                          'True';
                                                    });

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'totalexp': FieldValue
                                                              .increment(3.0),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Permission Needed'),
                                                          content: const Text(
                                                              'We need permision to use your microphone in order to record a voice memo!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                text: 'Start',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (_model.isRecording == 'True')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.audionote = await _model
                                                    .audioRecorder
                                                    ?.stop();
                                                if (_model.audionote != null) {
                                                  _model.audionoteFile =
                                                      FFUploadedFile(
                                                    name: 'audionote.mp3',
                                                    bytes: await XFile(
                                                            _model.audionote!)
                                                        .readAsBytes(),
                                                  );
                                                }

                                                setState(() {
                                                  _model.isRecording =
                                                      'Recorded';
                                                });

                                                setState(() {});
                                              },
                                              text: 'Stop',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (_model.isRecording == 'Recorded')
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: FlutterFlowAudioPlayer(
                                            audio: Audio.network(
                                              _model.audionote!,
                                              metas: Metas(
                                                id: 'sample3.mp3-7ca7413d',
                                                title: 'Audio Note',
                                              ),
                                            ),
                                            titleTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge,
                                            playbackDurationTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            playbackButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            elevation: 0.0,
                                            playInBackground: PlayInBackground
                                                .disabledRestoreOnForeground,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Add Image(s)',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: (_model.uploadedFileUrl1 != '')
                                            ? null
                                            : () async {
                                                await requestPermission(
                                                    photoLibraryPermission);
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading1 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading1 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile1 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl1 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  _model.uploadedImages =
                                                      'True';
                                                });
                                                setState(() {
                                                  _model.addToPhotosupload(
                                                      _model.uploadedFileUrl1);
                                                });

                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'totalexp':
                                                          FieldValue.increment(
                                                              2.0),
                                                    },
                                                  ),
                                                });
                                              },
                                        text: 'Add Image',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.uploadedFileUrl1 != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.add,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading2 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading2 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile2 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl2 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }

                                          setState(() {
                                            _model.addToPhotosupload(
                                                _model.uploadedFileUrl2);
                                          });
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              if (_model.photosupload.isNotEmpty)
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      'All images in the entry:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                              if (_model.photosupload.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(20.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final imagesuploaded =
                                            _model.photosupload.toList();
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 400.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              imagesuploaded
                                                                      .length -
                                                                  1)),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      imagesuploaded.length,
                                                  itemBuilder: (context,
                                                      imagesuploadedIndex) {
                                                    final imagesuploadedItem =
                                                        imagesuploaded[
                                                            imagesuploadedIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                imagesuploadedItem,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  imagesuploadedItem,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: imagesuploadedItem,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            imagesuploadedItem,
                                                            width: 300.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 16.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                imagesuploaded
                                                                        .length -
                                                                    1)),
                                                    count:
                                                        imagesuploaded.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    effect: smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 3.0,
                                                      spacing: 8.0,
                                                      radius: 16.0,
                                                      dotWidth: 16.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    editEntryEntryRecord.video != ''
                                        ? 'Replace Video'
                                        : 'Add Video',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await requestPermission(
                                          photoLibraryPermission);
                                      final selectedMedia = await selectMedia(
                                        isVideo: true,
                                        mediaSource: MediaSource.videoGallery,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile3 =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl3 =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }

                                      setState(() {
                                        _model.uploadedVideos = 'True';
                                      });

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'totalexp':
                                                FieldValue.increment(3.0),
                                          },
                                        ),
                                      });
                                    },
                                    text: editEntryEntryRecord.video != ''
                                        ? 'Replace Video'
                                        : 'Add Video',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              if ((_model.uploadedVideos == 'True') ||
                                  (editEntryEntryRecord.video != ''))
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: FlutterFlowVideoPlayer(
                                      path: _model.uploadedFileUrl3 != ''
                                          ? _model.uploadedFileUrl3
                                          : editEntryEntryRecord.video,
                                      videoType: VideoType.network,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      autoPlay: false,
                                      looping: true,
                                      showControls: true,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 5.0, 0.0, 15.0),
                                  child: Text(
                                    editEntryEntryRecord.mapLocation != null
                                        ? 'Uplate Location Note'
                                        : 'Add Location Note',
                                    style:
                                        FlutterFlowTheme.of(context).labelLarge,
                                  ),
                                ),
                              ),
                              if (!_model.locationupdated!)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        _model.locationupdated = true;
                                      });
                                    },
                                    text: editEntryEntryRecord.hasMapLocation()
                                        ? 'Update Location'
                                        : 'Add Location',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              if (_model.locationupdated ?? true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FlutterFlowPlacePicker(
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyCDqEkov1h1uc4PiDKfURvKkCRbZ7ivGbc',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyCDqEkov1h1uc4PiDKfURvKkCRbZ7ivGbc',
                                    webGoogleMapsApiKey:
                                        'AIzaSyCDqEkov1h1uc4PiDKfURvKkCRbZ7ivGbc',
                                    onSelect: (place) async {
                                      setState(() =>
                                          _model.placePickerValue = place);
                                    },
                                    defaultText: 'Select Location',
                                    icon: Icon(
                                      Icons.place,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 16.0,
                                    ),
                                    buttonOptions: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      height: 40.0,
                                      color: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController6 ??=
                                              TextEditingController(
                                            text: editEntryEntryRecord
                                                .locationNote,
                                          ),
                                          focusNode: _model.textFieldFocusNode,
                                          onFieldSubmitted: (_) async {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'totalexp':
                                                      FieldValue.increment(2.0),
                                                },
                                              ),
                                            });
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                'Add location Description',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                            alignLabelWithHint: false,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            contentPadding:
                                                const EdgeInsets.all(15.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          textAlign: TextAlign.start,
                                          maxLines: 10,
                                          minLines: 1,
                                          validator: _model
                                              .textController6Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Delete entry',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: DeleteEntryCardWidget(
                                              deletedocc: editEntryEntryRecord,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'Delete ',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
