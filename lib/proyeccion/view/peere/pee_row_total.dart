import 'package:costii/bdg/model/bdg_reg.dart';
import 'package:costii/resources/constants/colors_const.dart';
import 'package:costii/resources/constants/meses.dart';
import 'package:costii/resources/toCurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/main_bloc.dart';
import '../../model/proyeccion_esp_edit.dart';
import '../../model/proyeccion_reg_esp.dart';

class ProyAcumRow extends StatefulWidget {
  const ProyAcumRow({
    super.key,
  });

  @override
  State<ProyAcumRow> createState() => _ProyAcumRowState();
}

class _ProyAcumRowState extends State<ProyAcumRow> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.pCopy == null) {
          return const SizedBox.shrink();
        }
        ProyeccionEspEdit proyeccion = state.pCopy ?? ProyeccionEspEdit();
        //Material
        List<ProyeccionRegEsp> listMaterial = proyeccion.list
            .where((e) => e.naturaleza.toUpperCase().contains("MAT"))
            .toList();
        Map<int, int> bdgMaterial = proyeccion.bdg
            .firstWhere(
              (e) => e.naturaleza.toUpperCase().contains("MAT"),
              orElse: () => BdgReg.fromInit(),
            )
            .mAcum;
        Map<int, int> proyMaterial = proyeccion.calculo.mAcum(listMaterial);

        //Servicios
        List<ProyeccionRegEsp> listServicios = proyeccion.list
            .where((e) => e.naturaleza.toUpperCase().contains("SER"))
            .toList();
        Map<int, int> bdgServicios = proyeccion.bdg
            .firstWhere(
              (e) => e.naturaleza.toUpperCase().contains("SER"),
              orElse: () => BdgReg.fromInit(),
            )
            .mAcum;
        Map<int, int> proyServicios = proyeccion.calculo.mAcum(listServicios);

        //Otros
        List<ProyeccionRegEsp> listOtros = proyeccion.list
            .where((e) => e.naturaleza.toUpperCase().contains("OTR"))
            .toList();
        Map<int, int> bdgOtros = proyeccion.bdg
            .where((e) => e.naturaleza.toUpperCase().contains("OTR"))
            .first
            .mAcum;
        Map<int, int> proyOtros = proyeccion.calculo.mAcum(listOtros);

        Color? color = Colors.grey[800];
        Color colorBdg = colorCUS;
        if (proyeccion.proyectosReg.macroc.toUpperCase().contains("DEV")) {
          colorBdg = colorDEV;
        }
        if (proyeccion.proyectosReg.macroc.toUpperCase().contains("MAN")) {
          colorBdg = colorMAN;
        }
        return Column(
          children: [
            if (listMaterial.isNotEmpty)
              RowMacroC(
                title: "MAT",
                description: "Materiales",
                colorBDG: colorBdg,
                color: color,
                bdg: bdgMaterial,
                proy: proyMaterial,
                proyReg: listMaterial.first,
              ),
            if (listMaterial.isNotEmpty)
              RowMacroC(
                title: "SER",
                description: "Servicios",
                colorBDG: colorBdg,
                color: color,
                bdg: bdgServicios,
                proy: proyServicios,
                proyReg: listServicios.first,
              ),
            if (listMaterial.isNotEmpty)
              RowMacroC(
                title: "OTR",
                description: "Otros Costos",
                colorBDG: colorBdg,
                color: color,
                bdg: bdgOtros,
                proy: proyOtros,
                proyReg: listOtros.first,
              ),
          ],
        );
      },
    );
  }
}

class RowMacroC extends StatelessWidget {
  const RowMacroC({
    super.key,
    required this.colorBDG,
    required this.color,
    required this.bdg,
    required this.proy,
    required this.proyReg,
    required this.description,
    required this.title,
  });

  final Color? colorBDG;
  final Color? color;
  final Map<int, int> bdg;
  final Map<int, int> proy;
  final ProyeccionRegEsp proyReg;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double textSize = 15.0;
    if (screenHeight < 600) textSize = 9;

    return Row(
      key: UniqueKey(),
      children: [
        const Expanded(flex: 4, child: SizedBox.shrink()),
        Expanded(
          flex: 7,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Acumulado\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSize - 2,
                        ),
                      ),
                      TextSpan(
                        text: 'Millones de Pesos',
                        style: TextStyle(
                          fontSize: textSize - 2,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Tooltip(
                message: description,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: colorBDG,
                  ),
                ),
              ),
              if (screenHeight > 600) const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tooltip(
                    message:
                        'Real para el pasado, Proyección para el presente u futuro.',
                    child: Text(
                      'PROY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: textSize,
                        color: color,
                      ),
                    ),
                  ),
                  Text(
                    'BDG',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                      color: colorBDG,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        for (int mes in meses)
          Expanded(
            flex: 2,
            child: Tooltip(
              message: -(bdg[mes] ?? 0) + (proy[mes] ?? 0) > 0
                  ? "+" + enMillon1(-(bdg[mes] ?? 0) + (proy[mes] ?? 0))
                  : enMillon1(-(bdg[mes] ?? 0) + (proy[mes] ?? 0)),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: enMillon1(proy[mes] ?? 0),
                              style: TextStyle(
                                fontSize: textSize - 1,
                                // color: proyReg.getActiveByMonth(mes)
                                //     ? color
                                //     : Colors.green[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (screenHeight > 600) const Gap(5),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: enMillon1(bdg[mes] ?? 0),
                              style: TextStyle(
                                color: colorBDG,
                                fontSize: textSize - 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        // const Expanded(
        //   flex: 2,
        //   child: SizedBox.shrink(),
        // ),
        const Gap(40),
      ],
    );
  }
}
