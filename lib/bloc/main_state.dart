part of 'main_bloc.dart';

class MainState {
  String message;
  int messageCounter;
  int errorCounter;
  Color messageColor;
  bool isLoading;
  bool isDark = false;
  Color? themeColor;
  User? user;
  Users? users;
  Perfiles? perfiles;
  int dialogCounter;
  String dialogMessage;
  BdgList? bdgList;
  RealList? realList;
  ProyeccionList? proyeccionList;
  LiveList? liveList;
  String year;
  ProyectosList? proyectosList;
  EjecutoresList? ejecutoresList;
  EjecutoresReg? ejecutoresReg;
  HovipList? hovipList;
  HovipReg? hovipReg;
  FemList? femList;
  ProyeccionEspEdit? pEdit;
  ProyeccionEspEdit? pCopy;
  ContratosList? contratosList;
  SustitutosList? sustitutosList;

  MainState({
    this.message = '',
    this.messageCounter = 0,
    this.errorCounter = 0,
    this.messageColor = Colors.red,
    this.isLoading = false,
    this.isDark = false,
    this.themeColor,
    this.user,
    this.users,
    this.perfiles,
    this.dialogCounter = 0,
    this.dialogMessage = '',
    this.bdgList,
    this.realList,
    this.proyeccionList,
    this.liveList,
    this.year = '2025',
    this.proyectosList,
    this.ejecutoresList,
    this.ejecutoresReg,
    this.hovipList,
    this.hovipReg,
    this.femList,
    this.pEdit,
    this.pCopy,
    this.contratosList,
    this.sustitutosList,
  });

  initial() {
    // message = '';
    // messageCounter = 0;
    // errorCounter = 0;
    messageColor = Colors.red;
    isLoading = false;
    isDark = false;
    themeColor = null;
    user = null;
    users = null;
    perfiles = null;
    dialogCounter = 0;
    dialogMessage = '';
    bdgList = null;
    realList = null;
    proyeccionList = null;
    liveList = null;
    year = '2025';
    proyectosList = null;
    ejecutoresList = null;
    ejecutoresReg = null;
    hovipList = null;
    hovipReg = null;
    femList = null;
    pEdit = null;
    pCopy = null;
    contratosList = null;
    sustitutosList = null;
  }

  MainState copyWith({
    String? message,
    int? messageCounter,
    int? errorCounter,
    Color? messageColor,
    bool? isLoading,
    bool? isDark,
    Color? themeColor,
    User? user,
    Users? users,
    Perfiles? perfiles,
    int? dialogCounter,
    String? dialogMessage,
    BdgList? bdgList,
    RealList? realList,
    ProyeccionList? proyeccionList,
    LiveList? liveList,
    String? year,
    ProyectosList? proyectosList,
    EjecutoresList? ejecutoresList,
    EjecutoresReg? ejecutoresReg,
    HovipList? hovipList,
    HovipReg? hovipReg,
    FemList? femList,
    ProyeccionEspEdit? pEdit,
    ProyeccionEspEdit? pCopy,
    ContratosList? contratosList,
    SustitutosList? sustitutosList,
  }) {
    return MainState(
      message: message ?? this.message,
      messageCounter: messageCounter ?? this.messageCounter,
      errorCounter: errorCounter ?? this.errorCounter,
      messageColor: messageColor ?? this.messageColor,
      isLoading: isLoading ?? this.isLoading,
      isDark: isDark ?? this.isDark,
      themeColor: themeColor ?? this.themeColor,
      user: user ?? this.user,
      users: users ?? this.users,
      perfiles: perfiles ?? this.perfiles,
      dialogCounter: dialogCounter ?? this.dialogCounter,
      dialogMessage: dialogMessage ?? this.dialogMessage,
      bdgList: bdgList ?? this.bdgList,
      realList: realList ?? this.realList,
      proyeccionList: proyeccionList ?? this.proyeccionList,
      liveList: liveList ?? this.liveList,
      year: year ?? this.year,
      proyectosList: proyectosList ?? this.proyectosList,
      ejecutoresList: ejecutoresList ?? this.ejecutoresList,
      ejecutoresReg: ejecutoresReg ?? this.ejecutoresReg,
      hovipList: hovipList ?? this.hovipList,
      hovipReg: hovipReg ?? this.hovipReg,
      femList: femList ?? this.femList,
      pEdit: pEdit ?? this.pEdit,
      pCopy: pCopy ?? this.pCopy,
      contratosList: contratosList ?? this.contratosList,
      sustitutosList: sustitutosList ?? this.sustitutosList,
    );
  }
}
