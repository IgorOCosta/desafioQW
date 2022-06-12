import 'package:desafio/data/event_data.dart';
import 'package:desafio/models/event.dart';
import 'package:desafio/models/filter.dart';
import 'package:desafio/pages/participantFilter.dart';
import 'package:desafio/widgets/filterWithIcon.dart';
import 'package:desafio/widgets/searchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/tickets_data.dart';
import '../widgets/defaultAppBar.dart';
import 'package:desafio/models/ticket.dart';

import '../widgets/participantWidget.dart';

class ParticipantListPage extends StatefulWidget {
  const ParticipantListPage({Key? key}) : super(key: key);

  @override
  State<ParticipantListPage> createState() => _ParticipantListPageState();
}

class _ParticipantListPageState extends State<ParticipantListPage> {
  late List<Event> event;
  late List<Ticket> tickets;
  int batchQuantity = eventList.first.batchs;
  late Filter filter = Filter(
      isHalf: true,
      isInteger: true,
      isntUsed: true,
      isUsed: true,
      batch: [],
      clean: false);
  String query = '';

  @override
  void initState() {
    super.initState();
    event = eventList;
    tickets = ticketsList;
    for (int i = 0; i < batchQuantity; i++) {
      filter.batch.add(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: DefaultAppBar(
            title: AppLocalizations.of(context)!.filterParticipants),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: SearchWidget(
                hintText: AppLocalizations.of(context)!.filterLabel,
                onChanged: textFilter),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  tickets.length.toString() +
                      " " +
                      AppLocalizations.of(context)!.participants,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6f2694),
                    fontSize: 18,
                  ),
                ),
                FilterWithIcon(
                  onclick: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ParticipantFilterPage(
                          filter: filter,
                            applyFilter: applyFilter,
                            clearFilter: clearFilter,batchs: batchQuantity),
                      ),
                    )
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: tickets.length,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Color(0xFFe6e6e6),
                  height: 25,
                  thickness: 2,
                );
              },
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ParticipantWidget(
                    ticket: ticket,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void clearFilter() {
    this.filter = Filter(
        isHalf: true,
        isInteger: true,
        isntUsed: true,
        isUsed: true,
        batch: [],
        clean: true);

    for (int i = 0; i < batchQuantity; i++) {
      filter.batch.add(i + 1);
    }

    applyFilter(this.filter);
  }

  void applyFilter(Filter f) {
    final tickets = ticketsList.where((ticket) {
      final batch = ticket.batch;
      final isUsed = ticket.isUsed;
      final isHalf = ticket.isHalf;
      
        return f.batch.contains(batch) &&
            (f.isUsed == isUsed || f.isntUsed == !isUsed) &&
            (f.isHalf == isHalf || f.isInteger == !isHalf);
      
    }).toList();

    setState(() {
      this.tickets = tickets;
    });

  }

  void textFilter(String query) {
    final tickets = ticketsList.where((ticket) {
      final searchLower = query.toLowerCase();
      final owner = ticket.owner.toLowerCase();
      final emailOwner = ticket.emailOwner.toLowerCase();
      final ticketCode = ticket.id.toLowerCase();

      return owner.contains(searchLower) ||
          emailOwner.contains(searchLower) ||
          ticketCode.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.tickets = tickets;
    });
  }
}
