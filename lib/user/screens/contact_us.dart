import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/user_controller/contact_cubit/contact_cubit.dart';
import 'package:ek/core/user_controller/contact_cubit/contact_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:ek/user/widgets/button.dart';
import 'package:ek/user/widgets/contact.dart';

class ContactUsScreen extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
   ContactUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {},
        builder: (context, state){
          var cubit = ContactUsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.arrow_back,color: Colors.white,),
              backgroundColor: ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
              title:const Text('Report',style: TextStyle(color: Colors.white),),
            ),
            body:Container(
              decoration: BoxDecoration(
                  gradient: ElktraCubit.get(context).dark?
                  LinearGradient(
                      colors: [
                        HexColor('#000428'),
                        HexColor('#004e92').withOpacity(0.5),
                      ]
                  ):
                  const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white
                      ]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      buildTextForm(
                        context,
                        color: ElktraCubit.get(context).dark?AppColorsDarkTheme.whiteColor:AppColorsLightTheme.defaultColor,
                        buttonController: descriptionController,
                        title: 'Problem',
                        MediaQuery.of(context).size.height * 0.22,
                      ),
                      const Spacer(),
                      DefaultButton(function:(){
                        cubit.sendReport(descriptionController.text,context);
                      },
                        borderColor: Colors.white,
                        backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                        buttonWidget: const Text(
                          'Send',style: TextStyle(
                            color: Colors.white
                        ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
