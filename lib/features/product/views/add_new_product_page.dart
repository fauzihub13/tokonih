import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:flutter_tokonih/core/error/failure.dart';
import 'package:flutter_tokonih/features/product/viewmodels/store_product_viewmodel.dart';
import 'package:flutter_tokonih/features/product/viewmodels/update_product_view_model.dart';
import 'package:flutter_tokonih/features/shared/widgets/common_appbar.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_input.dart';
import 'package:flutter_tokonih/features/shared/widgets/form_label.dart';
import 'package:flutter_tokonih/features/shared/widgets/main_button.dart';
import 'package:flutter_tokonih/models/response/all_product_response_model.dart';
import 'package:image_picker/image_picker.dart';

class AddNewProductPage extends ConsumerStatefulWidget {
  final Product? product;
  const AddNewProductPage({super.key, this.product});

  @override
  ConsumerState createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends ConsumerState<AddNewProductPage> {
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
      setState(() {
        newImage = image;
      });
    }
  }

  void _productData(Product product) {
    _nameController.text = product.title!;
    _brandController.text = product.brand!;
    _skuController.text = product.sku!;
    _priceController.text = product.price!.toString();
    _descriptionController.text = product.description!;
    _stockController.text = product.stock!.toString();
    _discountController.text = product.discountPercentage!.toString();
  }

  void _updateProduct(Product product) {
    ref.read(updateProductViewModelProvider.notifier).updateProduct(product);
  }

  void _storeProduct(Product product) {
    ref.read(storeProductViewModelProvider.notifier).storeProduct(product);
  }

  @override
  void initState() {
    if (widget.product != null) {
      _productData(widget.product!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<bool>>(updateProductViewModelProvider, (prev, next) {
      next.whenOrNull(
        data: (success) {
          if (success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Success update product"),
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
    ref.listen<AsyncValue<bool>>(storeProductViewModelProvider, (prev, next) {
      next.whenOrNull(
        data: (success) {
          if (success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Success add new product"),
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
        child: CommonAppbar(title: 'Data Product', canBack: true),
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
                                  : widget.product != null
                                  ? Image.network(
                                    widget.product!.images!.first,
                                    width: 84,
                                    height: 84,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.asset(
                                    'assets/images/image_placeholder.jpg',
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This product price field is required.';
                      }
                      if (double.parse(value) < 0) {
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
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d*'),
                                ),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This product price field is required.';
                                }
                                if (double.parse(value) > 100 ||
                                    double.parse(value) < 0) {
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
                if (widget.product != null) {
                  final newData = Product(
                    id: widget.product!.id,
                    title: _nameController.text,
                    brand: _nameController.text,
                    sku: _nameController.text,
                    price: double.parse(_priceController.text),
                    description: _descriptionController.text,
                    stock: int.parse(_stockController.text),
                    discountPercentage: double.parse(_discountController.text),
                  );
                  _updateProduct(newData);
                } else {
                  final newData = Product(
                    title: _nameController.text,
                    brand: _nameController.text,
                    sku: _nameController.text,
                    price: double.parse(_priceController.text),
                    description: _descriptionController.text,
                    stock: int.parse(_stockController.text),
                    discountPercentage: double.parse(_discountController.text),
                  );
                  _storeProduct(newData);
                }
              }
            },
            label: 'Save',
          ),
        ),
      ),
    );
  }
}
