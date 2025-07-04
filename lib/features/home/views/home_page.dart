import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/home/widgets/category_card.dart';
import 'package:flutter_tokonih/features/home/widgets/main_appbar.dart';
import 'package:flutter_tokonih/features/home/widgets/product_catalog_card.dart';
import 'package:flutter_tokonih/features/product/views/product_list_page.dart';
import 'package:flutter_tokonih/features/shared/widgets/search_bar_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/title_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: MainAppbar(name: 'Wiliam Anderson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.horizontal),
        child: SingleChildScrollView(
          child: Column(
            spacing: 4,
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

              const SizedBox(height: 4),

              // Category Title
              TitleSection(
                title: 'Categories',
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          spacing: 4,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Categories',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 18,
                                    crossAxisSpacing: 18,
                                    mainAxisExtent: 80,
                                  ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return CategoryCard(
                                  categoryName: '$index category',
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              // Category List
              SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 14),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CategoryCard(categoryName: '$index category');
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Product Title
              TitleSection(
                title: 'Hot Product',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductListPage();
                      },
                    ),
                  );
                },
              ),

              // Product List
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  mainAxisExtent: 300,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ProductCatalogCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
