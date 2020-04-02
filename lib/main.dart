import 'package:flutter/widgets.dart';

import 'colors.dart';

import 'list.dart';
import 'details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        Route generate(RouteSettings settings) {
            Route page;
            switch(settings.name) {
                case "/":
                    page = new PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                            return APList();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                                opacity: animation,
                                child: FadeTransition(
                                    opacity: Tween<double>(begin: 1, end: 0).animate(secondaryAnimation),
                                    child: child,
                                ),
                            );
                        }
                    );
                    break;
                case "/details":
                    final String url = settings.arguments;
                    page = new PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                            return APDetails(url: url);
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                                opacity: animation,
                                child: FadeTransition(
                                    opacity: Tween<double>(begin: 1, end: 0).animate(secondaryAnimation),
                                    child: child,
                                ),
                            );
                        }
                    );
                    break;
            }
            return page;
        }

        return WidgetsApp(
            onGenerateRoute: generate,
            textStyle: TextStyle(
                color: Colors.black
            ),
            initialRoute: "/",
            color: Colors.red
        );
    }
}