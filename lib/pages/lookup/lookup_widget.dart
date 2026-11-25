import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_styled_border.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lookup_model.dart';
export 'lookup_model.dart';

class LookupWidget extends StatefulWidget {
  const LookupWidget({
    super.key,
    required this.idMeal,
  });

  /// The ID of the meal to display
  final String? idMeal;

  static String routeName = 'Lookup';
  static String routePath = '/lookup';

  @override
  State<LookupWidget> createState() => _LookupWidgetState();
}

class _LookupWidgetState extends State<LookupWidget> {
  late LookupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LookupModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: RecipeLookupCall.call(
        recipeId: widget.idMeal,
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
        final lookupRecipeLookupResponse = snapshot.data!;

        return YoutubeFullScreenWrapper(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border(
                          right: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          bottom: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          left: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          RecipeLookupCall.image(
                            lookupRecipeLookupResponse.jsonBody,
                          ),
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPRsnVyex_F-zR33Xenq4gh0c0_ST5RXpUvJsRDld92g&s=10',
                        ),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(),
                        border: FlutterFlowStyledBorder(
                          side: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          style: FlutterFlowDashStyle.dashed,
                          dashLength: 6.0,
                          dashGap: 4.0,
                          showTop: false,
                          showRight: false,
                          showLeft: false,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.start).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    RecipeLookupCall.name(
                                      lookupRecipeLookupResponse.jsonBody,
                                    ),
                                    'MealName',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState()
                                            .FavoriteMeals1
                                            .contains(FavoriteMealsStruct(
                                              idMeal: RecipeLookupCall.id(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strMeal: RecipeLookupCall.name(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strMealThumb:
                                                  RecipeLookupCall.image(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strCategory:
                                                  RecipeLookupCall.category(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strArea: RecipeLookupCall.area(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                            )) ==
                                        false)
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 50.0,
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 34.0,
                                        ),
                                        onPressed: () async {
                                          FFAppState().addToFavoriteMeals1(
                                              FavoriteMealsStruct(
                                            idMeal: RecipeLookupCall.id(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strMeal: RecipeLookupCall.name(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strMealThumb:
                                                RecipeLookupCall.image(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strCategory:
                                                RecipeLookupCall.category(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strArea: RecipeLookupCall.area(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                          ));
                                          safeSetState(() {});
                                        },
                                      ),
                                    if (FFAppState()
                                            .FavoriteMeals1
                                            .contains(FavoriteMealsStruct(
                                              idMeal: RecipeLookupCall.id(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strMeal: RecipeLookupCall.name(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strMealThumb:
                                                  RecipeLookupCall.image(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strCategory:
                                                  RecipeLookupCall.category(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              strArea: RecipeLookupCall.area(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                            )) ==
                                        true)
                                      FlutterFlowIconButton(
                                        buttonSize: 50.0,
                                        icon: Icon(
                                          Icons.favorite,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 34.0,
                                        ),
                                        onPressed: () async {
                                          FFAppState().removeFromFavoriteMeals1(
                                              FavoriteMealsStruct(
                                            idMeal: RecipeLookupCall.id(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strMeal: RecipeLookupCall.name(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strMealThumb:
                                                RecipeLookupCall.image(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strCategory:
                                                RecipeLookupCall.category(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                            strArea: RecipeLookupCall.area(
                                              lookupRecipeLookupResponse
                                                  .jsonBody,
                                            ),
                                          ));
                                          safeSetState(() {});
                                        },
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Area:',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      RecipeLookupCall.area(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ),
                                      'Mysterious area',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country:',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      RecipeLookupCall.country(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ),
                                      'Lost country',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'category: ',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      RecipeLookupCall.category(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ),
                                      'Category ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 15.0, 10.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(50.0),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 25.0, 25.0, 25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Ingredient\'s ',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                              if (RecipeLookupCall.in1(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in1(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue1 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue1 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in1(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'In1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms1(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'ms1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in2(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in2(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in2(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in2(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue2 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue2 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in2(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'in2',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms2(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS2',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in3(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in3(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in3(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in3(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue3 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue3 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in3(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'in3',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms3(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'ms3',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in4(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in4(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in4(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in4(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue4 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue4 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in4(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'in4',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms4(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'ms4',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in5(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in5(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in5(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in5(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue5 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue5 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in5(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'in5',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms5(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'ms5',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in6(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in6(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in6(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in6(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue6 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue6 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in6(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'in6',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms6(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS6',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in7(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in7(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in7(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in7(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue7 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue7 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in7(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN7',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms7(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS7',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in8(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in8(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in8(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in8(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue8 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue8 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in8(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN8',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms8(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS8',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in9(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in9(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in9(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in9(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue9 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue9 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in9(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN9',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms9(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS9',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in10(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in10(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in10(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in10(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue10 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue10 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in10(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN10',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms10(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS10',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in11(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in11(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in11(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in11(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue11 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue11 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in11(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN11',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms11(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS11',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in12(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in12(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in12(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in12(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue12 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue12 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in12(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN12',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms12(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS12',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in13(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in13(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in13(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in13(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue13 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue13 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in13(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN13',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms13(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS13',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in14(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in14(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in14(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in14(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue14 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue14 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in14(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN14',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms14(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS14',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in15(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in15(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in15(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in15(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue15 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue15 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in15(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN15',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms15(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS15',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in16(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in16(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in16(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in16(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue16 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue16 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in16(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN16',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms16(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS16',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in17(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in17(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in17(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in17(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue17 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue17 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in17(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN17',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms17(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS17',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in18(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in18(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in18(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in18(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue18 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue18 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in18(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN18',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms18(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS18',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              if (RecipeLookupCall.in19(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in19(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                StyledDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  lineStyle: DividerLineStyle.dashed,
                                ),
                              if (RecipeLookupCall.in19(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      null &&
                                  RecipeLookupCall.in19(
                                        lookupRecipeLookupResponse.jsonBody,
                                      ) !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue19 ??= false,
                                        onChanged: (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue19 = newValue!);
                                        },
                                        side: (FlutterFlowTheme.of(context)
                                                    .primary !=
                                                null)
                                            ? BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              )
                                            : null,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.in19(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'IN19',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              RecipeLookupCall.ms19(
                                                lookupRecipeLookupResponse
                                                    .jsonBody,
                                              ),
                                              'MS19',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 15.0, 25.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Instructions ',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 20.0)),
                                  ),
                                ],
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        RecipeLookupCall.instructions(
                                          lookupRecipeLookupResponse.jsonBody,
                                        ),
                                        'Instructions ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.6,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.7,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.6,
                                      ),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                    ),
                    if (RecipeLookupCall.youtube(
                              lookupRecipeLookupResponse.jsonBody,
                            ) !=
                            null &&
                        RecipeLookupCall.youtube(
                              lookupRecipeLookupResponse.jsonBody,
                            ) !=
                            '')
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: FlutterFlowYoutubePlayer(
                              url: RecipeLookupCall.youtube(
                                lookupRecipeLookupResponse.jsonBody,
                              )!,
                              height: 250.0,
                              autoPlay: false,
                              looping: true,
                              mute: true,
                              showControls: true,
                              showFullScreen: true,
                              strictRelatedVideos: true,
                            ),
                          ),
                        ),
                      ),
                    if (RecipeLookupCall.source(
                              lookupRecipeLookupResponse.jsonBody,
                            ) !=
                            null &&
                        RecipeLookupCall.source(
                              lookupRecipeLookupResponse.jsonBody,
                            ) !=
                            '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 25.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Source ',
                            options: FFButtonOptions(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
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
