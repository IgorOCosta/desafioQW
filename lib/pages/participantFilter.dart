import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/filter.dart';
import '../widgets/defaultAppBar.dart';
import '../widgets/defaultButton.dart';

class ParticipantFilterPage extends StatefulWidget {
  ParticipantFilterPage(
      {Key? key,
      required this.applyFilter,
      required this.clearFilter,
      required this.filter,
      required this.batchs})
      : super(key: key);
  final int batchs;
  final Function applyFilter;
  final Function clearFilter;
  final Filter filter;

  @override
  State<ParticipantFilterPage> createState() => _ParticipantFilterPageState();
}

class _ParticipantFilterPageState extends State<ParticipantFilterPage> {
  var _isHalf = false;
  var _isInteger = false;
  var _isUsed = false;
  var _isntUsed = false;
  List _batch = [];
  var _clean = true;

  @override
  Widget build(BuildContext context) {
    void ApplyFilter() {
      Filter newFilter = Filter(
          isHalf: _isHalf,
          isInteger: _isInteger,
          isUsed: _isUsed,
          isntUsed: _isntUsed,
          batch: _batch,
          clean: false);
      widget.applyFilter(newFilter);
      Navigator.pop(context);
    }

    ClearFilter() {
      widget.clearFilter();
      Navigator.pop(context);
    }

    appendBatchFilter(int x) {
      _batch.contains(x) ? _batch.remove(x) : _batch.add(x);
    }

    appendBatchFilterAll() {
      _batch.clear();
      for (int i = 1; i < widget.batchs+1; i++) {
        _batch.add(i);
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: DefaultAppBar(
            title: AppLocalizations.of(context)!.filterParticipants),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultButton(
                  function: () => {
                    setState(() {
                      _isUsed = !_isUsed;
                    })
                  },
                  title: AppLocalizations.of(context)!.checkinDone,
                  variable: _isUsed,
                ),
                defaultButton(
                  function: () => {
                    setState(() {
                      _isntUsed = !_isntUsed;
                    })
                  },
                  title: AppLocalizations.of(context)!.checkinNotDone,
                  variable: _isntUsed,
                ),
              ],
            ),
            Row(
              children: [
                defaultButton(
                  function: () => {
                    setState(() {
                      _isInteger = !_isInteger;
                    })
                  },
                  variable: _isInteger,
                  title: AppLocalizations.of(context)!.fullTicket,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(),
                ),
                defaultButton(
                  function: () => {
                    setState(() {
                      _isHalf = !_isHalf;
                    })
                  },
                  variable: _isHalf,
                  title: AppLocalizations.of(context)!.halfTicket,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.batchs + 1,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return CheckboxListTile(
                    value: this._batch.contains(index + 1),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (val) {
                      widget.batchs == index ?setState(() {
                        appendBatchFilterAll();
                      }) :
                      setState(() {
                        appendBatchFilter(index + 1);
                      });
                    },
                    title: Text(widget.batchs == index
                        ? AppLocalizations.of(context)!.allAffiliates
                        : AppLocalizations.of(context)!.ticket +
                            " " +
                            (index + 1).toString() +
                            "º " +
                            AppLocalizations.of(context)!.batch),
                  );
                },
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  defaultButton(
                    function: ClearFilter,
                    variable: false,
                    title: AppLocalizations.of(context)!.cleanFilter,
                  ),
                  defaultButton(
                    function: ApplyFilter,
                    variable: true,
                    title: AppLocalizations.of(context)!.applyFilter,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
