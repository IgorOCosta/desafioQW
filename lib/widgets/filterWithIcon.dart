import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterWithIcon extends StatelessWidget {
  const FilterWithIcon({Key? key, required this.onclick}) : super(key: key);
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onclick();
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFf3ebf5),
          border: Border.all(color: Color(0xFFf3ebf5), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.filter,
                style: TextStyle(
                  color: Color(0xFF6f2694),
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.commit_rounded,
                  color: Color(0xFF6f2694),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
