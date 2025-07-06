import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/widgets/product_favourite_button.dart';
import 'package:flutter_tokonih/features/product/views/product_detail_page.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';

class ProductCatalogCard extends StatefulWidget {
  final Product product;
  const ProductCatalogCard({super.key, required this.product});

  @override
  State<ProductCatalogCard> createState() => _ProductCatalogCardState();
}

class _ProductCatalogCardState extends State<ProductCatalogCard> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print('detail');
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailPage(productId: widget.product.id!);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.product.images!.first,
                    // 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
                    width: (MediaQuery.of(context).size.width * 0.5),
                    height: (MediaQuery.of(context).size.width * 0.5) - 48,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: const ProductFavouriteButton(),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    widget.product.title!,
                    // 'a Portable Neck Fan Hands Free Fan adas sada',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 22),
                      Text(
                        '${widget.product.rating} (${widget.product.reviews?.length ?? 0})',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: DefaultColors.neutral600,
                        ),
                      ),
                    ],
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
