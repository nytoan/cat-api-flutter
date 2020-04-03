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

        setState(() {
            futureCats = Service.shared.fetch();          
        });
    }

    @override
    Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: FutureBuilder<List<Cat>>(
            future: futureCats,
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                    return Column(children: <Widget>[
                        Flexible(
                            child: CatList(cats: snapshot.data),
                        )
                    ],);
                } else {
                    return Center(child: Text("Loading cats..."),);
                }
            }
        )
    );
  }
}
