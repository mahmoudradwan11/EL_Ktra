class MessagesModel{
  List<Messages>? messages;

  MessagesModel({this.messages});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }
}

class Messages {
  String? sId;
  String? senderNationalId;
  String? receiverNationalId;
  String? content;
  String? timestamp;
  int? iV;

  Messages(
      {this.sId,
        this.senderNationalId,
        this.receiverNationalId,
        this.content,
        this.timestamp,
        this.iV});

  Messages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderNationalId = json['senderNationalId'];
    receiverNationalId = json['receiverNationalId'];
    content = json['content'];
    timestamp = json['timestamp'];
    iV = json['__v'];
  }
}