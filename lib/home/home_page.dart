
import 'package:costii/hovip_module/hovip/view/proyectos_page.dart';
import 'package:costii/proyeccion/view/proyeccion_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../bloc/main_bloc.dart';
import '../bdg/view/bdg_page.dart';
import '../grafica/view/grafica_page.dart';
import '../live/view/live_page.dart';
import '../live/view/live_pre_page.dart';
import '../real/view/real_year_page.dart';
import '../resources/transicion_pagina.dart';
import '../version.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double elevationCard1 = 1.0;
  double elevationCard2 = 1.0;
  double elevationCard3 = 1.0;
  double elevationCard4 = 1.0;
  double elevationCard5 = 1.0;
  @override
  Widget build(BuildContext context) {
    // Color primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    // Color onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    // Color tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;
    // Color onTertiaryContainer =
    //     Theme.of(context).colorScheme.onTertiaryContainer;
    // Color secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    // Color onSecondaryContainer =
    //     Theme.of(context).colorScheme.onSecondaryContainer;
    // Color background = Theme.of(context).colorScheme.background;
    // Color onBackground = Theme.of(context).colorScheme.onBackground;
    Color primary = Theme.of(context).colorScheme.primary;
    Color tertiary = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "",
                style: TextStyle(
                  color: tertiary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: "COSTI",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocSelector<MainBloc, MainState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              // print('called');
              return state ? const LinearProgressIndicator() : const SizedBox();
            },
          ),
        ),
        actions: [
          Tooltip(
            message: 'Recargar datos',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(Load());
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Cambiar color',
            child: IconButton(
              onPressed: () {
                showDialog(
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Escoge un color'),
                      content: SingleChildScrollView(
                        child: MaterialColorPicker(
                          allowShades: false,
                          onMainColorChange: (value) {
                            BlocProvider.of<MainBloc>(context).add(
                              ThemeColorChange(
                                color: Color(
                                  int.parse(
                                    value.toString().substring(
                                          value.toString().indexOf('Color(0') +
                                              6,
                                          value.toString().indexOf(')'),
                                        ),
                                  ),
                                ),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                  context: context,
                );
              },
              icon: const Icon(Icons.color_lens),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cambiar tema',
            child: IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(ThemeChange());
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Cerrar sesión',
            child: ElevatedButton(
              child: const Text('Salir'),
              onPressed: () async => await FirebaseAuth.instance.signOut(),
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Version.data,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              Version.status('Home', '$runtimeType'),
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: SingleChildScrollView(
        child: BlocListener<MainBloc, MainState>(
          listenWhen: (previous, current) =>
              previous.errorCounter != current.errorCounter,
          listener: (context, state) {
            // ignore: avoid_print
            print(state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 8),
                backgroundColor: state.messageColor,
                content: Text(state.message),
              ),
            );
          },
          child: BlocListener<MainBloc, MainState>(
            listenWhen: (previous, current) =>
                previous.dialogCounter != current.dialogCounter,
            listener: (context, state) {
              // ignore: avoid_print
              print(state.dialogMessage);
              if (state.dialogMessage.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text('Atención'),
                      content: Text(state.dialogMessage),
                      actions: [
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     const Gap(5),
                      //     Text('1 Dólar: ${state.usdcop?.close} pesos'),
                      //     const Gap(10),
                      //     Text('1 Euro: ${state.eurcop?.close} pesos'),
                      //   ],
                      // ),
                      // const Text('Seguimiento Odas'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const LivePrePage(),
                            title: 'LIVE',
                            image: 'images/live.png',
                            enabled: state.liveList != null,
                          ),
                          SimpleCard(
                            page: const GraficaPage(),
                            title: 'LIVE Gráfica',
                            image: 'images/trend.png',
                            enabled:  false,
                            // state.liveList != null,
                          ),

                        ],
                      ),
                      const Text('Inspección Datos'),
                      const Gap(10),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        children: [
                          SimpleCard(
                            page: const BdgPage(),
                            title: 'BDG',
                            image: 'images/budget.png',
                            enabled: state.bdgList != null,
                          ),
                          SimpleCard(
                            page: const RealYearPage(),
                            title: 'REAL',
                            image: 'images/real.png',
                            enabled: state.realList != null,
                          ),
                          SimpleCard(
                            page: const ProyeccionPage(),
                            title: 'Proyección',
                            image: 'images/proyeccion.png',
                            enabled: state.proyeccionList != null,
                          ),
                          SimpleCard(
                            page: const HovipProyectosPage(),
                            title: 'HOVIP',
                            image: 'images/planning.png',
                            enabled: state.hovipList != null,
                          ),
                        ],
                      ),
                      const Gap(10),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleCard extends StatelessWidget {
  final dynamic page;
  final String title;
  final String image;
  final Function? fun;
  final Color? color;
  final bool enabled;

  const SimpleCard({
    required this.page,
    required this.title,
    required this.image,
    required this.enabled,
    this.color,
    this.fun,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return Opacity(
      opacity: enabled ? 1 : 0.1,
      child: SizedBox(
        width: 148.0,
        child: Card(
          color: color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              if (page is Widget) {
                try {
                  goTo(page);
                } finally {
                  if (fun != null) fun!();
                }
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 12,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
