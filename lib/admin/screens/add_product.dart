import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/admin/screens/add_done.dart';
import 'package:ek/core/admin_controller/product_cubit/product_cubit.dart';
import 'package:ek/core/admin_controller/product_cubit/product_states.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/contact.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cateController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add Product Details'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: PageView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product images',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              fontSize: AppFontsSize.fontSize25,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Image1',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              fontSize: AppFontsSize.fontSize14,
                              fontWeight: FontWeight.w500),
                        ),
                        cubit.image1 == null
                            ? MaterialButton(
                                onPressed: () {
                                  cubit.addImage1();
                                },
                                child: const Icon(Icons.add))
                            : CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(cubit.image1!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Image2',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              fontSize: AppFontsSize.fontSize14,
                              fontWeight: FontWeight.w500),
                        ),
                        cubit.image2 == null
                            ? MaterialButton(
                                onPressed: () {
                                  cubit.addImage2();
                                },
                                child: const Icon(Icons.add))
                            : CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(cubit.image2!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Image3',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              fontSize: AppFontsSize.fontSize14,
                              fontWeight: FontWeight.w500),
                        ),
                        cubit.image3 == null
                            ? MaterialButton(
                                onPressed: () {
                                  cubit.addImage3();
                                },
                                child: const Icon(Icons.add))
                            : CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(cubit.image3!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Image4',
                          style: TextStyle(
                              color: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              fontSize: AppFontsSize.fontSize14,
                              fontWeight: FontWeight.w500),
                        ),
                        cubit.image4 == null
                            ? MaterialButton(
                                onPressed: () {
                                  cubit.addImage4();
                                },
                                child: const Icon(Icons.add))
                            : CircleAvatar(
                                radius: 50,
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(cubit.image4!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextForm(
                            context,
                            buttonController: nameController,
                            title: 'Product Name',
                            MediaQuery.of(context).size.height * 0.07,
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                          ),
                          PVSpace20,
                          buildTextForm(
                            context,
                            buttonController: descriptionController,
                            title: 'Description',
                            MediaQuery.of(context).size.height * 0.22,
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                          ),
                          PVSpace20,
                          Text('Product Company',
                              style: TextStyle(
                                fontFamily: 'Jannah',
                                fontSize: 20,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                              )),
                          Container(
                            height: 50,
                            width: 100,
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.scaffoldBackGroundColor
                                : AppColorsLightTheme.scaffoldBackGroundColor,
                            child: DropdownButton(
                              dropdownColor: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.greyColor),
                              items: [
                                "Dell",
                                "HP",
                                "Lenovo",
                                "Apple",
                                "Xiaomi",
                                "Samsung",
                                "Huawei",
                                "LG",
                                "Microsoft"
                              ]
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                cubit.selectedCompany(value);
                              },
                              value: cubit.productCompany,
                            ),
                          ),
                          PVSpace20,
                          Text('Product Status',
                              style: TextStyle(
                                fontFamily: 'Jannah',
                                fontSize: 20,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeToNew();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cubit.isNew
                                            ? ElktraCubit.get(context).dark
                                                ? AppColorsDarkTheme
                                                    .defaultColor
                                                : AppColorsLightTheme
                                                    .defaultColor
                                            : ElktraCubit.get(context).dark
                                                ? AppColorsLightTheme.greyColor
                                                : AppColorsLightTheme
                                                    .greyColor),
                                    height: 53,
                                    width: 160,
                                    child: const Center(
                                        child: Text(
                                      'New',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeToUsed();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cubit.isNew
                                            ? AppColorsLightTheme.greyColor
                                            : ElktraCubit.get(context).dark
                                                ? AppColorsDarkTheme
                                                    .defaultColor
                                                : AppColorsLightTheme
                                                    .defaultColor),
                                    height: 53,
                                    width: 160,
                                    child: const Center(
                                        child: Text(
                                      'Used',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          PVSpace20,
                          buildTextForm(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            context,
                            buttonController: priceController,
                            title: 'Price',
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          PVSpace20,
                          Text('Product Category',
                              style: TextStyle(
                                fontFamily: 'Jannah',
                                fontSize: 20,
                                color: ElktraCubit.get(context).dark
                                    ? AppColorsDarkTheme.whiteColor
                                    : AppColorsLightTheme.defaultColor,
                              )),
                          Container(
                            height: 50,
                            width: 230,
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.scaffoldBackGroundColor
                                : AppColorsLightTheme.scaffoldBackGroundColor,
                            child: DropdownButton(
                              dropdownColor: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              style: TextStyle(
                                  color: ElktraCubit.get(context).dark
                                      ? AppColorsDarkTheme.whiteColor
                                      : AppColorsLightTheme.greyColor),
                              items: [
                                "Laptops",
                                "Smart TVs",
                                "HeadPhone",
                                "Smart Phones",
                                "Smart Watches",
                                "PC and laptop accessories"
                              ]
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                cubit.selectedCategory(value);
                              },
                              value: cubit.productCategory,
                            ),
                          ),
                          PVSpace20,
                          buildTextForm(
                            color: ElktraCubit.get(context).dark
                                ? AppColorsDarkTheme.whiteColor
                                : AppColorsLightTheme.defaultColor,
                            context,
                            buttonController: countController,
                            title: 'Count In Stock',
                            MediaQuery.of(context).size.height * 0.07,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultButton(
                              backgroundColor: ElktraCubit.get(context).dark
                                  ? AppColorsDarkTheme.defaultColor
                                  : AppColorsLightTheme.defaultColor,
                              buttonWidget: const Text(
                                'AddProduct',
                                style: TextStyle(color: Colors.white),
                              ),
                              function: () {
                                cubit.addProduct(
                                    nameController.text,
                                    priceController.text,
                                    descriptionController.text,
                                    countController.text,
                                    context);
                                navigateToNextScreen(
                                    context, const AddProductDone());
                              })
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
