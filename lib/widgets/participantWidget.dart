import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/ticket.dart';

class ParticipantWidget extends StatelessWidget {
  const ParticipantWidget({Key? key, required this.ticket}) : super(key: key);
  final Ticket ticket; 


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ticket.owner,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ticket.isHalf? Text(AppLocalizations.of(context)!.halfTicket + " "+ ticket.batch.toString() + "º "+ AppLocalizations.of(context)!.batch) : 
                  Text(AppLocalizations.of(context)!.ticket + " "+ ticket.batch.toString() + "º "+ AppLocalizations.of(context)!.batch),
                ),
                Text(ticket.id),
              ],
            ),
            ticket.isUsed?
            Icon(
              Icons.check,
              color: Colors.green,
            ): Container(),
          ],
        ),
      ],
    );
  }
}
