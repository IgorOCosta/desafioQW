class Ticket {
  final String id;
  final String owner;
  final String emailOwner;
  final int batch;
  final bool isHalf; 
  final bool isUsed;


  const Ticket({
    required this.id,
    required this.owner,
    required this.batch,
    required this.emailOwner,
    required this.isHalf,
    required this.isUsed,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json['id'],
        owner: json['owner'],
        emailOwner: json['emailOwner'],
        batch: json['batch'],
        isHalf: json['isHalf'],
        isUsed: json['isUsed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner': owner,
        'emailOwner': emailOwner,
        'batch' : batch,
        'isHalf': isHalf,
        'isUsed': isUsed
      };
}
