import 'package:flutter/material.dart';

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    Key key,
    this.dragKey,
    this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final String photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(opacity: 0.85, child: Image.asset(photoProvider)),
        ),
      ),
    );
  }
}
