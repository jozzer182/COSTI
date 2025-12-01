import 'package:costii/contratos/model/contratos_reg.dart';
import 'package:costii/proyeccion/view/peere/dialogs/peere_dialog_contratos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';
import '../../../real/model/real_esp_reg.dart';
import '../../model/proyeccion_reg_esp.dart';

class PEEREContrato extends StatefulWidget {
  final int index;
  final bool esProyecto;
  final RealEspReg realEsp;
  const PEEREContrato(
    this.index, {
    required this.realEsp,
    required this.esProyecto,
    super.key,
  });

  @override
  State<PEEREContrato> createState() => _PEEREContratoState();
}

class _PEEREContratoState extends State<PEEREContrato> {
  late TextEditingController contratoCtrl;
  String proveedor = '';
  int flex = 3;

  @override
  void initState() {
    ProyeccionRegEsp reg =
        context.read<MainBloc>().state.pEdit!.list[widget.index];
    if (widget.realEsp.list.isEmpty) {
      contratoCtrl = TextEditingController(text: reg.contrato);
    } else {
      List<String> contratos =
          widget.realEsp.list.map((e) => e.contratomarco).toSet().toList();
      contratos.removeWhere((e) => e.isEmpty);
      contratoCtrl = TextEditingController(text: contratos.join(','));
      context.read<MainBloc>().proyeccionEspEdit.changeContract(
            id: reg.id,
            valor: contratos.join(','),
          );
    }
    if (!widget.esProyecto) flex = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        ProyeccionRegEsp reg =
            state.pCopy?.list[widget.index] ?? ProyeccionRegEsp.fromInit();
        bool hayCambio = reg.contrato != contratoCtrl.text;
        String primerContrato = contratoCtrl.text.contains(',')
            ? contratoCtrl.text.split(',')[0]
            : contratoCtrl.text;
        proveedor = state.contratosList?.list
                .firstWhere(
                  (e) => e.especialidad == reg.especialidad &&  e.contratos == primerContrato,
                  orElse: () => ContratosReg.fromInit(),
                )
                .proveedor ??
            '';
        return Expanded(
          flex: flex,
          child: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: reg.contrato.isNotEmpty
                  ? Tooltip(
                      message: proveedor,
                      child: textContract(context, reg, hayCambio),
                    )
                  : textContract(context, reg, hayCambio),
            ),
          ),
        );
      },
    );
  }

  TextFormField textContract(
      BuildContext context, ProyeccionRegEsp reg, bool hayCambio) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        String? contratoSelccionado = await showDialog(
          context: context,
          builder: (c) {
            return PEEREDialogContract(reg: reg);
          },
        );
        if (contratoSelccionado != null && contratoSelccionado.isNotEmpty) {
          contratoCtrl.text = contratoSelccionado;
        }
      },
      controller: contratoCtrl,
      onChanged: (value) {
        context.read<MainBloc>().proyeccionEspEdit.changeContract(
              id: reg.id,
              valor: value.toString(),
            );
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 11,
        color: hayCambio ? Colors.blueAccent : null,
      ),
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: contratoCtrl.text.isEmpty
                  ? Colors.grey[100]!
                  : Colors.grey, //para futura validacion
            ),
          )),
    );
  }
}
