import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/main_bloc.dart';
import '../../hovip/view/section_card.dart';
import '../../hovip/view/simple_label.dart';
import '../../proyectos/model/proyectos_reg.dart';
import '../model/fem_list_model.dart';

class FemSection extends StatefulWidget {
  const FemSection({super.key});

  @override
  State<FemSection> createState() => _FemSectionState();
}

class _FemSectionState extends State<FemSection> {
  @override
  void initState() {
    FemList? femList = context.read<MainBloc>().state.femList;
    if (femList == null) {
      context.read<MainBloc>().femListController.obtener;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        FemList? femList = state.femList;
        ProyectosReg proyecto = state.hovipReg!.proyecto;
        if (femList == null && state.isLoading) {
          return SectionCard(
            title: "FEM",
            icono: Icono.link,
            accion: () {
              launchUrl(Uri.parse("https://fem2pmc.web.app/"));
            },
            children: const [
              Spacer(),
              Center(child: CircularProgressIndicator()),
              Spacer(),
            ],
          );
        }
        if (femList != null) {
          return SectionCard(
            title: "FEM",
            icono: Icono.link,
            accion: () {
              launchUrl(Uri.parse("https://fem2pmc.web.app/"));
            },
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleLabel(
                    title: "2024",
                    content: femList.list
                        .where(
                          (e) =>
                              e.proyecto == proyecto.proyecto &&
                              e.year == "2024",
                        )
                        .length
                        .toString(),
                  ),
                  SimpleLabel(
                    title: "2025",
                    content: femList.list
                        .where(
                          (e) =>
                              e.proyecto == proyecto.proyecto &&
                              e.year == "2025",
                        )
                        .length
                        .toString(),
                  ),
                  SimpleLabel(
                    title: "2026",
                    content: femList.list
                        .where(
                          (e) =>
                              e.proyecto == proyecto.proyecto &&
                              e.year == "2026",
                        )
                        .length
                        .toString(),
                  ),
                  SimpleLabel(
                    title: "2027",
                    content: femList.list
                        .where(
                          (e) =>
                              e.proyecto == proyecto.proyecto &&
                              e.year == "2027",
                        )
                        .length
                        .toString(),
                  ),
                  SimpleLabel(
                    title: "2028",
                    content: femList.list
                        .where(
                          (e) =>
                              e.proyecto == proyecto.proyecto &&
                              e.year == "2028",
                        )
                        .length
                        .toString(),
                  ),
                ],
              ),
              const Spacer(),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
