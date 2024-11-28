import 'package:flutter/material.dart';

class AppGlobals {
  AppGlobals._();

  static const appColor = Color(0xFFE02957);
  static const secondaryColor = Color(0xFF566681);
  static const tertiaryColor = Color(0xFF0FA3C3);
  static const backgroundColor = Color(0xFFEDF2F4);
  static const redColor = Color(0xFFEF233C);
  static const roseColor = Color(0xFFFAAFAF);
  static const whiteColor = Color(0xFFFFFFFF);
  static const lightColor = Color(0xFFEDF2F4);
  static const darkColor = Color(0xFF2B2D42);
  static const linkColor = Color(0xFF005F75);
  static const transparent = Color(0x00000000);

  static MaterialColor primarySwatch = MaterialColor(
    0xFFD90429,
    <int, Color>{
      50: appColor.withOpacity(.1),
      100: appColor.withOpacity(.2),
      200: appColor.withOpacity(.3),
      300: appColor.withOpacity(.4),
      400: appColor.withOpacity(.5),
      500: appColor.withOpacity(.6),
      600: appColor.withOpacity(.7),
      700: appColor.withOpacity(.8),
      800: appColor.withOpacity(.9),
      900: appColor.withOpacity(1),
    },
  );


  static const String fontName = 'Roboto';
  static const FontWeight ligth = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const double extendedAppbar = 65.0;
  static int count = 1;

  static const TextStyle h1 = TextStyle(
    fontFamily: fontName,
    fontWeight: ligth,
    fontSize: 96,
    letterSpacing: -1.5,
    color: darkColor,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontName,
    fontWeight: ligth,
    fontSize: 60,
    letterSpacing: -0.5,
    color: darkColor,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 48,
    letterSpacing: 0,
    color: darkColor,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 34,
    letterSpacing: 0.25,
    color: darkColor,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 24,
    letterSpacing: 0,
    color: darkColor,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: fontName,
    fontWeight: medium,
    fontSize: 20,
    letterSpacing: 0.15,
    color: darkColor,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 16,
    letterSpacing: 0.15,
    color: darkColor,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: fontName,
    fontWeight: medium,
    fontSize: 14,
    letterSpacing: 0.1,
    color: darkColor,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 16,
    letterSpacing: 0.5,
    color: darkColor,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 14,
    letterSpacing: 0.25,
    color: darkColor,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontName,
    fontWeight: medium,
    fontSize: 14,
    letterSpacing: 1.25,
    color: darkColor,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 12,
    letterSpacing: 0.4,
    color: darkColor,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontName,
    fontWeight: regular,
    fontSize: 10,
    letterSpacing: 1.5,
    color: darkColor,
  );

  static const BoxShadow boxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .08),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  static const BoxShadow redBoxShadow = BoxShadow(
    color: Color.fromRGBO(217, 5, 41, .25),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow backBoxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .25),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  static const BoxShadow appBarShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .16),
    blurRadius: 6,
    offset: Offset(0, -2),
  );

  ///Develop emails
  static const String emails =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,jlriquelme@acl.cl';
  static const String emailsPublic =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,jlriquelme@acl.cl';
  static const String emailsJob =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,jlriquelme@acl.cl';
  static const String emailsAcademy =
      'mgoncalves@acl.cl,acancio@acl.cl,agomez@acl.cl,jlriquelme@acl.cl';

  ///Prod emails
  static const String emailsProd = 'rrhh@acl.cl';
  static const String emailsPublicProd = 'info@acl.cl';
  static const String emailsJobProd = 'seleccion@acl.cl';
  static const String emailsAcademyProd = 'ventas@aclacademy.cl';

  ///notification firebase
  static const String notificationDev = 'notification_channel_dev';
  static const String notificationProd = 'notification_channel_prod';
  static const String categoryProd = 'categories';
  static const String benefitsProd = 'benefits';
  static const String benefitsDev = 'benefitsDev';
  static const String documentsDev = 'documentsDev';
  static const String documentsProd = 'documents';
  static const String newsProd = 'news';
  static const String surveyProd = 'surveys';
  static const String jobsProd = 'jobs';
  static const String jobsDev = 'jobsDev';
  static const String surveyDev = 'surveysDev';
  static const String newsDev = 'newsDev';
  static const String categoryDev = 'categoriesDev';
  static const String chatsDev = 'chatsDev';
  static const String chatsProd = 'chats';
  static const String eventsDev = 'eventsDev';
  static const String eventsRRHHDev = 'rrhh_chat_dev';
  static const String eventsProd = 'events';
  static const String eventsRRHHProd = 'rrhh_chat_prod';
  static const String usersDev = 'usersDev';
  static const String usersProd = 'users';
  static const String videosDev = 'videosDev';
  static const String videosProd = 'videos';
  static const String infoDev = 'infoDev';
  static const String infoProd = 'info';

  static const String docs = "46";
  static const String news = "47";
  static const String survey = "48";
}

class SolicitudeType {
  SolicitudeType._();
  static const String Generic = 'generic';
  static const String Vacation = 'vacation';
  static const String Benefit = 'benefit';
  static const String Comment = 'comment';
  static const String Courses = 'courses';
  static const String Bot = 'bot';
}
