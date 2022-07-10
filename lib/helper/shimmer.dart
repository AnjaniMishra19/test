import 'package:flutter/material.dart';
import 'package:sahash/helper/shimmer_widget.dart';
import 'package:sahash/routes/route_name.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingEffect extends StatefulWidget {
  const ShimmerLoadingEffect({Key key}) : super(key: key);

  @override
  State<ShimmerLoadingEffect> createState() => _ShimmerLoadingEffectState();
}

class _ShimmerLoadingEffectState extends State<ShimmerLoadingEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Loading Effect"),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.dashboard);
            },
            icon: Image.asset('assets/icon_arrow_back.png'),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[400],
            highlightColor: Colors.grey[300],
            child: const ListTile(
              title: ShimmerWidget.rectangular(height: 16),
              subtitle: ShimmerWidget.rectangular(height: 14),
              leading: ShimmerWidget.rectangular(width: 64, height: 64),
            ),
          );
        },
      ),
    );
  }
}
