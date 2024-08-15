import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/user/widgets/product_details/build_specification_item.dart';

class BuildPhonesSpecifications extends StatelessWidget {
  var comapany;
  BuildPhonesSpecifications({Key? key,required this.comapany}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        BuildSpecificationProductItem(
          category:'Smart Phones',
          title:'Color',
          subTitle:'white',
          darkBackGroundColor:AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor:HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'Country',
          subTitle:'USA',
          darkBackGroundColor:AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor:HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'Company',
          subTitle:comapany,
          darkBackGroundColor:AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor:HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'Storage',
          subTitle:'128 GB',
          darkBackGroundColor:AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor:HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'OS',
          subTitle:comapany=='Apple'?'IOS':'Android',
          darkBackGroundColor:AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor:HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          category:'Laptops',
          title:'RAM',
          subTitle:'12 GB',
          darkBackGroundColor:AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor:HexColor('#FEFEFE').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'Battery',
          subTitle:'4000 MA',
          darkBackGroundColor:AppColorsDarkTheme.defaultColor.withOpacity(0.45),
          lightBackGroundColor:HexColor('#9B9CB7').withOpacity(0.36),
        ),
        BuildSpecificationProductItem(
          title:'Warranty',
          subTitle:'1 year',
          darkBackGroundColor:AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor:HexColor('#FEFEFE').withOpacity(0.36),
        ),
      ],
    );
  }
}
