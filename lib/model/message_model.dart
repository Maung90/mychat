class Message {
  final int? id;
  late final String text;
  final String sender;

  Message({this.id, required this.text, required this.sender});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'sender': sender,
    };
  }

  @override
  String toString() {
    return 'Message{id: $id, text: $text, sender: $sender}';
  }
}
