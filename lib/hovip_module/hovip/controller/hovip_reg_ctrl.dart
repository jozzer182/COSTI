import 'package:costii/hovip_module/hovip/model/hovip_reg_model.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';

class HovipRegController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  HovipRegController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  set(HovipReg hovipReg){
    emit(state().copyWith(hovipReg: hovipReg));
  }
}
