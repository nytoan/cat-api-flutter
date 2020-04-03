import 'package:flutter/widgets.dart';

import 'colors.dart';

import 'controllers/list/list.dart';
import 'controllers/details/details.dart';

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
                            return child;
                        }
                    );
                    break;
                case "/details":
                    page = new PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                            return APDetails(cat: settings.arguments);
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeOutCubic));
                            return SlideTransition(
                                position: animation.drive(tween),
                                child: child
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