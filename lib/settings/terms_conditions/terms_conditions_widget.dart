import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'terms_conditions_model.dart';
export 'terms_conditions_model.dart';

class TermsConditionsWidget extends StatefulWidget {
  const TermsConditionsWidget({super.key});

  @override
  State<TermsConditionsWidget> createState() => _TermsConditionsWidgetState();
}

class _TermsConditionsWidgetState extends State<TermsConditionsWidget> {
  late TermsConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsConditionsModel());
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
                  alignment: const AlignmentDirectional(0.0, -1.0),
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
                            'Terms & Conditions',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 20.0, 15.0, 0.0),
                          child: Text(
                            'Terms and Conditions\nThese terms and conditions ("Terms") govern your use of TasteMinder, including all associated websites, applications, and services (collectively referred to as the "App"). By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the App.\n\n1. Acceptance of Terms\n1.1. You agree to comply with these Terms and all applicable laws and regulations.\n1.2. We reserve the right to modify, suspend, or terminate the App or these Terms at any time without notice.\n\n2. User Accounts\n2.1. You may need to create an account to use certain features of the App. You are responsible for maintaining the confidentiality of your account information.\n2.2. You must provide accurate and complete information when creating an account.\n2.3. You are solely responsible for all activities that occur under your account.\n\n3. Content\n3.1. You retain ownership of any content you submit to the App.\n3.2. By submitting content, you grant TasteMinder a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such content.\n3.3. You agree not to submit content that violates any applicable laws or infringes on the rights of others.\n\n4. Privacy\n4.1. Our Privacy Policy outlines how we collect, use, and protect your personal information. By using the App, you consent to our Privacy Policy.\n\n\n5. Prohibited Activities\n5.1. You agree not to engage in any activity that may:\na) Violate any laws, regulations, or third-party rights.\nb) Interfere with the proper functioning of the App.\nc) Circumvent or manipulate the security features of the App.\n\n6. Intellectual Property\n6.1. The App and its content are protected by intellectual property laws. You agree not to reproduce, distribute, modify, or create derivative works without our prior written consent.\n\n7. Termination\n7.1. We reserve the right to terminate or suspend your account and access to the App at our sole discretion.\n\n8. Limitation of Liability\n8.1. TasteMinder is not liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use of the App.\n\n9. Governing Law\n9.1. These Terms are governed by and construed in accordance with the laws of our Jurisdiction.\n\n10. Contact Information\n10.1. For questions or concerns regarding these Terms, please contact us at Instagram.\n',
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
