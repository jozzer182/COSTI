import 'package:costii/contratos/model/contratos_reg.dart';
import 'package:costii/resources/constants/especialidades.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../real/model/real_esp_reg.dart';
import '../../real/model/real_list.dart';
import '../../real/model/real_reg.dart';
import '../../real/model/rel_year_reg.dart';
import '../model/live_reg.dart';

class LLCReal {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  LLCReal(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  asignar(LiveReg liveReg, String proyecto) {
    RealList realList = state().realList ?? RealList();

    RealYearReg realYearReg =
        realList.listYear.where((element) => element.year == '2025').firstWhere(
              (e) =>
                  e.nomproyecto.toUpperCase() == proyecto.toUpperCase() &&
                  e.naturaleza.toUpperCase().contains(
                        liveReg.naturaleza.toUpperCase().substring(0, 3),
                      ),
              orElse: () => RealYearReg.fromInit(),
            );
            

    //traer los RealReg
    List<RealReg> list = realList.list
        .where((e) =>
            e.nomproyecto.toUpperCase() == proyecto.toUpperCase() &&
            e.naturaleza.toUpperCase().contains(
                  liveReg.naturaleza.toUpperCase().substring(0, 3),
                ))
        .toList();

    List<String> listEsp = [];
    if (liveReg.naturaleza.toUpperCase() == 'MATERIALES') listEsp = materialEsp;
    if (liveReg.naturaleza.toUpperCase() == 'SERVICIOS') listEsp = serviciosEsp;
    if (liveReg.naturaleza.toUpperCase() == 'OTROS COSTOS') listEsp = otrosEsp;

    for (String especialidad in listEsp) {
      RealEspReg reg = RealEspReg();
      reg.especialidad = especialidad;
      List<ContratosReg> contratos = state()
              .contratosList
              ?.list
              .where((e) =>
                  e.especialidad.toUpperCase() == especialidad.toUpperCase())
              .toList() ??
          [];
      if (contratos.isEmpty) {
        liveReg.especialidadList.add(reg);
        continue;
      }
      List<RealReg> listFilter = list
          .where((e) =>
              contratos.map((el) => el.contratos).contains(e.contratomarco))
          .toList();
      reg.list = listFilter;
      if (liveReg.real.total == 0) liveReg.especialidadList.add(reg);
    }
    if (liveReg.real.total == 0) liveReg.real = realYearReg;
  }
}
