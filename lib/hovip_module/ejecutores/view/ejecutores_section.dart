import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';
import '../../hovip/view/section_card.dart';
import '../../hovip/view/simple_label.dart';
import '../model/ejecutores_reg_model.dart';
import 'modificar_dialog.dart';

class EjecutoresSection extends StatefulWidget {
  const EjecutoresSection({super.key});

  @override
  State<EjecutoresSection> createState() => _EjecutoresSectionState();
}

class _EjecutoresSectionState extends State<EjecutoresSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        EjecutoresReg? ejecutor = state.hovipReg?.ejecutores;
        bool hayf34 = ejecutor?.funcional3.isNotEmpty ?? false;
        bool hayf56 = ejecutor?.funcional5.isNotEmpty ?? false;
        if (ejecutor != null) {
          return SectionCard(
            title: "EJECUTORES",
            icono: Icono.edit,
            accion: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const ModificarEjecutoresDialog();
                },
              );
            },
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleLabel(
                    title: "Id",
                    content: ejecutor.id,
                  ),
                  SimpleLabel(
                    title: "Área",
                    content: ejecutor.area.toUpperCase(),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleLabel(
                    title: "Controller",
                    content: ejecutor.controller.toUpperCase(),
                  ),
                  SimpleLabel(
                    title: "Project Manager",
                    content: ejecutor.pm.toUpperCase(),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SimpleLabel(
                    title: "Funcional 1 (FEM)",
                    content: ejecutor.funcional1.toUpperCase(),
                  ),
                  SimpleLabel(
                    title: "Funcional 2",
                    content: ejecutor.funcional2.toUpperCase(),
                  ),
                ],
              ),
              if (hayf34)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SimpleLabel(
                      title: "Funcional 3",
                      content: ejecutor.funcional3.toUpperCase(),
                    ),
                    SimpleLabel(
                      title: "Funcional 4",
                      content: ejecutor.funcional3.toUpperCase(),
                    ),
                  ],
                ),
              if (hayf56)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SimpleLabel(
                      title: "Funcional 5",
                      content: ejecutor.funcional5.toUpperCase(),
                    ),
                    SimpleLabel(
                      title: "Funcional 6",
                      content: ejecutor.funcional6.toUpperCase(),
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
