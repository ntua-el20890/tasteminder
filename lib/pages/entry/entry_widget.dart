import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({
    super.key,
    required this.entryRecieved,
  });

  final DocumentReference? entryRecieved;

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

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

    return StreamBuilder<EntryRecord>(
      stream: EntryRecord.getDocument(widget.entryRecieved!),
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
        final entryEntryRecord = snapshot.data!;
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final images = entryEntryRecord.image.toList();
                            return SizedBox(
                              width: double.infinity,
                              height: 220.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView.builder(
                                      controller: _model.pageViewController1 ??=
                                          PageController(
                                              initialPage:
                                                  min(0, images.length - 1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    entryEntryRecord
                                                            .image.isNotEmpty
                                                        ? imagesItem
                                                        : 'https://pm1.aminoapps.com/6493/523caa97f0e93e86a127b572547a5eeaacae0e77_hq.jpg',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: entryEntryRecord
                                                          .image.isNotEmpty
                                                      ? imagesItem
                                                      : 'https://pm1.aminoapps.com/6493/523caa97f0e93e86a127b572547a5eeaacae0e77_hq.jpg',
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: entryEntryRecord
                                                    .image.isNotEmpty
                                                ? imagesItem
                                                : 'https://pm1.aminoapps.com/6493/523caa97f0e93e86a127b572547a5eeaacae0e77_hq.jpg',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                entryEntryRecord
                                                        .image.isNotEmpty
                                                    ? imagesItem
                                                    : 'https://pm1.aminoapps.com/6493/523caa97f0e93e86a127b572547a5eeaacae0e77_hq.jpg',
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
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 55.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController1 ??=
                                            PageController(
                                                initialPage:
                                                    min(0, images.length - 1)),
                                        count: images.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController1!
                                              .animateToPage(
                                            i,
                                            duration:
                                                const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 3.0,
                                          spacing: 8.0,
                                          radius: 24.0,
                                          dotWidth: 16.0,
                                          dotHeight: 8.0,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 15.0, 0.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 40.0, 0.0, 0.0),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    entryEntryRecord.creationName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            if (entryEntryRecord.description != '')
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'Description',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.description != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        entryEntryRecord.description,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.recipe != '')
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Recipe',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.recipe != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Text(
                                        entryEntryRecord.recipe,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.ingredients != '')
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Ingredients',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.ingredients != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      entryEntryRecord.ingredients,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.tags != '')
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Tags',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.tags != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 5.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      entryEntryRecord.tags,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Satisfaction Level ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(3.47, 0.99),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 10.0,
                                      value: _model.sliderValue1 ??=
                                          entryEntryRecord.satisfactionLvl,
                                      label: _model.sliderValue1.toString(),
                                      divisions: 100,
                                      onChanged: (entryEntryRecord
                                                  .satisfactionLvl !=
                                              null)
                                          ? null
                                          : (newValue) {
                                              newValue = double.parse(newValue
                                                  .toStringAsFixed(6));
                                              setState(() => _model
                                                  .sliderValue1 = newValue);
                                            },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    entryEntryRecord.satisfactionLvl
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Hunger Level',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(3.47, 0.99),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 10.0,
                                      value: _model.sliderValue2 ??=
                                          entryEntryRecord.hungerLvl,
                                      label: _model.sliderValue2.toString(),
                                      divisions: 100,
                                      onChanged: (entryEntryRecord
                                                  .hungerLvl !=
                                              null)
                                          ? null
                                          : (newValue) {
                                              newValue = double.parse(newValue
                                                  .toStringAsFixed(6));
                                              setState(() => _model
                                                  .sliderValue2 = newValue);
                                            },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    entryEntryRecord.hungerLvl.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Comfort Level',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(3.47, 0.99),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 10.0,
                                      value: _model.sliderValue3 ??=
                                          entryEntryRecord.comfortLvl,
                                      label: _model.sliderValue3.toString(),
                                      divisions: 100,
                                      onChanged: (entryEntryRecord
                                                  .comfortLvl !=
                                              null)
                                          ? null
                                          : (newValue) {
                                              newValue = double.parse(newValue
                                                  .toStringAsFixed(6));
                                              setState(() => _model
                                                  .sliderValue3 = newValue);
                                            },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    entryEntryRecord.comfortLvl.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Convenience Level',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(3.47, 0.99),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 10.0,
                                      value: _model.sliderValue4 ??=
                                          entryEntryRecord.conveniencLvl,
                                      label: _model.sliderValue4.toString(),
                                      divisions: 100,
                                      onChanged: (entryEntryRecord
                                                  .conveniencLvl !=
                                              null)
                                          ? null
                                          : (newValue) {
                                              newValue = double.parse(newValue
                                                  .toStringAsFixed(6));
                                              setState(() => _model
                                                  .sliderValue4 = newValue);
                                            },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    entryEntryRecord.conveniencLvl.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Overall Rating',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(3.47, 0.99),
                                    child: Slider(
                                      activeColor:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      min: 0.0,
                                      max: 10.0,
                                      value: _model.sliderValue5 ??=
                                          entryEntryRecord.overallLvl,
                                      label: _model.sliderValue5.toString(),
                                      divisions: 100,
                                      onChanged: (entryEntryRecord
                                                  .overallLvl !=
                                              null)
                                          ? null
                                          : (newValue) {
                                              newValue = double.parse(newValue
                                                  .toStringAsFixed(6));
                                              setState(() => _model
                                                  .sliderValue5 = newValue);
                                            },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    entryEntryRecord.overallLvl.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            if (entryEntryRecord.audio != '')
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Audio Note',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (entryEntryRecord.audio != '')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: FlutterFlowAudioPlayer(
                                  audio: Audio.network(
                                    entryEntryRecord.audio,
                                    metas: Metas(
                                      id: 'sample3.mp3-6824082b',
                                      title: 'Audio Note',
                                    ),
                                  ),
                                  titleTextStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                  playbackDurationTextStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  playbackButtonColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  elevation: 3.0,
                                  playInBackground: PlayInBackground
                                      .disabledRestoreOnForeground,
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Map',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  'https://picsum.photos/seed/349/600',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (entryEntryRecord.video
                                .contains(entryEntryRecord.video.first))
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 15.0, 0.0, 15.0),
                                  child: Text(
                                    'Video',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 13.0,
                                        ),
                                  ),
                                ),
                              ),
                            Container(
                              height: 200.0,
                              decoration: const BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final videofromentry =
                                      entryEntryRecord.video.toList();
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 500.0,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 40.0),
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController2 ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        videofromentry.length -
                                                            1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: videofromentry.length,
                                            itemBuilder:
                                                (context, videofromentryIndex) {
                                              final videofromentryItem =
                                                  videofromentry[
                                                      videofromentryIndex];
                                              return Visibility(
                                                visible: entryEntryRecord.video
                                                    .contains(entryEntryRecord
                                                        .video.first),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 5.0),
                                                  child: FlutterFlowVideoPlayer(
                                                    path: videofromentryItem,
                                                    videoType:
                                                        VideoType.network,
                                                    autoPlay: false,
                                                    looping: true,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 16.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller:
                                                  _model.pageViewController2 ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              videofromentry
                                                                      .length -
                                                                  1)),
                                              count: videofromentry.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model
                                                    .pageViewController2!
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
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                activeDotColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                paintStyle: PaintingStyle.fill,
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
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Stack(
                          children: [
                            Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Share.share(
                                      'I wanted to share my Creation with you!',
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
