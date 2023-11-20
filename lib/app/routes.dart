import 'package:flutter/material.dart';
import 'package:kdksdkskdxd/app/pages/add_team_page.dart';
import 'package:kdksdkskdxd/app/pages/clasificacion_view.dart';
import 'package:kdksdkskdxd/app/pages/info_partido_view.dart';
import 'package:kdksdkskdxd/app/pages/partidos_view.dart';
import 'package:kdksdkskdxd/app/pages/ranking_view.dart';

// Define tus rutas
final Map<String, WidgetBuilder> routes = {
  // Otras rutas aquí...
  '/clasificacion': (BuildContext context) => const MyWidget(),
  '/ranking': (BuildContext context) => const MyRankingPage(),
  '/': (BuildContext context) => const MyHomePage(),
  '/favoritos': (BuildContext context) => const MyInfoPartidoPage(),
  '/add': (BuildContext context) => const AnadirEquipo()
};
