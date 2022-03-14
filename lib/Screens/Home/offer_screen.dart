import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<String> banner = ['images/banner1.png'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/authbg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: context.width(),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: banner.length,
                              itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Image(image: AssetImage(banner[index])),
                                  const SizedBox(height: 50.0),
                                ],
                              );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
