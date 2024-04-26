import 'package:e_commerse/app/modules/detail/views/detail_view.dart';
import 'package:e_commerse/app/modules/widgets/categories.dart';
import 'package:e_commerse/app/modules/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(), permanent: true);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 60,
              child: FutureBuilder<bool>(
                future: controller.hasToken(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Handle error
                    return Container();
                  } else if (snapshot.hasData && snapshot.data == true) {
                    // Render the authenticated content
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: controller.getUserData(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  print("error");
                                  print(snapshot.error);
                                  return Container();
                                } else if (snapshot.hasData) {
                                  return Text(
                                    "Hi ${snapshot.data?.user?.name ?? ""},",
                                    style: GoogleFonts.oldStandardTt(
                                      fontSize: 25,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  );
                                }
                                return Container();
                              },
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Let's get something...!",
                              style: GoogleFonts.lobster(
                                fontSize: 15,
                                color: Color.fromARGB(255, 107, 113, 119),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Text(
                          'nosta',
                          style: GoogleFonts.rubikVinyl(
                            fontSize: 35,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Render the non-authenticated content
                    return Text(
                      'nosta',
                      style: GoogleFonts.rubikVinyl(
                        fontSize: 35,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            height: 150, // Set the height of the container
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 247, 100, 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "30% OFF DURING \nRamadan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "50% OFF DURING \nVishu",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top categories",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle your onTap here.
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Obx(() => ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Categories(
                        categoryName: 'All',
                        isSelected: controller.selectedCategory.value == 'All',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.getProducts(p0, context).then((_) {
                            // Call getAllLiked after getProducts completes successfully
                            controller.getAllLiked();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Gluten-Free',
                        isSelected:
                            controller.selectedCategory.value == 'Gluten-Free',
                        onPressed: (p0) {
                          print(p0);
                          controller.selectCategory(p0);

                          controller.getProducts(p0, context).then((_) {
                            // Call getAllLiked after getProducts completes successfully
                            controller.getAllLiked();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Pop Corn ',
                        isSelected:
                            controller.selectedCategory.value == 'Pop Corn ',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.onReady();
                          Future.delayed(Duration(seconds: 1), () {
                            controller.onReady();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Dry Fruits',
                        isSelected:
                            controller.selectedCategory.value == 'Dry Fruits',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.onReady();
                          Future.delayed(Duration(seconds: 1), () {
                            controller.onReady();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Curry Powders',
                        isSelected: controller.selectedCategory.value ==
                            'Curry Powders',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.onReady();
                          Future.delayed(Duration(seconds: 1), () {
                            controller.onReady();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Spices',
                        isSelected:
                            controller.selectedCategory.value == 'Spices',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.onReady();
                          Future.delayed(Duration(seconds: 1), () {
                            controller.onReady();
                          });
                        },
                      ),
                      Categories(
                        categoryName: 'Kerala Special',
                        isSelected: controller.selectedCategory.value ==
                            'Kerala Special',
                        onPressed: (p0) {
                          controller.selectCategory(p0);
                          controller.onReady();
                          Future.delayed(Duration(seconds: 1), () {
                            controller.onReady();
                          });
                        },
                      ),
                    ],
                  )),
            ),
          ),
          StreamBuilder(
            stream: controller.getAllProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  shrinkWrap: true,
                  childAspectRatio:
                      MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                  physics: NeverScrollableScrollPhysics(),
                  children:
                      List.generate(snapshot.data!.products!.length, (index) {
                    final data = snapshot.data!.products![index];
                    // Your code here
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                              onTap: () {
                                Get.to(DetailView(), arguments: data.sId);
                              },
                              child: StreamBuilder(
                                stream: controller.fetchCustomerProductLikede,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  } else if (snapshot.hasData) {
                                    final likedId = snapshot.data!.likes;
                                    return FutureBuilder<bool>(
                                      future: controller.hasToken(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          // Return a loading indicator if the future hasn't completed yet
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          // Handle error
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          // Render the ProductCard based on the result of controller.hasToken()
                                          return ProductCard(
                                            name: data.name.toString(),
                                            price: data.price.toString(),
                                            disprice: data.discount.toString(),
                                            image: data.thumbnail.toString(),
                                            onPressed: () async {},
                                            productId: snapshot.data == true
                                                ? data.sId ?? ''
                                                : '',
                                            likedId: snapshot.data == true
                                                ? likedId as List
                                                : [],
                                          );
                                        }
                                      },
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
          )
        ],
      ),
    ));
  }
}
