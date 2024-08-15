import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/user/widgets/product_details/build_specification_item.dart';

class BuildAccessoriesSpecifications extends StatelessWidget {
  var comapany;
  BuildAccessoriesSpecifications({Key? key,required this.comapany}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        BuildSpecificationProductItem(
          title:'Color',
          subTitle:'Black',
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
          title:'Warranty',
          subTitle:'1 month',
          darkBackGroundColor:AppColorsDarkTheme.whiteColor.withOpacity(0.4),
          lightBackGroundColor:HexColor('#FEFEFE').withOpacity(0.36),
        ),
      ],
    );
  }
}
