import 'dart:convert';
import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/cards_data_provider.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/card_container.dart';
import 'package:campus_mobile_experimental/ui/theme/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:campus_mobile_experimental/core/data_providers/user_data_provider.dart';

class StaffIdCard extends StatefulWidget {
  StaffIdCard();
  @override
  _StaffIdCardState createState() => _StaffIdCardState();
}

class _StaffIdCardState extends State<StaffIdCard> {
  String cardId = "staff_id";

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      active: Provider.of<CardsDataProvider>(context).cardStates[cardId],
      hide: () => Provider.of<CardsDataProvider>(context, listen: false)
          .toggleCard(cardId),
      reload: () => null,
      isLoading: false,
      titleText: CardTitleConstants.titleMap[cardId],
      errorText: null,
      child: () => buildCardContent(context),
    );
  }

  //final _url = "https://stage-cwo-test.ucsd.edu/WebCards/staff_id.html";
  //final _url = "file:///Users/kevindesilva/Downloads/staff_id%20(1).html";
  final _url = "https://cwo-test.ucsd.edu/WebCards/staff_id.html";

  Widget buildCardContent(BuildContext context) {
    var nameQueryString = "name=Joe%20Employee";
    var url = _url + "?" + nameQueryString;
    return Column(
      children: <Widget>[
        Flexible(
            child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
        )),
      ],
    );
  }
}
