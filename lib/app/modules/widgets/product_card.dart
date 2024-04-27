import 'package:e_commerse/app/modules/data/colors.dart';
import 'package:e_commerse/app/modules/home/controllers/home_controller.dart';
import 'package:e_commerse/app/modules/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String disprice;
  final String image;
  final String productId;
  final List likedId;
  final String offer;

  final Function onPressed;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.disprice,
    required this.image,
    required this.onPressed,
    required this.productId,
    required this.likedId,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    print("likedId");
    print("likedId");
    print("likedId");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 50 : 70,
              right: MediaQuery.of(context).size.width > 600 ? 0 : 0,
              left: MediaQuery.of(context).size.width > 600 ? 0 : 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width > 600 ? 300 : 150,
                  width: MediaQuery.of(context).size.height > 600 ? 300 : 140,
                  child: Image.network(
                    image,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: OfferCard(
                offer: offer,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  likedId.any((product) =>
                          product.productId.toString() == productId)
                      ? controller.onunlikeProduct(
                          productId, context) // If already liked, unlike it
                      : controller.onlikeProduct(productId, context);
                },
                icon: Icon(
                  likedId.any((product) =>
                          product.productId.toString() == productId)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 250 : 210,
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: AppColor.white,
                  ),
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColor.darkBlue,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              disprice,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              price,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                color: AppColor.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
