// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_bloc.dart';
import '../../../../resources/transicion_pagina.dart';
import '../pee_page.dart';
import 'dialog_paste_excel.dart';

class PeeBotonPegarExcel extends StatefulWidget {
  final bool esProyecto;
  const PeeBotonPegarExcel({
    required this.esProyecto,
    super.key,
  });

  @override
  State<PeeBotonPegarExcel> createState() => _PeeBotonPegarExcelState();
}

class _PeeBotonPegarExcelState extends State<PeeBotonPegarExcel> {
  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) =>
        Navigator.pushReplacement(context, createRoute(page));
    return ElevatedButton(
      child: const Text('Pegar datos de Excel'),
      onPressed: () async {
        bool seLogroPegar = await context
            .read<MainBloc>()
            .proyeccionEspEdit
            .pegarExcel
            .seLogroPegar;
        if (!seLogroPegar) {
          showDialog(
            context: context,
            builder: (context) {
              return const PasteExcelDialog();
            },
          );
        } else {
          await Future.delayed(const Duration(seconds: 1));
          goTo(ProyeccionEspEdicionPage(esProyecto: widget.esProyecto));
        }
      },
    );
  }
}
