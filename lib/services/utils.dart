import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/loader/loading_provider.dart';

void showLoader(BuildContext context) {
// show the loader by setting it's state to true
  context.read<LoadingProvider>().setLoad(true);
}

void hideLoader(BuildContext context) {
// hide the loader by setting it's state to false
  context.read<LoadingProvider>().setLoad(false);
}
