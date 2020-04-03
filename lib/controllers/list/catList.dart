import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactflutter/services/service.dart';
import 'package:flutter/widgets.dart';

import '../../colors.dart';
import '../../model/cat.dart';

class CatList extends StatefulWidget {
    CatList({ this.cats });

    final List<Cat> cats;

    @override
    State<StatefulWidget> createState() => _CatList();
}

class _CatList extends State<CatList> {
    @override
    Widget build(BuildContext context) {
        return NotificationListener(
            onNotification: (scrollInfo) {
                if(scrollInfo.metrics.extentAfter < 100) {
                    setState(() {
                        Service.shared.fetchMore();
                    });
                }
            },
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: List.generate(widget.cats.length, (index) {
                    return GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed("/details", arguments: widget.cats[index]),
                        child: Container(
                            color: Colors.gray,
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: widget.cats[index].url
                            )
                        )
                    );
                })
            )
        );
    }
}