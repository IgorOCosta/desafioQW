import 'package:desafio/models/ticket.dart';

class Event {
  final int id;
  final String title;
  final int batchs;
  final List<Ticket> tickets;

  const Event({
    required this.id,
    required this.title,
    required this.batchs,
    required this.tickets,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        title: json['title'],
        batchs: json['batchs'],
        tickets: json['tickets'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'batchs': batchs,
        'tickets': tickets,
      };
}
