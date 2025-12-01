import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../real/model/real_esp_reg.dart';

class PeeRowRealDialog extends StatefulWidget {
  const PeeRowRealDialog({
    required this.mes,
    required this.realEsp,
    super.key,
  });
  final RealEspReg realEsp;
  final int mes;

  @override
  State<PeeRowRealDialog> createState() => _PeeRowRealDialogState();
}

class _PeeRowRealDialogState extends State<PeeRowRealDialog> {
  late RealEspReg realEsp;
  final NumberFormat currencyFormat = NumberFormat.decimalPattern('es_ES');

  @override
  void initState() {
    realEsp = widget.realEsp;
    realEsp.list = realEsp.list
        .where((e) => e.mes.startsWith(widget.mes.toString().padLeft(2, '0')))
        .toList();
    if (realEsp.list.isNotEmpty) {
      realEsp.list
          .sort((a, b) => a.documentocompras.compareTo(b.documentocompras));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var reg in realEsp.list)
                Card(
                  child: ListTile(
                    leading: Tooltip(
                      message: reg.nomusuario,
                      child: Text(reg.documentocompras),
                    ),
                    subtitle: Text(reg.denominacionobjeto),
                    title: Text(reg.proveedor),
                    trailing:
                        Text(currencyFormat.format(reg.valormonedaobjeto)),
                  ),
                )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}
