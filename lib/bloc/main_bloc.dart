// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:costii/bdg/model/bdg_list.dart';
import 'package:costii/contratos/model/contratos_list.dart';
import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import 'package:costii/hovip_module/fem/model/fem_list_model.dart';
import 'package:costii/hovip_module/sustitutos/model/sustitutos_list.dart';
import 'package:costii/live/model/live_list.dart';
import 'package:costii/proyeccion/controller/proyeccion_esp_edit_ctrl.dart';
import 'package:costii/proyeccion/model/proyeccion_list.dart';
import 'package:costii/real/model/real_list.dart';
import 'package:flutter/material.dart';

import '../hovip_module/ejecutores/controller/ejecutores_reg_ctrl.dart';
import '../hovip_module/ejecutores/model/ejecutores_list_model.dart';
import '../hovip_module/fem/controller/fem_list_ctrl.dart';
import '../hovip_module/hovip/controller/hovip_reg_ctrl.dart';
import '../hovip_module/hovip/model/hovip_list_model.dart';
import '../hovip_module/hovip/model/hovip_reg_model.dart';
import '../hovip_module/proyectos/model/proyectos_list.dart';
import '../proyeccion/model/proyeccion_esp_edit.dart';
import '../user/model/user_model.dart';
import '../users/model/perfiles_model.dart';
import '../users/model/users_model.dart';
import 'action_color.dart';
import 'action_load_data.dart';
import 'main__bl.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    // on<Load>(onLoad);
    on<Load>((ev, em) => onLoadData(ev, em, passState, add));
    on<NewMessage>(onNewMessage);
    on<Loading>(onLoading);
    on<ThemeChange>((ev, em) => onThemeChange(ev, em, passState));
    on<ThemeColorChange>((ev, em) => onThemeColorChange(ev, em, passState));
  }
  MainState passState() => state;
  Bl get bl => Bl(emit, passState, add);

  void setYear(String year) {
    emit(state.copyWith(year: year));
  }

  HovipRegController get hovipRegController => HovipRegController(bl);
  FemListController get femListController => FemListController(bl);
  EjecutoresRegController get ejecutoresRegController =>
      EjecutoresRegController(bl);
  ProyeccionEspEditCtrl get proyeccionEspEdit => ProyeccionEspEditCtrl(bl);
  //Ui status on BLOC

  onNewMessage(event, emit) {
    emit(state.copyWith(
      message: event.message,
      messageCounter:
          event.typeMessage == TypeMessage.error ? 0 : state.messageCounter + 1,
      errorCounter:
          event.typeMessage == TypeMessage.error ? state.errorCounter + 1 : 0,
      messageColor: event.color,
    ));
  }

  onLoading(Loading event, emit) {
    emit(state.copyWith(
      isLoading: event.isLoading,
    ));
  }

  //------------------Especific Events ------------------
}
