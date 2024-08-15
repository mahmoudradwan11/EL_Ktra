import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ek/admin/models/messages_model.dart';
import 'package:ek/core/mangers/values.dart';
import 'package:ek/core/network/remote/api_constants.dart';
import 'package:ek/core/network/remote/store/dio_helper.dart';
import 'package:ek/core/user_controller/chat_cubit/chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitState());

  static ChatCubit get(context) => BlocProvider.of(context);
  void sendMessageFromAdminToUser(content,receiverNationalId){
    DioHelperStore.postData(url:ApiConstants.chatApi, data:{
      "senderNationalId":adminId,
      "receiverNationalId":receiverNationalId,
      "content":content
    }).then((value){
      emit(SendMessage());
      getMessagesBetweenAdminAndUser(receiverNationalId);
    }).catchError((error){
      print(error.toString());
      emit(ErrorSendMessage());
    });
  }
  MessagesModel? messagesModel;
  void getMessagesBetweenAdminAndUser(receiverNationalId) {
    DioHelperStore.getData(url: ApiConstants.chatApi, data: {
      "senderNationalId":adminId,
      "receiverNationalId":receiverNationalId
    }).then((value) {
      messagesModel = MessagesModel.fromJson(value.data);
      print(messagesModel!.messages!.length);
      emit(GetAllMessages());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllMessages());
    });
  }
  void sendMessageFromUserToAdmin(content){
    DioHelperStore.postData(url:ApiConstants.chatApi, data:{
      "senderNationalId":nationalId,
      "receiverNationalId":adminId,
      "content":content
    }).then((value){
      emit(SendMessage());
      getMessagesBetweenUserAndAdmin();
    }).catchError((error){
      print(error.toString());
      emit(ErrorSendMessage());
    });
  }
  void getMessagesBetweenUserAndAdmin() {
    DioHelperStore.getData(url: ApiConstants.chatApi, data: {
      "senderNationalId":nationalId,
      "receiverNationalId":adminId
    }).then((value) {
      messagesModel = MessagesModel.fromJson(value.data);
      print(messagesModel!.messages!.length);
      emit(GetAllMessages());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetAllMessages());
    });
  }
}