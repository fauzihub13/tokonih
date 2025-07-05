import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/product/widgets/add_new_product_button.dart';
import 'package:flutter_tokonih/features/product/widgets/manage_product_list_card.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:flutter_tokonih/features/shared/widgets/search_bar_input.dart';

class ManageProductPage extends StatefulWidget {
  const ManageProductPage({super.key});

  @override
  State<ManageProductPage> createState() => _ManageProductPageState();
}

class _ManageProductPageState extends State<ManageProductPage> {
  @override
  Widget build(BuildContext context) {
    print('build page');
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

              // Product List
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              print('delete');
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      spacing: 4,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: PaddingSize.horizontal,
                                          ),
                                          child: Text(
                                            'Are you sure want to delete this product?',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w600,
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
                                                  Navigator.pop(sheetContext);
                                                },
                                                label: 'No, cancel',
                                                color: DefaultColors.neutral500,
                                              ),
                                            ),
                                            Expanded(
                                              child: MainButton.filled(
                                                height: 50,
                                                onPressed: () {
                                                  Navigator.pop(sheetContext);
                                                },
                                                label: 'Yes, delete',
                                                color: DefaultColors.red600,
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
                            backgroundColor: DefaultColors.red400.withValues(
                              alpha: 0.4,
                            ),
                            foregroundColor: DefaultColors.red600,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: ManageProductListCard(),
                    );
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
}
