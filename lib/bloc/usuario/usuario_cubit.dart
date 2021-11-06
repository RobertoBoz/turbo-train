import 'package:flutter/cupertino.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/Models/model_usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user){
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad){
    final currentState = state;

    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyWith(edad:edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void cambiarProfecion(){

    final currentState = state;

    if(currentState is UsuarioActivo){
      var profesiones = currentState.usuario.profesiones;
      profesiones!.add('nueva');

      var newUser = currentState.usuario.copyWith(profesiones: profesiones);
      emit(UsuarioActivo(newUser));
    }

  }


}