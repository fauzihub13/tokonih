import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';

class CartProductCard extends StatelessWidget {
  // final Product product;
  final bool wantToDelete;
  const CartProductCard({super.key, this.wantToDelete = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: DefaultColors.neutral100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        spacing: 14,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              // product.images!.first,
              'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // product.title!,
                  'Portable Neck Fan Hands Free Fan adas sada',
                  maxLines: 2,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$92.15',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    if (!wantToDelete)
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              color: DefaultColors.neutral200,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              color: DefaultColors.blue400,
                              onPressed: () {
                                print('klik');
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: DefaultColors.neutral900,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '5',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              color: DefaultColors.blue600,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              color: DefaultColors.blue900,
                              onPressed: () {
                                print('klik');
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: DefaultColors.neutral50,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
