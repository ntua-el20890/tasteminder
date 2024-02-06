import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.totalimages, 0) >= 40) {
        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'totalexp': FieldValue.increment(80.0),
            },
          ),
        });
      } else if (valueOrDefault(currentUserDocument?.totalvideos, 0) >= 20) {
        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'totalexp': FieldValue.increment(60.0),
            },
          ),
        });
      } else if (valueOrDefault(currentUserDocument?.totalaudio, 0) >= 30) {
        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'totalexp': FieldValue.increment(40.0),
            },
          ),
        });
      }
    });
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

    return StreamBuilder<List<EntryRecord>>(
      stream: queryEntryRecord(
        parent: currentUserReference,
        limit: 1,
      ),
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
        List<EntryRecord> profilePageEntryRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.35,
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            valueOrDefault(
                                                            currentUserDocument
                                                                ?.coverPhotoUrl,
                                                            '') ==
                                                        ''
                                                ? random_data.randomImageUrl(
                                                    0,
                                                    0,
                                                  )
                                                : valueOrDefault(
                                                    currentUserDocument
                                                        ?.coverPhotoUrl,
                                                    ''),
                                            fit: BoxFit.contain,
                                            alignment: const Alignment(0.0, 0.0),
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault(
                                                          currentUserDocument
                                                              ?.coverPhotoUrl,
                                                          '') ==
                                                      ''
                                              ? random_data.randomImageUrl(
                                                  0,
                                                  0,
                                                )
                                              : valueOrDefault(
                                                  currentUserDocument
                                                      ?.coverPhotoUrl,
                                                  ''),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault(
                                                    currentUserDocument
                                                        ?.coverPhotoUrl,
                                                    '') ==
                                                ''
                                        ? random_data.randomImageUrl(
                                            0,
                                            0,
                                          )
                                        : valueOrDefault(
                                            currentUserDocument?.coverPhotoUrl,
                                            ''),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        valueOrDefault(
                                                        currentUserDocument
                                                            ?.coverPhotoUrl,
                                                        '') ==
                                                    ''
                                            ? random_data.randomImageUrl(
                                                0,
                                                0,
                                              )
                                            : valueOrDefault(
                                                currentUserDocument
                                                    ?.coverPhotoUrl,
                                                ''),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.9, 0.65),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      FlutterFlowTheme.of(context).primary,
                                      FlutterFlowTheme.of(context).secondary
                                    ],
                                    stops: const [0.0, 1.0],
                                    begin: const AlignmentDirectional(0.0, -1.0),
                                    end: const AlignmentDirectional(0, 1.0),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                currentUserPhoto == ''
                                                    ? random_data
                                                        .randomImageUrl(
                                                        0,
                                                        0,
                                                      )
                                                    : currentUserPhoto,
                                                '0',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: valueOrDefault<String>(
                                              currentUserPhoto == ''
                                                  ? random_data.randomImageUrl(
                                                      0,
                                                      0,
                                                    )
                                                  : currentUserPhoto,
                                              '0',
                                            ),
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: valueOrDefault<String>(
                                        currentUserPhoto == ''
                                            ? random_data.randomImageUrl(
                                                0,
                                                0,
                                              )
                                            : currentUserPhoto,
                                        '0',
                                      ),
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width: 140.0,
                                        height: 140.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            currentUserPhoto == ''
                                                ? random_data.randomImageUrl(
                                                    0,
                                                    0,
                                                  )
                                                : currentUserPhoto,
                                            '0',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.89, 0.7),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          currentUserDisplayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.96, -0.83),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 15.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Settings');
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    shape: const CircleBorder(),
                                    child: Container(
                                      width: 56.0,
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.89, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 5.0, 15.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.95,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 8.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                                          currentUserDocument
                                                              ?.bio,
                                                          '') !=
                                                      ''
                                              ? valueOrDefault(
                                                  currentUserDocument?.bio, '')
                                              : 'Add a Profile Description.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.95,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Number of Creations:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: FutureBuilder<int>(
                                          future: queryEntryRecordCount(
                                            parent: currentUserReference,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            int textCount = snapshot.data!;
                                            return Text(
                                              textCount.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (profilePageEntryRecordList.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 20.0, 15.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.95,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Visibility(
                                      visible:
                                          profilePageEntryRecordList.isNotEmpty,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Highest Rated Creation: ${profilePageEntryRecordList.first.creationName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Gamification');
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                              FFAppConstants.lvl1) {
                                            return const Color(0xFFAE9E8C);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl1) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl2)) {
                                            return const Color(0xFFE98B3C);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl2) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl3)) {
                                            return const Color(0xFFFCB001);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl3) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl4)) {
                                            return const Color(0xFFFFFF00);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl4) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl5)) {
                                            return const Color(0xFF87D623);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl5) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl6)) {
                                            return const Color(0xFF23D660);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl6) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl7)) {
                                            return const Color(0xFF72BBB8);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl7) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl8)) {
                                            return const Color(0xFF51D0F9);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl8) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl9)) {
                                            return const Color(0xFF3651D3);
                                          } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl9) &&
                                              (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl10)) {
                                            return const Color(0xFF8F00FF);
                                          } else if (valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                              FFAppConstants.lvl10) {
                                            return const Color(0xFFFF00B8);
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .error;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Level',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    () {
                                                      if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants.lvl1) {
                                                        return '0';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl1) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl2)) {
                                                        return '1';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl2) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl3)) {
                                                        return '2';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl3) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl4)) {
                                                        return '3';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl4) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl5)) {
                                                        return '4';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl5) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl6)) {
                                                        return '5';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl6) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl7)) {
                                                        return '6';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl7) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl8)) {
                                                        return '7';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl8) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl9)) {
                                                        return '8';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl9) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl10)) {
                                                        return '9';
                                                      } else if (valueOrDefault(
                                                              currentUserDocument?.totalexp,
                                                              0.0) >=
                                                          FFAppConstants.lvl10) {
                                                        return '10';
                                                      } else {
                                                        return 'error';
                                                      }
                                                    }(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: Text(
                                                () {
                                                  if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl1) {
                                                    return 'Beginner Foodie';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl1) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl2)) {
                                                    return 'Novice Nibbler';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl2) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl3)) {
                                                    return 'Flavor Explorer';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl3) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl4)) {
                                                    return 'Culinary Creator';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl4) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl5)) {
                                                    return 'Gourmet Guru';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                          FFAppConstants
                                                              .lvl5) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl6)) {
                                                    return 'Taste Trailblazer';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                          FFAppConstants
                                                              .lvl6) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl7)) {
                                                    return 'Kitchen Connoisseur';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                          FFAppConstants
                                                              .lvl7) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl8)) {
                                                    return 'Master of Morsels';
                                                  } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                          FFAppConstants
                                                              .lvl8) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl9)) {
                                                    return 'Epicurean Expert';
                                                  } else if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.totalexp,
                                                              0.0) >=
                                                          FFAppConstants
                                                              .lvl9) &&
                                                      (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants
                                                              .lvl10)) {
                                                    return 'Sensory Savant';
                                                  } else if (valueOrDefault(
                                                          currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl10) {
                                                    return 'Culinary Maestro';
                                                  } else {
                                                    return 'error';
                                                  }
                                                }(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('Gamification');
                                        },
                                        text: 'Level Progression & Quests',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.55,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 13.0,
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
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 15.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('Levels');
                                        },
                                        text: 'All Levels',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 13.0,
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
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
