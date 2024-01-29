// import 'package:flutter/material.dart';
// import 'phone_auth.dart';
// import 'otp_get.dart';
//
// class Routes {
//   static const String mainSplash = "mainsplash";
//   static const String phoneScreen = "phonescreen";
//   static const String otpGet = "otpget";
//
//   static String currentRoute = "";
//
//   static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
//     currentRoute = routeSettings.name ?? "";
//
//     switch (routeSettings.name) {
//       case mainSplash:
//         {
//           return mainSplash.route(routeSettings);
//         }
//       case phonenoscreen:
//         {
//           return phonenoscreen.route(routeSettings);
//         }
//         case otpGet:
//         {
//           return phonenoscreen.route(routeSettings);
//         }
//
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:moviemate/pages/spalsh_Screen.dart';
// import 'phone_auth.dart';
// import 'otp_get.dart';
// import 'home_p.dart';
//
// class Routes {
//   static const String mainSplash = "mainsplash";
//   static const String phoneScreen = "phonescreen";
//   static const String otpGet = "otpget";
//   static const String Home_p = "home_p";
//
//   static String currentRoute = "";
//
//   static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
//     currentRoute = routeSettings.name ?? "";
//
//     switch (routeSettings.name) {
//       case mainSplash:
//         {
//           return SplashScreen.route(routeSettings); // Fixed typo and reference
//         }
//       case phoneScreen: // Fixed typo in the case statement
//         {
//           return phonenoscreen.route(routeSettings); // Fixed typo and reference
//         }
//       case otpGet:
//         {
//           return OtpGet.route(routeSettings); // Fixed reference
//         }
//       case Home_p:
//         {
//           return home_p.route(routeSettings); // Fixed reference
//         }
//       default:
//         {
//           // Handle unknown routes
//           return MaterialPageRoute(
//             builder: (context) => SplashScreen()
//           );
//         }
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:moviemate/pages/seat_selection.dart';
import 'package:moviemate/pages/spalsh_Screen.dart';
import 'package:moviemate/pages/discription.dart';
import 'package:moviemate/pages/theater.dart';
import 'package:moviemate/pages/transaction_succes.dart';
import 'phone_auth.dart';
import 'otp_get.dart';
import 'home_p.dart';

class Routes {
  static const String mainSplash = "mainsplash";
  static const String phoneScreen = "phonescreen";
  static const String otpGet = "otpget";
  static const String Home_p = "home_p";
  static const String discription = "discription";
  static const String theater = "theater";
  static const String seat_select = "seat_select";
  static const String creditCard = "credit_card";
  static const String successfull = "succesfull";

  static String currentRoute = "";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? "";

    switch (routeSettings.name) {
      case mainSplash:
        {
          return SplashScreen.route(routeSettings);
        }
      case phoneScreen: // Fixed typo in the case statement
        {
          return phonenoscreen.route(routeSettings);
        }
      case otpGet:
        {
          return OtpGet.route(routeSettings);
        }
      case Home_p:
        {
          return home_p.route(routeSettings);
        }
        case discription:
        {
          return Disc.route(routeSettings);
        }
        case theater:
        {
          return Theater.route(routeSettings);
        }
      case seat_select:
        {
          return Seatselect.route(routeSettings);
        }

        case successfull:
        {
          return TransectionSuccessfull.route(routeSettings);
        }
      default:
        {
          // Handle unknown routes
          return MaterialPageRoute(
              builder: (context) => SplashScreen()
          );
        }
    }
  }
}
