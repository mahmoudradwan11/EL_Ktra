abstract class ChatStates{}
class ChatInitState extends ChatStates{}
class SendMessage extends ChatStates{}
class ErrorSendMessage extends ChatStates{}
class GetAllMessages extends ChatStates{}
class ErrorGetAllMessages extends ChatStates{}