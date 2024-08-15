import 'package:ek/admin/models/users_model.dart';
import 'package:ek/admin/widgets/build_Messages.dart';
import 'package:ek/core/mangers/colors.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_cubit.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_states.dart';

class ChatScreen extends StatelessWidget {
  User userModel;
  var textController = TextEditingController();
  ChatScreen({Key? key, required this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocConsumer<ChatCubit, ChatStates>(
          listener: (context, state) {
        if (state is SendMessage) {
          ChatCubit.get(context)
              .getMessagesBetweenAdminAndUser(userModel.nationalId);
        }
      }, builder: (context, state) {
        var cubit = ChatCubit.get(context);
        var messages = cubit.messagesModel!.messages;
        if (cubit.messagesModel == null) {
          return Scaffold(
            backgroundColor: AppColorsLightTheme.shimmerBaseColor,
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(userModel.profileImage!),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(userModel.name!),
                ],
              ),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          backgroundColor: AppColorsLightTheme.shimmerBaseColor,
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(userModel.profileImage!),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(userModel.name!),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrolekhysics(),
                    itemBuilder: (context, index) {
                      if (adminId == messages[index].senderNationalId) {
                        return builtMyMessage(messages[index], context);
                      }
                      return builtMessage(messages[index], context);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                    itemCount: messages!.length,
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColorsLightTheme.scaffoldBackGroundColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextFormField(
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
                        color: AppColorsLightTheme.defaultColor,
                        child: MaterialButton(
                          onPressed: () {
                            cubit.sendMessageFromAdminToUser(
                                textController.text, userModel.nationalId);
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
        );
      });
    });
  }
}
