import '../../bdg/model/bdg_list.dart';
import '../../bdg/model/bdg_reg.dart';
import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../model/live_reg.dart';

class LLCBdg {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  LLCBdg(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  asignar(LiveReg liveReg) {
    BdgList bdgList = state().bdgList ?? BdgList();
    List<BdgReg> bdgListYear =
        bdgList.list.where((element) => element.year == 2025).toList();
    //AGREGAR BDG
    BdgReg bdgReg = bdgListYear.firstWhere(
      (e) => e.proyecto.toUpperCase() == liveReg.proyecto.toUpperCase() && e.naturaleza == liveReg.naturaleza,
      orElse: () => BdgReg.fromInit(),
    );
    liveReg.bdg = bdgReg;
  }
}
