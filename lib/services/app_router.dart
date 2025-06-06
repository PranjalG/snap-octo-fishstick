import 'package:flutter/material.dart';
import 'package:layout/screens/colors_screen.dart';
import 'package:layout/screens/pagination/posts_overview_screen.dart';
import 'package:layout/screens/installation/installation_screen.dart';
import 'package:layout/screens/more_options.dart';
import 'package:layout/screens/responsive_design.dart';
import 'package:layout/screens/settings_screen.dart';
import 'package:layout/screens/installation/view_installation_screen.dart';
import 'package:layout/screens/to_do_list/to_do_list_page_screen.dart';
import 'package:layout/services/routes.dart';
import 'package:layout/screens/gallery/gallery_screen.dart';
import 'package:layout/screens/home_page/home_screen.dart';
import 'package:layout/screens/gallery/image_view_screen.dart';
import 'package:layout/screens/initial/login_screen.dart';
import 'package:layout/screens/initial/splash_screen.dart';

import '../screens/pagination/pagination_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteId.moreOptionsScreen:
        return MaterialPageRoute(
          builder: (_) => MoreOptions(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.galleryScreen:
        return MaterialPageRoute(
          builder: (_) => GalleryScreen(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.imageViewScreen:
        return MaterialPageRoute(
          builder: (_) => ImageViewScreen(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.paginationScreen:
        return MaterialPageRoute(
          builder: (_) => PaginationScreen(),
          settings: RouteSettings(arguments: routeSettings.arguments),
        );
      case RouteId.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: routeSettings,
        );
      case RouteId.installationScreen:
        return MaterialPageRoute(
          builder: (_) => InstallationDetailScreen(),
          settings: routeSettings,
        );
      case RouteId.postsOverviewScreen:
        return MaterialPageRoute(
          builder: (_) => PostsOverviewScreen(),
          settings: routeSettings,
        );
      case RouteId.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: routeSettings,
        );
      case RouteId.toDoListScreen:
        return MaterialPageRoute(
          builder: (_) => ToDoListPageScreen(),
          settings: routeSettings,
        );
      case RouteId.viewInstallationScreen:
        return MaterialPageRoute(
          builder: (_) => ViewInstallationScreen(),
          settings: routeSettings,
        );
      case RouteId.colorsScreen:
        return MaterialPageRoute(
          builder: (_) => ColorsScreen(),
          settings: routeSettings,
        );
      case RouteId.responsiveDesignScreen:
        return MaterialPageRoute(
          builder: (_) => ResponsiveDesign(),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
