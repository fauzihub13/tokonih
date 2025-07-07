import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/features/product/viewmodels/delete_product_viewmodel.dart';
import 'package:flutter_tokonih/features/product/viewmodels/product_viewmodel.dart';
import 'package:flutter_tokonih/features/product/widgets/add_new_product_button.dart';
import 'package:flutter_tokonih/features/product/widgets/manage_product_list_card.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/empty_state.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:flutter_tokonih/features/shared/widgets/search_bar_input.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ManageProductPage extends ConsumerStatefulWidget {
  const ManageProductPage({super.key});

  @override
  ConsumerState createState() => _ManageProductPageState();
}

class _ManageProductPageState extends ConsumerState<ManageProductPage> {
  List<Product> searchResults = [];
  final TextEditingController searchController = TextEditingController();

  void _onSearchChanged(String value) {
    setState(() {
      searchResults =
          searchResults
              .where(
                (e) => e.title!.toLowerCase().contains(value.toLowerCase()),
              )
              .toList();
    });
  }

  void _deleteProduct(Product product) {
    ref
        .read(deleteProductViewModelProvider.notifier)
        .deleteProduct(product.id!);
  }

  @override
  void initState() {
    super.initState();
    ref.read(productViewmodelProvider.notifier).getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewmodelProvider);

    ref.listen<AsyncValue<bool>>(deleteProductViewModelProvider, (prev, next) {
      next.whenOrNull(
        data: (success) {
          if (success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Success delete product"),
                backgroundColor: DefaultColors.green600,
              ),
            );
          }
        },
        error: (e, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("${(e as Failure).message}")));
        },
      );
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Manage Product', canBack: true),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical,
          ),
          child: Column(
            spacing: 16,
            children: [
              // Searchbar
              SearchBarInput(
                fillColor: DefaultColors.neutral50,
                controller: searchController,
                onChanged: _onSearchChanged,
                hintText: 'Find your favorite items',
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 22,
                    width: 22,
                    colorFilter: ColorFilter.mode(
                      DefaultColors.neutral600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/x_search.svg',
                    colorFilter: ColorFilter.mode(
                      DefaultColors.neutral600,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              // Product List
              Expanded(
                child: productState.when(
                  data: (data) {
                    if (data != null) {
                      searchResults = data.products!;
                      final filteredProducts =
                          searchController.text.isEmpty
                              ? searchResults
                              : searchResults
                                  .where(
                                    (e) => e.title!.toLowerCase().contains(
                                      searchController.text.toLowerCase(),
                                    ),
                                  )
                                  .toList();
                      return filteredProducts.isEmpty
                          ? const Center(
                            child: EmptyState(
                              iconPath: 'not_found.svg',
                              title: 'Produk tidak ditemukan',
                              subTitle: '',
                              size: 150,
                            ),
                          )
                          : ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          context: context,
                                          builder: (BuildContext sheetContext) {
                                            return Container(
                                              width: double.infinity,
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                spacing: 4,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal:
                                                              PaddingSize
                                                                  .horizontal,
                                                        ),
                                                    child: Text(
                                                      'Are you sure want to delete this product?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20,
                                                          ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Row(
                                                    spacing: 10,
                                                    children: [
                                                      Expanded(
                                                        child: MainButton.filled(
                                                          height: 50,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              sheetContext,
                                                            );
                                                          },
                                                          label: 'No, cancel',
                                                          color:
                                                              DefaultColors
                                                                  .neutral500,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            MainButton.filled(
                                                              height: 50,
                                                              onPressed: () {
                                                                _deleteProduct(
                                                                  product,
                                                                );
                                                              },
                                                              label:
                                                                  'Yes, delete',
                                                              color:
                                                                  DefaultColors
                                                                      .red600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      backgroundColor: DefaultColors.red400
                                          .withValues(alpha: 0.4),
                                      foregroundColor: DefaultColors.red600,
                                      icon: Icons.delete,
                                    ),
                                  ],
                                ),
                                child: ManageProductListCard(product: product),
                              );
                            },
                          );
                    } else {
                      return _loadingProduct();
                    }
                  },
                  error: (err, stack) {
                    return Center(child: Text((err as Failure).message!));
                  },
                  loading: () {
                    return _loadingProduct();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddNewProductButton(),
    );
  }

  Widget _loadingProduct() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Skeletonizer(
          containersColor: DefaultColors.neutral200.withValues(alpha: 0.2),
          enabled: true,
          effect: ShimmerEffect(
            baseColor: DefaultColors.neutral200,
            highlightColor: DefaultColors.neutral300,
          ),
          child: ManageProductListCard(
            product: Product(
              images: [
                'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
              ],
              title: 'Produk Produk',
              price: 1,
              rating: 2,
              reviews: [Review()],
            ),
          ),
        );
      },
    );
  }
}
