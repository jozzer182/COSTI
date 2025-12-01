import 'package:costii/bloc/main_bloc.dart';
import 'package:costii/live/model/live_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../real/model/real_esp_reg.dart';
import '../../../resources/constants/colors_const.dart';
import '../../model/proyeccion_reg_esp.dart';
import 'pee_row_real_dialog.dart';

class PeeRowEditField extends StatefulWidget {
  const PeeRowEditField({
    super.key,
    required this.reg,
    required this.live,
    required this.realEsp,
    required this.i,
  });

  final ProyeccionRegEsp reg;
  final int i;
  final LiveReg live;
  final RealEspReg realEsp;

  @override
  State<PeeRowEditField> createState() => _PeeRowEditFieldState();
}

class _PeeRowEditFieldState extends State<PeeRowEditField> {
  late TextEditingController controller;
  late ProyeccionRegEsp reg;
  late FocusNode focusNode;
  late LiveReg live;
  late RealEspReg realEsp;
  bool active = false;
  final NumberFormat currencyFormat = NumberFormat.decimalPattern('es_ES');

  @override
  void initState() {
    reg = widget.reg;
    live = widget.live;
    realEsp = widget.realEsp;
    controller = TextEditingController(
      text: currencyFormat.format(reg.mes(widget.i)),
    );
    focusNode = FocusNode();
    active = live.getActiveByMonth(widget.i);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _updateValue(String value) {
    final oldText = controller.text;
    final cursorPosition = controller.selection.baseOffset;
    final newValue = value.replaceAll('.', '');
    final intValue = int.tryParse(newValue) ?? 0;

    final formattedValue = currencyFormat.format(intValue);
    final newCursorPosition =
        cursorPosition + (formattedValue.length - oldText.length);

    controller.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
          offset: newCursorPosition.clamp(0, formattedValue.length)),
    );
    setState(() {});
  }

  void _submitValue(String value) {
    final newValue = value.replaceAll('.', '');
    final intValue = int.tryParse(newValue) ?? 0;

    context.read<MainBloc>().proyeccionEspEdit.change(
          id: widget.reg.id,
          mes: widget.i,
          valor: intValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return Expanded(
        flex: 2,
        child: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: TextFormField(
              onTap: () {
                if (realEsp.list.isNotEmpty && realEsp.mes(widget.i) != 0) {
                  showDialog(
                    context: context,
                    builder: (c) {
                      return PeeRowRealDialog(
                        realEsp: realEsp,
                        mes: widget.i,
                      );
                    },
                  );
                }
              },
              initialValue: currencyFormat.format(realEsp.mes(widget.i)),
              readOnly: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: colorREAL,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorREAL),
                ),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
        ),
      );
    }
    bool hayCambio = widget.reg.mes(widget.i) !=
        int.tryParse(controller.text.replaceAll('.', ''));
    return Expanded(
      flex: 2,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: TextFormField(
            // style: const TextStyle(fontSize: 12),
            controller: controller,
            focusNode: focusNode,
            onChanged: (value) {
              _updateValue(value);
              _submitValue(value);
            },
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: int.tryParse(controller.text.replaceAll('.', '')) == 0
                  ? Colors.grey[300]
                  : hayCambio
                      ? Colors.blueAccent
                      : null,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: int.tryParse(controller.text.replaceAll('.', '')) == 0
                      ? Colors.grey[100]!
                      : Colors.grey,
                ),
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
          ),
        ),
      ),
    );
  }
}
