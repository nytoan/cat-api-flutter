import 'package:flutter/widgets.dart';

import 'colors.dart';

class APDetails extends StatefulWidget {
    APDetails({ this.url });

    final String url;

    @override
    State<StatefulWidget> createState() {
        return _APDetails();
    }
}

class _APDetails extends State<APDetails> {
    @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Center(child: Text(widget.url),),
            GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text("< Back"),
            )
        ],)
    );
  }
}
