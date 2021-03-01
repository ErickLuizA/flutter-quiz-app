import 'package:flutter/material.dart';

class StatisticItemWidget extends StatelessWidget {
  final String text;
  final String result;

  const StatisticItemWidget({
    Key key,
    @required this.text,
    @required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          result,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
