import 'package:flutter/material.dart';
import 'package:gotop/models/product_model.dart';
import 'package:gotop/providers/wishlist_provider.dart';
import 'package:gotop/themes/themes.dart';
import 'package:provider/provider.dart';

class WishListCard extends StatelessWidget {
  final ProductModel product;
  WishListCard(this.product);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.only(
        top: 10,
        bottom: 14,
        right: 20,
        left: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ),
            child: Image.network(
              product.galleries![0].url!,
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/images/button_wishlist_on.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
