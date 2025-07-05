import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_label.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:image_picker/image_picker.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({super.key});

  @override
  State<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _skuController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _stockController = TextEditingController();
  final _discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  XFile? newImage;

  void pickImage() async {
    XFile? image;
    final picker = ImagePicker();

    // Pick Image
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print('ada');
      setState(() {
        newImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommonAppbar(title: 'Edit Product', canBack: true),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: PaddingSize.horizontal,
            right: PaddingSize.horizontal,
            bottom: PaddingSize.vertical,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  FormLabel(label: 'Image'),
                  Container(
                    height: 92,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: DefaultColors.neutral400,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      spacing: 20,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              newImage != null
                                  ? Image.file(
                                    File(newImage!.path),
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.network(
                                    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTExL3BmLXMxMDgtcG0tNDExMy1tb2NrdXAuanBn.jpg',
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.cover,
                                  ),
                        ),

                        Expanded(
                          child: MainButton.filled(
                            onPressed: pickImage,
                            height: 40,
                            fontSize: 13,
                            label: 'Change Photo',
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),

                  FormLabel(label: 'Name'),
                  FormInput(
                    controller: _nameController,
                    hintText: 'Enter product name',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product name field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  FormLabel(label: 'Brand'),
                  FormInput(
                    controller: _brandController,
                    hintText: 'Enter product brand',
                    textInputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product brand field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  FormLabel(label: 'SKU'),
                  FormInput(
                    controller: _skuController,
                    hintText: 'Enter product sku',
                    textInputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product sku field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  FormLabel(label: 'Price'),
                  FormInput(
                    controller: _priceController,
                    hintText: 'Enter product price',
                    textInputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product price field is required.';
                      }
                      if (int.parse(value) < 0) {
                        return 'Product price must bigger then 0';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  FormLabel(label: 'Description'),
                  FormInput(
                    controller: _descriptionController,
                    hintText: 'Enter product description',
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product description field is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 4),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            FormLabel(label: 'Stock'),
                            FormInput(
                              controller: _stockController,
                              hintText: 'Enter product stock',
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This product stock field is required.';
                                }
                                if (int.parse(value) < 0) {
                                  return 'Product stock must bigger then 0';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            FormLabel(label: 'Discount (%)'),
                            FormInput(
                              controller: _discountController,
                              hintText: 'Enter product price',
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This product price field is required.';
                                }
                                if (int.parse(value) > 100 ||
                                    int.parse(value) < 0) {
                                  return 'Product dicscount must between 0-100';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
          child: MainButton.filled(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('haha');
              }
            },
            label: 'Save',
          ),
        ),
      ),
    );
  }
}
