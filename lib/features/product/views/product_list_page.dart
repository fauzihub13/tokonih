import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';
import 'package:flutter_tokonih/features/home/widgets/product_catalog_card.dart';
import 'package:flutter_tokonih/features/product/viewmodels/product_viewmodel.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/empty_state.dart';
import 'package:flutter_tokonih/features/shared/widgets/search_bar_input.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
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

  @override
  void initState() {
    super.initState();
    ref.read(productViewmodelProvider.notifier).getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewmodelProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(
          title: 'Products',
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
              Expanded(
                child: productState.when(
                  data: (data) {
                    if (data == null) {
                      return Center(child: CircularProgressIndicator());
                    } else {
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
                          : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 18,
                                  crossAxisSpacing: 18,
                                  mainAxisExtent: 300,
                                ),
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];
                              return ProductCatalogCard(product: product);
                            },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
