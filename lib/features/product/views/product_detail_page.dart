import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/utils/int_ext.dart';
import 'package:flutter_tokonih/features/home/widgets/product_favourite_button.dart';
import 'package:flutter_tokonih/features/product/widgets/row_product_detail.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Product Detail', canBack: true),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: PaddingSize.horizontal,
          right: PaddingSize.horizontal,
          bottom: PaddingSize.vertical,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
                      // width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.width),
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
              const SizedBox(height: 14),
              Text(
                'Portable Neck Fan Hands Free Fan adas sada',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text(
                    100000.currencyFormatRp,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.star, color: Colors.amber, size: 22),
                  Text(
                    '5 (120 reviews)',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: DefaultColors.neutral600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Product Details',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              RowProductDetail(title: 'Brand', description: 'brand'),
              RowProductDetail(title: 'Category', description: 'Beauty'),
              RowProductDetail(title: 'Stock', description: '29'),
              RowProductDetail(title: 'SKU', description: 'BEA-ESS-ESS-001'),
              const SizedBox(height: 14),

              Text(
                'Product Description',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                'Made for work or for the weekends, this plain t-shirt can be dressed up or down and gives any outfit the clean look you want Each top is made from comfortable cotton, and features short sleeves, and a crewneck Easy to care for, this tee can be washed with like colors on the gentle cycle. Made from responsibly sourced materials and with the Gap ethos in mind, our everyday essentials come in a wide range of fits, sizes, cuts, solid colors, and prints, Gap champions a uniquely optimistic sense of American style that bridges the gaps between individuals, generations, and cultures',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: DefaultColors.neutral500,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical / 2,
          ),
          child: MainButton.filled(onPressed: () {}, label: 'Add To Cart'),
        ),
      ),
    );
  }
}
