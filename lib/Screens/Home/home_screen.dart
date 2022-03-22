import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maan_food/GlobalComponents/category_data.dart';
import 'package:maan_food/GlobalComponents/product_data.dart';
import 'package:maan_food/GlobalComponents/restaurant_data.dart';
import 'package:maan_food/Screens/Home/category_screen.dart';
import 'package:maan_food/Screens/Home/product_screen.dart';
import 'package:maan_food/Screens/Home/table_booking.dart';
import 'package:maan_food/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import 'product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> banner = ['images/banner1.png', 'images/banner2.png'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                 // const HomeMap(),
                  Positioned(
                    top: 220,
                    left: 30.0,
                    right: 30.0,
                    child: Row(
                      children: [
                        Text(
                          'Categories',
                          style: kTextStyle.copyWith(
                              color: kTitleColor, fontSize: 18.0),
                        ),
                        const Spacer(),
                        Text(
                          'See all',
                          style: kTextStyle.copyWith(color: kGreyTextColor),
                        ).onTap(() {
                          const CategoryScreen().launch(context);
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: HorizontalList(
                  spacing: 10,
                  itemCount: catData.length,
                  itemBuilder: (_, i) {
                    return CatCard(catList: catData[i]).onTap(
                      () {
                        // const CourseDetails().launch(context);
                      },
                      highlightColor: context.cardColor,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: HorizontalList(
                  spacing: 10,
                  itemCount: banner.length,
                  itemBuilder: (_, i) {
                    return Image(
                      image: AssetImage(banner[i]),
                    ).onTap(
                      () {
                        // const CourseDetails().launch(context);
                      },
                      highlightColor: context.cardColor,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'Book Your Restaurant',
                  style: kTextStyle.copyWith(
                      color: kTitleColor, fontSize: 18.0),
                ),
              ),
              HorizontalList(
                spacing: 10,
                itemCount: restaurantList.length,
                itemBuilder: (_, i) {
                  return BookTableCard(restaurantData: restaurantList[i]).onTap(
                        () {
                      // const CourseDetails().launch(context);
                    },
                    highlightColor: context.cardColor,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Popular Deals',
                      style: kTextStyle.copyWith(
                          color: kTitleColor, fontSize: 18.0),
                    ),
                    const Spacer(),
                    Text(
                      'See all',
                      style: kTextStyle.copyWith(color: kGreyTextColor),
                    ).onTap(() {
                      const ProductScreen().launch(context);
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: HorizontalList(
                  spacing: 10,
                  itemCount: productList.length,
                  itemBuilder: (_, i) {
                    return FoodCard(productData: productList[i]).onTap(
                          () {
                            ProductDetails(product: productList[i])
                                .launch(context);
                      },
                      highlightColor: context.cardColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookTableCard extends StatelessWidget {
  const BookTableCard({
    Key? key,
    required this.restaurantData
  }) : super(key: key);
final RestaurantData restaurantData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10.0),
      child: Material(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image(image: AssetImage(restaurantData.restaurantImage),fit: BoxFit.cover,),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurantData.restaurantName, style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),),
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: kGreyTextColor,
                                    size: 15.0,
                                  ),
                                ),
                                TextSpan(
                                  text: restaurantData.restaurantLocation,
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: restaurantData.restaurantRatingCount,
                                  style: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                                const WidgetSpan(
                                  child: SizedBox(width: 2.0,),
                                ),
                                TextSpan(
                                  text: restaurantData.restaurantRating,
                                  style: kTextStyle.copyWith(
                                      color: kTitleColor),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.star_border,
                                    color: kMainColor,
                                    size: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0,bottom: 4.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('Book Now',style: kTextStyle.copyWith(color: Colors.white),),
                          ).onTap((){
                            const TableBooking().launch(context);
                          }),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.productData
  }) : super(key: key);
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 160.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(productData.productImage),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        productData.productTitle,
                        style: kTextStyle.copyWith(color: kTitleColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: productData.productRating.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10.0,
                      ),
                      const SizedBox(width: 5.0,),
                      Text(
                        productData.productRating,
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Icon(
                                  Icons.attach_money,
                                  color: kMainColor,
                                  size: 7.0,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: productData.productPrice,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                fontSize: 16.0
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundColor: kSecondaryColor,
                        radius: 16.0,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: kMainColor,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFE51000).withOpacity(0.1),
            radius: 16.0,
            child: const Icon(
              Icons.favorite,
              color: Color(0xFFE51000),
              size: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

class CatCard extends StatelessWidget {
  const CatCard({Key? key, required this.catList}) : super(key: key);
  final CategoryData catList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: kSecondaryColor,
            radius: 30.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(catList.catIcon),
              ),
            )),
        Text(
          catList.catTitle,
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
      ],
    );
  }
}
