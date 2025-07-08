import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/router/route_name.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:go_router/go_router.dart';

class ManageProductListCard extends StatelessWidget {
  final Product product;

  const ManageProductListCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          context.pushNamed(RouteName.addNewProductPage, extra: product);
        },
        splashColor: DefaultColors.neutral100,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: DefaultColors.neutral200)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            spacing: 14,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.images!.first,
                  // 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      // 'Portable Neck Fan Hands Free Fan adas sada',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Stock: ',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${product.stock} pcs',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
