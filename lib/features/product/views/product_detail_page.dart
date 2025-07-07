import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';
import 'package:flutter_tokonih/features/home/widgets/product_favourite_button.dart';
import 'package:flutter_tokonih/features/product/viewmodels/detail_product_viewmodel.dart';
import 'package:flutter_tokonih/features/product/views/product_review_page.dart';
import 'package:flutter_tokonih/features/product/widgets/row_product_detail.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final int productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(detailProductViewmodelProvider.notifier)
          .getDetailProduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailState = ref.watch(detailProductViewmodelProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(
          title: 'Product Detail',
          canBack: true,
          suffixIcon: Icon(
            size: 22,
            Icons.shopping_cart,
            color: DefaultColors.neutral950,
          ),
          suffixIconOnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LandingPage(index: 2);
                },
              ),
            );
          },
        ),
      ),
      body: detailState.when(
        data: (data) {
          if (data != null) {
            return Padding(
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
                            data.images!.first,
                            // 'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
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
                      data.title!,
                      // 'Portable Neck Fan Hands Free Fan adas sada',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$${data.price!}',
                          // 100000.currencyFormatRp,
                          textAlign: TextAlign.left,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.star, color: Colors.amber, size: 22),
                        Text(
                          '${data.rating} (${data.reviews?.length ?? 0})',
                          // '5 (120 reviews)',
                          textAlign: TextAlign.left,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RowProductDetail(title: 'Brand', description: data.brand!),
                    RowProductDetail(
                      title: 'Category',
                      description: data.category!,
                    ),
                    RowProductDetail(
                      title: 'Stock',
                      description: '${data.stock!}',
                    ),
                    RowProductDetail(title: 'SKU', description: data.sku!),
                    const SizedBox(height: 14),

                    Text(
                      'Product Description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.description!,
                      // 'Made for work or for the weekends, this plain t-shirt can be dressed up or down and gives any outfit the clean look you want Each top is made from comfortable cotton, and features short sleeves, and a crewneck Easy to care for, this tee can be washed with like colors on the gentle cycle. Made from responsibly sourced materials and with the Gap ethos in mind, our everyday essentials come in a wide range of fits, sizes, cuts, solid colors, and prints, Gap champions a uniquely optimistic sense of American style that bridges the gaps between individuals, generations, and cultures',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: DefaultColors.neutral500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Rating & Reviews',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: DefaultColors.neutral50,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductReviewPage(
                                  reviews: data.reviews!,
                                );
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            spacing: 10,
                            children: [
                              Text(
                                '${data.rating}/5',
                                textAlign: TextAlign.left,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  // fontSize: 22,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overall Rating',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${data.reviews?.length ?? 0} ratings',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: DefaultColors.neutral700,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: DefaultColors.neutral500,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: DefaultColors.blue600),
            );
          }
        },
        error: (err, stack) {
          // print('ERR TYPE: ${err.runtimeType}');
          return Center(child: Text((err as Failure).message!));
        },
        loading: () {
          // print('loading ui');
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: detailState.when(
        data: (data) {
          if (data != null) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: PaddingSize.horizontal,
                  right: PaddingSize.horizontal,
                  bottom: PaddingSize.vertical / 2,
                ),
                child: MainButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: 'Add To Cart',
                ),
              ),
            );
          } else {
            return null;
          }
        },
        error: (err, stack) {
          return null;
        },
        loading: () {
          return null;
        },
      ),
    );
  }
}
