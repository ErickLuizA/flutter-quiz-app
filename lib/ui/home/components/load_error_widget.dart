import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadErrorWidget extends StatelessWidget {
  final Function retry;

  const LoadErrorWidget({
    Key key,
    @required this.retry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          color: Colors.orange[700],
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Text(
            AppLocalizations.of(context).errorCategories,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        MaterialButton(
          child: Text(AppLocalizations.of(context).tryAgain),
          minWidth: MediaQuery.of(context).size.width / 2,
          textColor: Colors.white,
          onPressed: retry,
        ),
      ],
    );
  }
}
