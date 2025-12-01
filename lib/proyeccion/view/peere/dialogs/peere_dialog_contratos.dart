import 'package:costii/contratos/model/contratos_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../model/proyeccion_reg_esp.dart';

class PEEREDialogContract extends StatefulWidget {
  final ProyeccionRegEsp reg;
  const PEEREDialogContract({
    required this.reg,
    super.key,
  });

  @override
  State<PEEREDialogContract> createState() => _PEEREDialogContractState();
}

class _PEEREDialogContractState extends State<PEEREDialogContract> {
  String filter = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        List<ContratosReg> contratos = state.contratosList?.list
                .where((e) =>
                    e.especialidad.toUpperCase() ==
                    widget.reg.especialidad.toUpperCase())
                .toList() ??
            [];
        return AlertDialog(
          title: const Text('Contratos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Búsqueda',
                  ),
                  onChanged: (value) {
                    setState(() {
                      filter = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 300,
                width: 400,
                child: ListView.builder(
                  itemCount: contratos.length,
                  itemBuilder: (c, i) {
                    return ListTile(
                      title: Text(contratos[i].proveedor),
                      subtitle: Text(contratos[i].objeto),
                      trailing: Text(contratos[i].contratos),
                      onTap: () {
                        context
                            .read<MainBloc>()
                            .proyeccionEspEdit
                            .changeContract(
                              id: widget.reg.id,
                              valor: contratos[i].contratos,
                            );
                        Navigator.of(context).pop(contratos[i].contratos);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('');
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
