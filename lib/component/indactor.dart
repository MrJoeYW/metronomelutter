import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class IndactorRow extends StatelessWidget {
  final int nowStep;
  final int stepLength;

  IndactorRow(this.nowStep, this.stepLength);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final List steps = List.filled(stepLength, null);
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: steps
                  .asMap()
                  .entries
                  .map((entry) => Container(
                        margin: EdgeInsets.symmetric(horizontal: stepLength > 6 ? 10 : 20),
                        width: entry.key == 0 ? 35.0 : 25.0,
                        height: entry.key == 0 ? 35.0 : 25.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: this.nowStep > -1 &&
                                    (this.nowStep % steps.length) == entry.key
                                ? Colors.blue
                                : Colors.grey[300]),
                      ))
                  .toList()),
        ),
      );
    });
  }
}
