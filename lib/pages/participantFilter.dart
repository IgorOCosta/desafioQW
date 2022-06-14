import 'package:desafio/models/batch.dart';
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
  final List batchs;
  final Function applyFilter;
  final Function clearFilter;
  final Filter filter;

  @override
  State<ParticipantFilterPage> createState() => _ParticipantFilterPageState();
}

class _ParticipantFilterPageState extends State<ParticipantFilterPage> {
  var _isUsed = false;
  var _isntUsed = false;
  var _modalSelect;
  List _batch = [];
  var _clean = true;
  int radioValue = -1;

  @override
  Widget build(BuildContext context) {
    _modalSelect = widget.batchs.first.toString();

    void ApplyFilter() {
      Filter newFilter;
      List applyBatch = [];
      if (radioValue == -1) {
        for (int i = 0; i < widget.batchs.length; i++) {
          applyBatch.add(widget.batchs.elementAt(i));
        }
      } else {
        applyBatch.add(widget.batchs.elementAt(radioValue));
      }
      newFilter = Filter(
          isUsed: _isUsed,
          isntUsed: _isntUsed,
          batch: applyBatch,
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

    // appendBatchFilterAll() {
    //   _batch.clear();
    //   for (int i = 1; i < widget.batchs+1; i++) {
    //     _batch.add(i);
    //   }
    // }

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    AppLocalizations.of(context)!.allAffiliates,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _ModalBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFf3ebf5), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            radioValue == -1
                                ? AppLocalizations.of(context)!.allAffiliates
                                : widget.batchs.elementAt(radioValue),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
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

  void _ModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setStateModal /*You can rename this!*/) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFF6f2694),
                            border: Border.all(
                                color: Color(0xFF6f2694), width: 3.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      AppLocalizations.of(context)!.selectTicketType,
                      style: TextStyle(
                          color: Color(0xFF6f2694),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  RadioListTile(
                    title: Text(
                      AppLocalizations.of(context)!.allAffiliates,
                    ),
                    value: -1,
                    groupValue: radioValue,
                    activeColor: Color(0xFF6f2694),
                    onChanged: (ind) => {
                      setState(() => radioValue = ind as int),
                      setStateModal(() => radioValue = ind as int),
                       Navigator.pop(context),
                    },
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: widget.batchs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile(
                          title:
                              Text(widget.batchs.elementAt(index).toString()),
                          value: index,
                          groupValue: radioValue,
                          activeColor: Color(0xFF6f2694),
                          onChanged: (ind) => {
                            setState(() => radioValue = ind as int),
                            setStateModal(() => radioValue = ind as int),
                            Navigator.pop(context),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
