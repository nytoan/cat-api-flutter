import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'services/service.dart';

import 'model/cat.dart';
import 'colors.dart';

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
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () => Navigator.of(context).pushNamed("/details", arguments: snapshot.data[index].url),
                                            child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: CachedNetworkImage(imageUrl: snapshot.data[index].url)
                                            )
                                        );
                                    },
                                    separatorBuilder: (context, index) {
                                        return Container(padding: EdgeInsets.all(1), color: Colors.lightGray,);
                                    }, 
                                    itemCount: snapshot.data.length
                                ),
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
