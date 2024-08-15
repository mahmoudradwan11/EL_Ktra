import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/admin/widgets/build_product_item.dart';
import 'package:ek/core/admin_controller/product_cubit/product_cubit.dart';
import 'package:ek/core/admin_controller/product_cubit/product_states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          if(cubit.productsModel==null){
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              title:const Text('All Products'),
            ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: GridView.count(
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        cubit.productsModel!.products!.length,
                            (index) =>
                            buildProductItemAdmin(cubit.productsModel!
                                .products![index], context)),
                  ),
                ),
              )
          );
        }
    );
  }
}
