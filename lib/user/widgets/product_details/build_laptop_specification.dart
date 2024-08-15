import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/user/widgets/product_details/build_specification_item.dart';

class BuildLaptopsSpecifications extends StatelessWidget {
  var comapany;
  BuildLaptopsSpecifications({Key? key, required this.comapany})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Color',
          subTitle: 'Black',
          darkBackGroundColor:
              AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor: HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Country',
          subTitle: 'China',
          darkBackGroundColor: AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor: HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Company',
          subTitle: comapany,
          darkBackGroundColor:
              AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor: HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Memory',
          subTitle: '16 GB',
          darkBackGroundColor: AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor: HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'OS',
          subTitle: comapany == 'Apple' ? 'MAC' : 'Windows',
          darkBackGroundColor:
              AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor: HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Hard Drive',
          subTitle: '512GB SSD',
          darkBackGroundColor: AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor: HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'CPU',
          subTitle: 'i7-1075H',
          darkBackGroundColor:
              AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor: HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Screen',
          subTitle: '15.6 FHD',
          darkBackGroundColor: AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor: HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category: 'Laptops',
          title: 'Warranty',
          subTitle: '1 year',
          darkBackGroundColor:
              AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor: HexColor('#9B9CB7').withOpacity(0.36),
        ),
      ],
    );
  }
}
