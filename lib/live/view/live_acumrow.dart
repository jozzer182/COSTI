import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:costii/resources/constants/colors_const.dart';
import 'package:costii/resources/constants/meses.dart';
import 'package:costii/resources/to_mcop.dart';

import '../../bloc/main_bloc.dart';
import '../model/live_reg.dart';

class LiveAcumRow extends StatefulWidget {
  final List<LiveReg> liveList;
  const LiveAcumRow({
    required this.liveList,
    super.key,
  });

  @override
  State<LiveAcumRow> createState() => _LiveAcumRowState();
}

class _LiveAcumRowState extends State<LiveAcumRow> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.liveList == null) {
          return const SizedBox.shrink();
        }
        //Costumers
        List<LiveReg> listCostumers = widget.liveList
            .where((e) => e.proyectosReg.macroc.toUpperCase().contains("CUS"))
            .toList();
        Map<int, int> bdgCostumers =
            state.liveList?.mAcumBDG(listCostumers) ?? {};
        Map<int, int> liveCostumers =
            state.liveList?.mAcum(listCostumers) ?? {};

        //Development
        List<LiveReg> listDevelopment = widget.liveList
            .where((e) => e.proyectosReg.macroc.toUpperCase().contains("DEV"))
            .toList();
        Map<int, int> bdgDevelopment =
            state.liveList?.mAcumBDG(listDevelopment) ?? {};
        Map<int, int> liveDevelopment =
            state.liveList?.mAcum(listDevelopment) ?? {};

        //Management
        List<LiveReg> listManagement = widget.liveList
            .where((e) => e.proyectosReg.macroc.toUpperCase().contains("MAN"))
            .toList();
        Map<int, int> bdgManagement =
            state.liveList?.mAcumBDG(listManagement) ?? {};
        Map<int, int> liveManagement =
            state.liveList?.mAcum(listManagement) ?? {};

        Color? color = Colors.grey[800];
        // Color? colorBDG = Colors.blue[800];
        // LiveReg liveReg = LiveReg();
        // if (widget.liveList.isNotEmpty) {
        //   liveReg = widget.liveList.first;
        // }
        return Column(
          children: [
            if (listCostumers.isNotEmpty)
              RowMacroC(
                title: "CUS",
                description: "Customers",
                colorBDG: colorCUS,
                color: color,
                bdg: bdgCostumers,
                live: liveCostumers,
                liveReg: listCostumers.first,
              ),
            const Gap(5),
            if (listDevelopment.isNotEmpty)
              RowMacroC(
                title: "DEV",
                description: "Asset\nDevelopment",
                colorBDG: colorDEV,
                color: color,
                bdg: bdgDevelopment,
                live: liveDevelopment,
                liveReg: listDevelopment.first,
              ),
            const Gap(5),
            if (listManagement.isNotEmpty)
              RowMacroC(
                title: "MAN",
                description: "Asset\nManagement",
                colorBDG: colorMAN,
                color: color,
                bdg: bdgManagement,
                live: liveManagement,
                liveReg: listManagement.first,
              ),
          ],
        );
      },
    );
  }
}

class RowMacroC extends StatelessWidget {
  const RowMacroC({
    Key? key,
    required this.colorBDG,
    required this.color,
    required this.bdg,
    required this.live,
    required this.liveReg,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Color? colorBDG;
  final Color? color;
  final Map<int, int> bdg;
  final Map<int, int> live;
  final LiveReg liveReg;
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
                        text: 'Miles de Millones',
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
                      'LIVE',
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
              message: -(bdg[mes] ?? 0) + (live[mes] ?? 0) > 0
                  ? "+" + toMMCOP(-(bdg[mes] ?? 0) + (live[mes] ?? 0))
                  : toMMCOP(-(bdg[mes] ?? 0) + (live[mes] ?? 0)),
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
                              text: toMMCOP(live[mes] ?? 0),
                              style: TextStyle(
                                color: liveReg.getActiveByMonth(mes)
                                    ? color
                                    : Colors.green[800],
                                fontSize: textSize - 1,
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
                              text: toMMCOP(bdg[mes] ?? 0),
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
        const Expanded(
          flex: 2,
          child: SizedBox.shrink(),
        ),
        const Gap(40),
      ],
    );
  }
}
