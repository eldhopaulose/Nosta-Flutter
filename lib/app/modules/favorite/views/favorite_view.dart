import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:e_commerse/app/modules/detail/views/detail_view.dart';
import 'package:e_commerse/app/modules/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController(), permanent: true);
    controller.onReady();
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text('Favorite',
              style: GoogleFonts.castoro(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // You can set the color of the text
              )),
        ),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
        stream: controller.fetchCustomerProductLikede,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
              alignment: Alignment.center,
              child: LoadingAnimationWidget.beat(
                color: AppColor.green,
                size: 50,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            print(snapshot.data!.likes!.length);
            if (snapshot.data!.likes!.isEmpty) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                child: Center(child: Text('No data found')),
              );
            }
            return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              shrinkWrap: true,
              childAspectRatio:
                  MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(snapshot.data!.likes!.length, (index) {
                final data = snapshot.data!.likes![index];
                // Your code here
                return Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                          onTap: () {
                            Get.to(DetailView(),
                                arguments: data.productId!.sId);
                          },
                          child: StreamBuilder(
                            stream: controller.fetchCustomerProductLikedeById,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Container(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else if (snapshot.hasData) {
                                final likedId = snapshot.data!.likes;
                                return ProductCard(
                                  name: data.productId!.name.toString(),
                                  price:
                                      data.productId!.originalPrice.toString(),
                                  disprice: data.productId!.price.toString(),
                                  image: data.productId!.thumbnail.toString(),
                                  onPressed: () async {},
                                  productId: data.productId!.sId ?? '',
                                  likedId: likedId as List,
                                  offer: data.productId!.discount.toString(),
                                );
                              } else {
                                return Container();
                              }
                            },
                          )),
                    ),
                  ],
                );
                // Replace Container() with your desired widget
              }),
            );
          }
          return Container();
        },
      )),
    );
  }
}
