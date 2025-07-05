import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/views/landing_page.dart';
import 'package:flutter_tokonih/features/home/widgets/product_catalog_card.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/search_bar_input.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
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
                controller: TextEditingController(),
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 300,
                  ),
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductCatalogCard();
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
