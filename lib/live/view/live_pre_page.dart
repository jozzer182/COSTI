import 'package:collection/collection.dart';
import 'package:costii/live/view/live_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/transicion_pagina.dart';

class LivePrePage extends StatefulWidget {
  const LivePrePage({super.key});

  @override
  State<LivePrePage> createState() => _LivePrePageState();
}

class _LivePrePageState extends State<LivePrePage> {
  List<String> areas = [];
  List<String> pms = [];

  @override
  void initState() {
    areas = context
            .read<MainBloc>()
            .state
            .liveList
            ?.list
            .map(
              (e) => e.area,
            )
            .toSet()
            .toList() ??
        [];
    pms = context
            .read<MainBloc>()
            .state
            .liveList
            ?.list
            .map(
              (e) => e.ejecutoresReg.pm.toUpperCase(),
            )
            .toSet()
            .toList() ??
        [];
    pms.sort();
    areas.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Estado Revisión'),
            actions: [
              TextButton(
                onPressed: () {
                  goTo(const LivePage());
                },
                child: const Text('Ir a LIVE'),
              ),
              const Gap(10),
            ],
          ),
          body: Row(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PROJECTS MANAGERS',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        for (var reg in pms) TilePM(reg: reg),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          const Text(
                            'ÁREAS',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          for (var reg in areas) TileArea(reg: reg),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        goTo(const LivePage());
                      },
                      child: const Text('Ir a LIVE'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TileArea extends StatelessWidget {
  const TileArea({
    super.key,
    required this.reg,
  });

  final String reg;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        int? totalFilas = state.liveList?.list
            .where((e) =>
                e.ejecutoresReg.area.toUpperCase() == reg.toUpperCase() &&
                !e.naturaleza.startsWith('Otros'))
            .length;
        int? totalRevisadas = state.liveList?.list
            .where((e) =>
                e.ejecutoresReg.area.toUpperCase() == reg.toUpperCase() &&
                !e.naturaleza.startsWith('Otros') &&
                e.proyeccionEsp.any((e) => e.revisado.toUpperCase() == 'TRUE'))
            .length;
        String avance = '-';
        if (totalFilas != null && totalRevisadas != null && totalFilas != 0) {
          avance =
              '${((totalRevisadas / totalFilas) * 100).toStringAsFixed(0)}%';
        }
        String controller = state.ejecutoresList?.list
                .firstWhereOrNull(
                    (e) => e.area.toUpperCase() == reg.toUpperCase())
                ?.controller ??
            '-';
        void goTo(Widget page) => Navigator.push(context, createRoute(page));
        return InkWell(
          onTap: () {
            goTo(LivePage(area: reg));
          },
          child: Card(
            child: ListTile(
              title: Text(reg),
              subtitle: Text(controller.toLowerCase()),
              trailing: Text(
                '$avance\n${totalRevisadas ?? "-"}/${totalFilas ?? "-"}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TilePM extends StatelessWidget {
  const TilePM({
    super.key,
    required this.reg,
  });

  final String reg;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        int? totalFilas = state.liveList?.list
            .where((e) =>
                e.ejecutoresReg.pm.toUpperCase() == reg.toUpperCase() &&
                !e.naturaleza.startsWith('Otros'))
            .length;
        int? totalRevisadas = state.liveList?.list
            .where((e) =>
                e.ejecutoresReg.pm.toUpperCase() == reg.toUpperCase() &&
                !e.naturaleza.startsWith('Otros') &&
                e.proyeccionEsp.any((e) => e.revisado.toUpperCase() == 'TRUE'))
            .length;
        String avance = '-';
        if (totalFilas != null && totalRevisadas != null) {
          avance =
              '${((totalRevisadas / totalFilas) * 100).toStringAsFixed(0)}%';
        }
         void goTo(Widget page) => Navigator.push(context, createRoute(page));
        return InkWell(
          onTap: () {
            goTo(LivePage(pm: reg));
          },
          child: Card(
            child: ListTile(
              title: Text(reg),
              subtitle: Text(state.ejecutoresList?.list
                      .firstWhereOrNull((e) => e.pm.toUpperCase() == reg)
                      ?.area ??
                  ''),
              trailing: Text(
                '$avance\n${totalRevisadas ?? "-"}/${totalFilas ?? "-"}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}
