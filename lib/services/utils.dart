import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;
import 'dart:async';
import '../widgets/loader/loading_provider.dart';


void showLoader(BuildContext context) {
// show the loader by setting it's state to true
  context.read<LoadingProvider>().setLoad(true);
}

void hideLoader(BuildContext context) {
// hide the loader by setting it's state to false
  context.read<LoadingProvider>().setLoad(false);
}


Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}

Future<ui.Image> getBytesFromNetworkUrl(String path, int width) async {
  var request = await http.get(Uri.parse(path));
  var bytes = request.bodyBytes;
  ui.Codec codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return fi.image;
}


Future<BitmapDescriptor> resizeAndCircle(String imageURL, int size) async {
  ui.Image imageFile = await getBytesFromNetworkUrl(imageURL, size);
  return _paintToCanvas(imageFile, Size.zero);
}

Future<BitmapDescriptor> _paintToCanvas(ui.Image image, Size size) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final paint = Paint();
  paint.isAntiAlias = true;

  _performCircleCrop(image, size, canvas);

  final recordedPicture = pictureRecorder.endRecording();
  ui.Image img = await recordedPicture.toImage(image.width, image.height);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();

  return BitmapDescriptor.fromBytes(buffer);
}

Canvas _performCircleCrop(ui.Image image, Size size, Canvas canvas) {
  Paint paint = Paint();
  canvas.drawCircle(Offset(0, 0), 0, paint);

  double drawImageWidth = 0;
  double drawImageHeight = 0;

  Path path = Path()
    ..addOval(Rect.fromLTWH(drawImageWidth, drawImageHeight,
        image.width.toDouble(), image.height.toDouble()));

  canvas.clipPath(path);
  canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
  return canvas;
}

