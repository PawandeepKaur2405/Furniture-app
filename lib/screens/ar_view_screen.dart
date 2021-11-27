import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArViewScreen extends StatefulWidget {
  String itemImg;
  ArViewScreen(this.itemImg);

  @override
  State<ArViewScreen> createState() => _ArViewScreenState();
}

class _ArViewScreenState extends State<ArViewScreen> {
  ArCoreController arCoreController;
  void WhenArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }

  void controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;
    addItemImageToScene(hit);
  }

  void addItemImageToScene(ArCoreHitTestResult hitTestResult) async {
    final bytes = (await rootBundle.load(widget.itemImg)).buffer.asUint8List();
    final imageItem = ArCoreNode(
        image: ArCoreImage(
          bytes: bytes,
          width: 600,
          height: 400,
        ),
        position:
            hitTestResult.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
        rotation:
            hitTestResult.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0));
    arCoreController.addArCoreNodeWithAnchor(imageItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: WhenArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}