import 'package:costii/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/ejecutores_reg_model.dart';

class RazonModEjecDialog extends StatefulWidget {
  final EjecutoresReg ejecutoresReg;
  const RazonModEjecDialog(
    this.ejecutoresReg, {
    super.key,
  });

  @override
  State<RazonModEjecDialog> createState() => _RazonModEjecDialogState();
}

class _RazonModEjecDialogState extends State<RazonModEjecDialog> {
  TextEditingController razon = TextEditingController();

  @override
  void initState() {
    razon.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool validRazon = razon.text.length > 9;
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        EjecutoresReg ejecutores = state.hovipReg!.ejecutores!;
        String persona = state.user?.correo.toUpperCase() ?? "Error";
        return AlertDialog(
          title: const Text("Razón del Cambio"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: razon,
                decoration: InputDecoration(
                  labelText: "Razón",
                  hintText: "Realizo el cambio porque...",
                  border: const OutlineInputBorder(),
                  errorText:
                      validRazon ? null : "Longitud mínima 10 caracteres",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: !validRazon
                  ? null
                  : () {
                      context
                          .read<MainBloc>()
                          .ejecutoresRegController
                          .updateReg(
                            nuevo: widget.ejecutoresReg..razon = razon.text,
                            historico: ejecutores.copyWith(
                              razon: razon.text,
                              fecha: DateTime.now().toString(),
                              persona: persona,
                            ),
                          );
                      while (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
              child: const Text("Aceptar"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
