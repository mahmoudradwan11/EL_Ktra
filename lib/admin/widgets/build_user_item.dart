import 'package:ek/admin/models/users_model.dart';
import 'package:ek/admin/screens/user_profile.dart';
import 'package:ek/core/mangers/routes.dart';
import 'package:flutter/material.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_cubit.dart';

Widget? buildUserItem(User user, context) => InkWell(
      onTap: () {
        ChatCubit.get(context).getMessagesBetweenAdminAndUser(user.nationalId);
        navigateToNextScreen(context,UserProfileScreen(userModel: user,));
      },
      child: Card(
        elevation: 1, // Add elevation for a material design look

        margin: const EdgeInsets.all(10), // Adjust margin as needed

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profileImage!),

                radius: 30, // Adjust the size of the avatar
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.email!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
