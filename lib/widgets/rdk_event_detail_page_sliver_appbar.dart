import 'package:flutter/material.dart';
import 'package:len_afisha/models/rdk_event.dart';

class RdkEventDetailPageSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final RdkEvent rdkEvent;

  RdkEventDetailPageSliverAppBar(
      {@required this.expandedHeight, @required this.rdkEvent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          rdkEvent.posterUrl,
          fit: BoxFit.cover,
          color: Colors.black12,
          colorBlendMode: BlendMode.darken,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              rdkEvent.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.5- shrinkOffset,
          left: 8,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                child: Image.network(rdkEvent.posterUrl),
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
