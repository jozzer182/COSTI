
import 'package:firebase_auth/firebase_auth.dart';

import '../bdg/controller/bdg_list_ctrl.dart';
import '../contratos/controller/contratos_ctrl.dart';
import '../hovip_module/ejecutores/controller/ejecutores_list_ctrl.dart';
import '../hovip_module/hovip/controller/hovip_list_ctrl.dart';
import '../hovip_module/sustitutos/controller/sustitutos_list_ctrl.dart';
import '../live/controller/live_list_ctrl.dart';
import '../proyeccion/controller/proyeccion_list_ctrl.dart';
import '../hovip_module/proyectos/controller/proyectos_list_ctrl.dart';
import '../real/controller/real_list_crtl.dart';
import '../resources/future_group_add.dart';
import '../user/controller/user_action.dart';

import 'main__bl.dart';
import 'main_bloc.dart';

Future onLoadUserData(
  Load event,
  emit,
  MainState Function() state,
  void Function(MainEvent) add,
) async {
  emit(state().copyWith(isLoading: true));
  // print(FirebaseAuth.instance.currentUser?.email);

  if (FirebaseAuth.instance.currentUser?.email != null &&
      state().users != null) {
    await onCreateUser(event, emit, state);
    if (state().user != null) {
      FutureGroupDelayed futureMaster = FutureGroupDelayed();
      // FutureGroupDelayed futureGroup1 = FutureGroupDelayed();
      // FutureGroupDelayed futureGroup2 = FutureGroupDelayed();
      // futureMaster.addF(onLoadUsdcop(event, emit, state));
      // futureMaster.addF(onLoadEurcop(event, emit, state));
      // futureMaster.addF(onLoadContrato(event, emit, state));
      // futureMaster.addF(onLoadBudget(Bl(emit, state, add)));
      // futureMaster.addF(onLoadWbe(Bl(emit, state, add)));
      futureMaster.addF(BdgListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(RealListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(ProyeccionListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(ProyectosListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(EjecutoresListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(ContratosListController(Bl(emit, state, add)).obtener);
      futureMaster.addF(SustitutosListCtrl(Bl(emit, state, add)).obtener);
      // futureGroup1.addF(SegOdasController(Bl(emit, state, add)).obtener);
      // futureGroup1.close();
      // futureMaster.addF(futureGroup1.future.then((value) {
      //   onCalculateData(event, emit, state, add);
      // }));
      // futureGroup2.addF(onLoadOe(Bl(emit, state, add)));
      // futureGroup2
      //     .addF(ListadoContratoController(Bl(emit, state, add)).obtener);
      // futureGroup2
      //     .addF(ListadoPosicionesController(Bl(emit, state, add)).obtener);
      // futureGroup2.addF(ListadoOdasController(Bl(emit, state, add)).obtener);
      // futureGroup2.addF(FemListController(Bl(emit, state, add)).obtener);
      // futureGroup2.addF(onLoadPlataforma(Bl(emit, state, add)));
      // futureGroup2.addF(onLoadVersiones(Bl(emit, state, add)));
      // futureGroup2.close();
      // futureMaster.addF(futureGroup2.future.then((value) {
      //   PreanalisisListController(Bl(emit, state, add)).crear;
      // }));
      futureMaster.close();
      try {
        await futureMaster.future.then((value) {
          emit(state().copyWith());
        }).whenComplete(() async {
          //espera 1 segundo
          await Future.delayed(const Duration(seconds: 1));
          LiveListController(Bl(emit, state, add)).calcular;
          HovipListController(Bl(emit, state, add)).crear;
          // await onCalculateData(event, emit, state, add);
        });
      } on Exception catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    }
  }
  // print('state().users.usersList: ${state().users!.usersList}');
  emit(state().copyWith(isLoading: false));
}
