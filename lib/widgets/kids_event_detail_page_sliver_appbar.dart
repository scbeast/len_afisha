import 'package:flutter/material.dart';
import 'package:len_afisha/models/kids_event.dart';

class KidsEventDetailPageSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final KidsEvent kidsEvent;

  KidsEventDetailPageSliverAppBar(
      {@required this.expandedHeight, @required this.kidsEvent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          kidsEvent.posterUrl,
          fit: BoxFit.cover,
          color: Colors.black12,
          colorBlendMode: BlendMode.darken,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              kidsEvent.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.5 - shrinkOffset,
          left: 8,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                child: Image.network(kidsEvent.posterUrl),
              ),
            ),
          ),
        ),
        Positioned(
          top: 4.0,
          left: 3.0,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
