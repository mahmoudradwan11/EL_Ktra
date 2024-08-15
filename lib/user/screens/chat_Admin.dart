import 'package:hexcolor/hexcolor.dart';
import 'package:ek/admin/widgets/build_Messages.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_cubit.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_states.dart';
import 'package:ek/core/user_controller/user_version_cubit/user_version_cubit.dart';

class ChatBetweenAdminAndUser extends StatelessWidget {
  var textController = TextEditingController();
  ChatBetweenAdminAndUser({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<ChatCubit, ChatStates>(
          listener: (context, state) {
        if (state is SendMessage) {
          ChatCubit.get(context).getMessagesBetweenUserAndAdmin();
        }
      }, builder: (context, state) {
        var cubit = ChatCubit.get(context);
        if (cubit.messagesModel == null) {
          return Container(
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
            child: Scaffold(
              backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
              appBar: AppBar(
                titleSpacing: 0.0,
                title: const Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0021/0761/brand.gif?itok=xTwUWZVe'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Elktra Store',style: TextStyle(color:AppColorsLightTheme.scaffoldBackGroundColor,),
                    ),
                  ],
                ),
              ),
              body: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return Scaffold(
          backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.scaffoldBackGroundColor,
          appBar: AppBar(
            leading: InkWell(onTap:(){
              Navigator.pop(context);
            },child: const Icon(Icons.arrow_back,color: AppColorsLightTheme.scaffoldBackGroundColor,)),
            backgroundColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
            titleSpacing: 0.0,
            title:  const Row(
              children: [
               CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0021/0761/brand.gif?itok=xTwUWZVe')),
                SizedBox(
                  width: 15.0,
                ),
                Text('Elektra Store',style: TextStyle(color:AppColorsLightTheme.scaffoldBackGroundColor,
                ),),
              ],
            ),
          ),
          body: Container(
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (nationalId ==
                            cubit.messagesModel!.messages![index]
                                .senderNationalId) {
                          return builtMyMessage(
                              cubit.messagesModel!.messages![index], context);
                        }
                        return builtMessage(
                            cubit.messagesModel!.messages![index], context);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                      itemCount: cubit.messagesModel!.messages!.length,
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color:AppColorsLightTheme.shimmerLightColor,
                      border: Border.all(
                        color: AppColorsLightTheme.scaffoldBackGroundColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              style: TextStyle(
                                color:ElktraCubit.get(context).dark?AppColorsDarkTheme.scaffoldBackGroundColor:AppColorsLightTheme.defaultColor,
                    ),
                              controller: textController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'type your message ... ',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                          child: MaterialButton(
                            onPressed: () {
                              cubit.sendMessageFromUserToAdmin(
                                textController.text,
                              );
                            },
                            minWidth: 1.0,
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
