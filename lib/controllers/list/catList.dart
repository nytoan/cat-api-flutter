import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

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
        return ListView.builder(
            itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("/details", arguments: widget.cats[index].url),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: CachedNetworkImage(imageUrl: widget.cats[index].url)
                    )
                );
            }, 
            itemCount: widget.cats.length
        );
    }
}