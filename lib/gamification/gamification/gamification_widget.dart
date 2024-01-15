import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'gamification_model.dart';
export 'gamification_model.dart';

class GamificationWidget extends StatefulWidget {
  const GamificationWidget({super.key});

  @override
  _GamificationWidgetState createState() => _GamificationWidgetState();
}

class _GamificationWidgetState extends State<GamificationWidget> {
  late GamificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamificationModel());
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
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
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
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Text(
                            'Quests and Levels',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 10.0),
                            child: Text(
                              ' Current Level:',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Levels');
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                        FFAppConstants.lvl1) {
                                      return const Color(0xFFAE9E8C);
                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl1) &&
                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                            FFAppConstants.lvl2)) {
                                      return const Color(0xFFE98B3C);
                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl2) &&
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
                                      return FlutterFlowTheme.of(context).error;
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Level',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              () {
                                                if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl1) {
                                                  return '0';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl1) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl2)) {
                                                  return '1';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl2) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl3)) {
                                                  return '2';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl3) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl4)) {
                                                  return '3';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl4) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl5)) {
                                                  return '4';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl5) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl6)) {
                                                  return '5';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl6) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl7)) {
                                                  return '6';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl7) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl8)) {
                                                  return '7';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl8) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl9)) {
                                                  return '8';
                                                } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                        FFAppConstants.lvl9) &&
                                                    (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl10)) {
                                                  return '9';
                                                } else if (valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl10) {
                                                  return '10';
                                                } else {
                                                  return 'error';
                                                }
                                              }(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          () {
                                            if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                FFAppConstants.lvl1) {
                                              return 'Beginner Foodie';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl1) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl2)) {
                                              return 'Novice Nibbler';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl2) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl3)) {
                                              return 'Flavor Explorer';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl3) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl4)) {
                                              return 'Culinary Creator';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl4) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl5)) {
                                              return 'Gourmet Guru';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl5) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl6)) {
                                              return 'Taste Trailblazer';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl6) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl7)) {
                                              return 'Kitchen Connoisseur';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl7) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl8)) {
                                              return 'Master of Morsels';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl8) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl9)) {
                                              return 'Epicurean Expert';
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl9) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl10)) {
                                              return 'Sensory Savant';
                                            } else if (valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                FFAppConstants.lvl10) {
                                              return 'Culinary Maestro';
                                            } else {
                                              return 'error';
                                            }
                                          }(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontWeight: FontWeight.w600,
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
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Progress :',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    () {
                                                      if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                          FFAppConstants.lvl1) {
                                                        return '0';
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl1) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl2)) {
                                                        return FFAppConstants
                                                            .lvl1
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl2) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl3)) {
                                                        return FFAppConstants
                                                            .lvl2
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl3) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl4)) {
                                                        return FFAppConstants
                                                            .lvl3
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl4) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl5)) {
                                                        return FFAppConstants
                                                            .lvl4
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl5) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl6)) {
                                                        return FFAppConstants
                                                            .lvl5
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl6) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl7)) {
                                                        return FFAppConstants
                                                            .lvl6
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl7) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl8)) {
                                                        return FFAppConstants
                                                            .lvl7
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl8) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl9)) {
                                                        return FFAppConstants
                                                            .lvl8
                                                            .toString();
                                                      } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                              FFAppConstants
                                                                  .lvl9) &&
                                                          (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                              FFAppConstants
                                                                  .lvl10)) {
                                                        return FFAppConstants
                                                            .lvl9
                                                            .toString();
                                                      } else if (valueOrDefault(
                                                              currentUserDocument?.totalexp,
                                                              0.0) >=
                                                          FFAppConstants.lvl10) {
                                                        return FFAppConstants
                                                            .lvl10
                                                            .toString();
                                                      } else {
                                                        return 'error';
                                                      }
                                                    }(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'XP',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  () {
                                                    if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                        FFAppConstants.lvl1) {
                                                      return FFAppConstants.lvl1
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl1) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl2)) {
                                                      return FFAppConstants.lvl2
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl2) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl3)) {
                                                      return FFAppConstants.lvl3
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl3) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl4)) {
                                                      return FFAppConstants.lvl4
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl4) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl5)) {
                                                      return FFAppConstants.lvl5
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl5) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl6)) {
                                                      return FFAppConstants.lvl6
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >= FFAppConstants.lvl6) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl7)) {
                                                      return FFAppConstants.lvl7
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                            FFAppConstants
                                                                .lvl7) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl8)) {
                                                      return FFAppConstants.lvl8
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                            FFAppConstants
                                                                .lvl8) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl9)) {
                                                      return FFAppConstants.lvl9
                                                          .toString();
                                                    } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                            FFAppConstants
                                                                .lvl9) &&
                                                        (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                            FFAppConstants
                                                                .lvl10)) {
                                                      return FFAppConstants
                                                          .lvl10
                                                          .toString();
                                                    } else if (valueOrDefault(
                                                            currentUserDocument?.totalexp,
                                                            0.0) >=
                                                        FFAppConstants.lvl10) {
                                                      return 'Infinity O.O';
                                                    } else {
                                                      return 'error';
                                                    }
                                                  }(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'XP',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            LinearPercentIndicator(
                                          percent: () {
                                            if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                FFAppConstants.lvl1) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      0,
                                                      FFAppConstants.lvl1)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl1) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl2)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl1,
                                                      FFAppConstants.lvl2)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl2) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl3)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl2,
                                                      FFAppConstants.lvl3)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl3) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl4)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl3,
                                                      FFAppConstants.lvl4)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl4) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl5)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl4,
                                                      FFAppConstants.lvl5)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl5) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl6)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl5,
                                                      FFAppConstants.lvl6)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl6) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl7)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl6,
                                                      FFAppConstants.lvl7)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl7) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl8)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl7,
                                                      FFAppConstants.lvl8)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl8) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl9)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl8,
                                                      FFAppConstants.lvl9)!;
                                            } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                    FFAppConstants.lvl9) &&
                                                (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                    FFAppConstants.lvl10)) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      FFAppConstants.lvl9,
                                                      FFAppConstants.lvl10)!;
                                            } else if (valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                FFAppConstants.lvl10) {
                                              return functions
                                                  .progressToNextLvl(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalexp,
                                                          0.0),
                                                      1000,
                                                      2000)!;
                                            } else {
                                              return 3.33;
                                            }
                                          }(),
                                          lineHeight: 30.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          center: Text(
                                            () {
                                              if (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                  FFAppConstants.lvl1) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        0,
                                                        FFAppConstants.lvl1)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl1) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl2)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl1,
                                                        FFAppConstants.lvl2)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl2) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl3)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl2,
                                                        FFAppConstants.lvl3)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl3) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl4)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl3,
                                                        FFAppConstants.lvl4)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl4) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl5)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl4,
                                                        FFAppConstants.lvl5)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl5) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl6)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl5,
                                                        FFAppConstants.lvl6)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl6) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl7)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl6,
                                                        FFAppConstants.lvl7)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl7) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl8)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl7,
                                                        FFAppConstants.lvl8)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl8) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl9)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl8,
                                                        FFAppConstants.lvl9)!;
                                              } else if ((valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                      FFAppConstants.lvl9) &&
                                                  (valueOrDefault(currentUserDocument?.totalexp, 0.0) <
                                                      FFAppConstants.lvl10)) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        FFAppConstants.lvl9,
                                                        FFAppConstants.lvl10)!;
                                              } else if (valueOrDefault(currentUserDocument?.totalexp, 0.0) >=
                                                  FFAppConstants.lvl10) {
                                                return functions
                                                    .progressToNextLvl(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.totalexp,
                                                            0.0),
                                                        1000,
                                                        2000)!;
                                              } else {
                                                return 3.33;
                                              }
                                            }()
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 15.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'Total XP now: ${valueOrDefault(currentUserDocument?.totalexp, 0.0).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Ways to Earn XP: ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.17, -0.09),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 12.0, 15.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'New Collection Entry:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          '5 XP',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add photo(s) to an Entry:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          '2 XP',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add Location Mark to an Entry:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          '2 XP',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add Video to an Entry:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          '3 XP',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add Audio Note to an Entry:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 15.0, 0.0),
                                        child: Text(
                                          '3 XP',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Extra Challenges: ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Have 40 Entries with photos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Reward:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '80 XP',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            LinearPercentIndicator(
                                          percent: functions.progressToNextLvl(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.totalimages,
                                                      0)
                                                  .toDouble(),
                                              0,
                                              40)!,
                                          lineHeight: 20.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: const Color(0xFFC2632C),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          center: Text(
                                            valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalimages,
                                                        0) <
                                                    40
                                                ? valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalimages,
                                                        0)
                                                    .toString()
                                                : 'Completed!',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Have 20 Entries with videos',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Reward:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '60 XP',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            LinearPercentIndicator(
                                          percent: functions.progressToNextLvl(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.totalvideos,
                                                      0)
                                                  .toDouble(),
                                              0,
                                              20)!,
                                          lineHeight: 20.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: const Color(0xFFC2632C),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          center: Text(
                                            valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalvideos,
                                                        0) <
                                                    20
                                                ? valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalaudio,
                                                        0)
                                                    .toString()
                                                : 'Completed!',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Add 30 Entries with audio',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Reward:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '40 XP',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) =>
                                            LinearPercentIndicator(
                                          percent: functions.progressToNextLvl(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.totalaudio,
                                                      0)
                                                  .toDouble(),
                                              0,
                                              30)!,
                                          lineHeight: 20.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: const Color(0xFFC2632C),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          center: Text(
                                            valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalaudio,
                                                        0) <
                                                    30
                                                ? valueOrDefault(
                                                        currentUserDocument
                                                            ?.totalaudio,
                                                        0)
                                                    .toString()
                                                : 'Completed!',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
