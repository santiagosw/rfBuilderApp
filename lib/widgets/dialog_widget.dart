import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';

class AboutDialogWidget extends StatelessWidget {
  int pickingNum = 131227;
  int cantProd = 14;
  String codConso = 'FC040';
  int numConso = 84665;
  int bu = 84665;
  int di = 84665;
  int un = 84665;
  String obsasig = '';
  String obsconso = '';

  @override
  Widget build(BuildContext context) => GFButton(
        text: 'About Dialog',
        onPressed: () => showAboutDialog(
          context: context,
          applicationIcon: Icon(
            Iconsax.box_search,
            color: Colors.red,
          ),
          applicationName: 'Picking',
          applicationLegalese:
              '"Picking Nro: $pickingNum. \nAsignacion de Productos: \nCant. Prod: $cantProd. \nCod Conso: $codConso. \nNum Conso: $numConso. \nGrupo: \nBU: $bu. \nDI: $di. \nUN: $un. \nObs.Asig: $obsasig. \nObs.Conso: $obsconso."',
        ),
      );
}
