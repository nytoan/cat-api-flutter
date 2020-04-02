import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import '../../model/cat.dart';
import '../../colors.dart';

class APDetails extends StatefulWidget {
    APDetails({ this.cat });

    final Cat cat;

    @override
    State<StatefulWidget> createState() {
        return _APDetails();
    }
}

class _APDetails extends State<APDetails> {
    @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Container(
                    height: 84,
                    color: Colors.white,
                    child: Column(children: <Widget>[
                        Spacer(),
                        Row(children: <Widget>[
                            Container(padding: EdgeInsets.all(10), child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Text("< Back"),
                            )),
                            Spacer(),
                        ],)
                    ],)
                ),
                CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                    imageUrl: widget.cat.url
                )
            ],
        )
    );
  }
}
