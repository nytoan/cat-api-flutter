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
        return GridView.count(
            crossAxisCount: 3,
            children: List.generate(widget.cats.length, (index) {
                return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("/details", arguments: widget.cats[index]),
                    child: Container(
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.cats[index].url
                        )
                    )
                );
            })
        );
    }
}