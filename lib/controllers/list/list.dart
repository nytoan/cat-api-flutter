import 'package:flutter/widgets.dart';

import '../../services/service.dart';

import '../../model/cat.dart';
import 'catList.dart';
import '../../colors.dart';

class APList extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _APList();
    }
}

class _APList extends State<APList> {
    
    Future<List<Cat>> futureCats;

    @override
    void initState() {
        super.initState();
        futureCats = Service.fetch();
    }

    @override
    Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
                FutureBuilder<List<Cat>>(
                    future: futureCats,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return Flexible(
                                child: CatList(cats: snapshot.data),
                            );
                        } else {
                            return Text("Oh oh");
                        }
                    }
                )
            ],
        )
    );
  }
}
