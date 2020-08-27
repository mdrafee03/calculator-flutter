import 'package:combat_engineering/screens/counter-mobility/screens/reserve-demolition/screens/pier/pier.dart';
import 'package:combat_engineering/screens/counter-mobility/screens/reserve-demolition/screens/pier/screens/borehole_pier/screens/borehole_pier_input.dart';
import 'package:combat_engineering/screens/counter-mobility/screens/reserve-demolition/screens/pier/screens/borehole_pier/screens/borehole_pier_output.dart';
import 'package:flutter/material.dart';

import '../screens/counter-mobility/counter_mobility.dart';
import '../screens/mobility/mobility.dart';
import '../screens/counter-mobility/screens/minefield-laying/screens/minefield_laying_input.dart';
import '../screens/home.dart';
import '../screens/counter-mobility/screens/minefield-laying/screens/minefield_laying_output.dart';
import '../screens/counter-mobility/screens/reserve-demolition/reserve_demolition.dart';
import '../screens/counter-mobility/screens/reserve-demolition/screens/abutment/screens/abutment_input.dart';
import '../screens/counter-mobility/screens/reserve-demolition/screens/abutment/screens/abutment_output.dart';
import './route_const.dart';

class Router {
  static Map<String, WidgetBuilder> mainRouter() {
    return <String, WidgetBuilder>{
      home: (BuildContext ctx) => Home(),
      mobility: (BuildContext ctx) => Mobility(),
      counterMobility: (BuildContext ctx) => CounterMobility(),
      minefieldLayingInput: (BuildContext ctx) => MineFieldLayingInput(),
      minefieldLayingOutput: (BuildContext ctx) => MinefieldLayingOutput(),
      reserveDemolition: (BuildContext ctx) => ReserveDemolition(),
      abutmentInput: (BuildContext ctx) => AbutmentInput(),
      abutmentOutput: (BuildContext ctx) => AbutmentOutput(),
      pier: (BuildContext ctx) => Pier(),
      boreholePierInput: (BuildContext ctx) => BoreholePierInput(),
      boreholePierOutput: (BuildContext ctx) => BoreholePierOutput(),
    };
  }
}
