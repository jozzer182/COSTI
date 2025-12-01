import 'package:costii/hovip_module/ejecutores/model/ejecutores_list_model.dart';
import 'package:costii/hovip_module/ejecutores/view/razon_dialog.dart';
import 'package:costii/hovip_module/proyectos/model/proyectos_reg.dart';
import 'package:costii/resources/validar_enel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/main_bloc.dart';
import '../../../resources/to_menu.dart';
import '../model/ejecutores_reg_model.dart';

class ModificarEjecutoresDialog extends StatefulWidget {
  const ModificarEjecutoresDialog({super.key});

  @override
  State<ModificarEjecutoresDialog> createState() =>
      _ModificarEjecutoresDialogState();
}

class _ModificarEjecutoresDialogState extends State<ModificarEjecutoresDialog> {
  List<String> areas = [];
  List<String> controllers = [];
  List<String> pms = [];
  List<String> funcionales = [];
  TextEditingController area = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController pm = TextEditingController();
  TextEditingController funcional1 = TextEditingController();
  TextEditingController funcional2 = TextEditingController();
  TextEditingController funcional3 = TextEditingController();
  TextEditingController funcional4 = TextEditingController();
  TextEditingController funcional5 = TextEditingController();
  TextEditingController funcional6 = TextEditingController();
  EjecutoresReg? ejecutor;
  EjecutoresList? ejecutores;

  @override
  void initState() {
    ejecutor = context.read<MainBloc>().state.hovipReg?.ejecutores;
    area.text = ejecutor?.area.toUpperCase() ?? "Error";
    controller.text = ejecutor?.controller.toUpperCase() ?? "Error";
    pm.text = ejecutor?.pm.toUpperCase() ?? "Error";
    funcional1.text = ejecutor?.funcional1.toUpperCase() ?? "Error";
    funcional2.text = ejecutor?.funcional2.toUpperCase() ?? "Error";
    funcional3.text = ejecutor?.funcional3.toUpperCase() ?? "Error";
    funcional4.text = ejecutor?.funcional4.toUpperCase() ?? "Error";
    funcional5.text = ejecutor?.funcional5.toUpperCase() ?? "Error";
    funcional6.text = ejecutor?.funcional6.toUpperCase() ?? "Error";

    area.addListener(() => setState(() {}));
    controller.addListener(() => setState(() {}));
    pm.addListener(() => setState(() {}));
    funcional1.addListener(() => setState(() {}));
    funcional2.addListener(() => setState(() {}));
    funcional3.addListener(() => setState(() {}));
    funcional4.addListener(() => setState(() {}));
    funcional5.addListener(() => setState(() {}));
    funcional6.addListener(() => setState(() {}));

    ejecutores = context.read<MainBloc>().state.ejecutoresList;
    areas = ejecutores?.areas ?? [];
    controllers = ejecutores?.controllers ?? [];
    pms = ejecutores?.pms ?? [];
    funcionales = ejecutores?.funcionales ?? [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (ejecutor == null || ejecutores == null) {
          return const Dialog(
            child: CircularProgressIndicator(),
          );
        }
        ProyectosReg proyecto = state.hovipReg!.proyecto;
        bool validArea = areas.contains(area.text);
        bool validController = validarEmailEnel(controller.text);
        bool validPm = validarEmailEnel(pm.text);
        bool validFun1 = validarEmailEnelEmpty(funcional1.text);
        bool validFun2 = validarEmailEnelEmpty(funcional2.text);
        bool validFun3 = validarEmailEnelEmpty(funcional3.text);
        bool validFun4 = validarEmailEnelEmpty(funcional4.text);
        bool validFun5 = validarEmailEnelEmpty(funcional5.text);
        bool validFun6 = validarEmailEnelEmpty(funcional6.text);

        return AlertDialog(
          title: const Text('Modificar Ejecutores'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu(
                label: const Text("Área"),
                errorText: validArea ? null : "Error",
                controller: area,
                dropdownMenuEntries: toMenu(areas),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu(
                    label: const Text("Controller"),
                    errorText: validController ? null : "Error",
                    controller: controller,
                    dropdownMenuEntries: toMenu(controllers),
                    enableFilter: true,
                  ),
                  const Gap(5),
                  DropdownMenu(
                    label: const Text("Project Manager"),
                    errorText: validPm ? null : "Error",
                    controller: pm,
                    dropdownMenuEntries: toMenu(pms),
                    enableFilter: true,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  DropdownMenu(
                    label: const Text("Funcional 1 (FEM)"),
                    errorText: validFun1 ? null : "Error",
                    controller: funcional1,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                  const Gap(5),
                  DropdownMenu(
                    label: const Text("Funcional 2"),
                    errorText: validFun2 ? null : "Error",
                    controller: funcional2,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  DropdownMenu(
                    label: const Text("Funcional 3"),
                    errorText: validFun3 ? null : "Error",
                    controller: funcional3,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                  const Gap(5),
                  DropdownMenu(
                    label: const Text("Funcional 4"),
                    errorText: validFun4 ? null : "Error",
                    controller: funcional4,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  DropdownMenu(
                    label: const Text("Funcional 5"),
                    errorText: validFun5 ? null : "Error",
                    controller: funcional5,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                  const Gap(5),
                  DropdownMenu(
                    label: const Text("Funcional 6"),
                    errorText: validFun6 ? null : "Error",
                    controller: funcional6,
                    dropdownMenuEntries: toMenu(funcionales),
                    enableFilter: true,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: !validArea
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) => RazonModEjecDialog(
                          EjecutoresReg(
                            id: ejecutor?.id??"",
                            area: area.text,
                            controller: controller.text,
                            pm: pm.text,
                            idproyecto: proyecto.id,
                            proyecto: proyecto.proyecto,
                            funcional1: funcional1.text,
                            funcional2: funcional2.text,
                            funcional3: funcional3.text,
                            funcional4: funcional4.text,
                            funcional5: funcional5.text,
                            funcional6: funcional6.text,
                            razon: "",
                            fecha: DateTime.now().toString(),
                            persona: state.user?.correo.toUpperCase() ?? "Error",
                          ),
                        ),
                      );
                    },
              child: const Text("Aceptar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
