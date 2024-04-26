import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CartController(), permanent: true);
    return Scaffold(
      //backgroundColor: Colors.black, // set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'My Cart',
            style: GoogleFonts.castoro(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // You can set the color of the text
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: controller.fetchAllCart,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.error != null) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                final data = snapshot.data!.carts;

                controller.product.value = data!.first.items!
                    .where((item) =>
                        item.productId != null &&
                        item.productId!.sId is String) // Check type
                    .map((item) => item.productId!.sId)
                    .toList();

                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: data.first.items!.length,
                      itemBuilder: (context, index) {
                        print("Total Cost: ${controller.totalCost.value}");
                        print(data.first.items![index].totalCost);
                        final product = data.first.items![index].productId!;
                        controller.Bookproduct.value = [data.first.sId!];

                        return Dismissible(
                          key: Key(
                              '${data.first.items![index].productId!.sId}-$index'),
                          onDismissed: (direction) {
                            controller.onDeleteCart(data
                                .first.items![index].productId!.sId
                                .toString());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10), // add some space below each item
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 245,
                                  247), // light gray background color
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                  data.first.items![index].productId!.name
                                      .toString(),
                                  style: GoogleFonts.grenze(
                                    // Set the font size to 20
                                    fontSize: 18,
                                  )),
                              subtitle: Text(
                                  data.first.items![index].productId!.discount
                                      .toString(),
                                  style: GoogleFonts.grenze(
                                    fontSize: 15,
                                  )),
                              leading: Image.network(
                                  data.first.items![index].productId!.thumbnail
                                      .toString(),
                                  width: 100),
                              trailing: Container(
                                padding: const EdgeInsets.all(
                                    8.0), // Add some padding
                                decoration: BoxDecoration(
                                  color:
                                      Colors.white, // Set the color of the box
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius
                                  boxShadow: [
                                    // Add a shadow effect
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.remove,
                                            color: Colors.green, size: 15.0),
                                        onPressed: () {
                                          controller.onCLickDeecriment(
                                              product.sId.toString());
                                        }),
                                    Text(
                                      data.first.items![index].quantity
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight
                                              .bold), // Increase the font size to 24 and make it bold
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add,
                                          color: Colors.green, size: 15.0),
                                      onPressed: () {
                                        controller.onCLickIncriment(
                                            product.sId.toString());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Obx(() => Text(
                                '₹ ${controller.totalCost.value}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 40, 167, 45),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: FloatingActionButton(
                        backgroundColor:
                            const Color.fromARGB(255, 192, 243, 194),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Proceed to Pay',
                              style: TextStyle(
                                color: Colors
                                    .black, // Set the color of the text to black
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.black, size: 15.0),
                          ],
                        ),
                        onPressed: () {
                          controller.buyNow();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}
