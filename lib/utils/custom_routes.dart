import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute {
  CustomRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if(settings.name == '/'){
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
    Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ){
    //  if(route.settings.name == '/'){
    //   return child;
    // }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
