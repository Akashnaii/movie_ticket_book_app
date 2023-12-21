import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
class disc extends StatefulWidget {
  const disc({super.key});

  @override
  State<disc> createState() => _discState();
}

class _discState extends State<disc> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Image.network(
                  'https://bioofy.com/wp-content/uploads/2021/01/Animal-Movie.jpg',
                  width: double.infinity,
                  height: 244,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Align(
            //   alignment: AlignmentDirectional(-1, 0),
            //   child: RatingBar.builder(
            //     onRatingUpdate: (newValue) =>
            //         setState(() => _model.ratingBarValue = newValue),
            //     itemBuilder: (context, index) => Icon(
            //       Icons.star_rounded,
            //       color: FlutterFlowTheme.of(context).tertiary,
            //     ),
            //     direction: Axis.horizontal,
            //     unratedColor: FlutterFlowTheme.of(context).accent3,
            //     itemCount: 5,
            //     itemSize: 20,
            //     glowColor: FlutterFlowTheme.of(context).tertiary,
            //   ),
            // ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Animal : action movie ',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, -1),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                child: Text(
                  'Discription',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                child: Text(
                  'Cast',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto Mono',
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: ListView(
                    padding: EdgeInsets.fromLTRB(
                      4,
                      0,
                      4,
                      0,
                    ),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/327/600',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 20)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 220),
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: FFButtonWidget(
                onPressed: () {},
                text: 'Book Ticket',
                options: FFButtonOptions(
                  width: 350,
                  height: 47,
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    letterSpacing: 5,
                  ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 30,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

