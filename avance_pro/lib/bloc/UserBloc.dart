import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String? email;
  final String? codigo;
  UserLoaded({required this.email, required this.codigo});
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserCubit extends Cubit<UserState> {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  UserCubit({required this.auth, required this.firestore})
    : super(UserInitial());

  Future<void> load() async {
    emit(UserLoading());
    try {
      final u = auth.currentUser;
      if (u == null) {
        emit(UserError('Sin sesión'));
        return;
      }
      final snap = await firestore.collection('users').doc(u.uid).get();
      final data = snap.data() ?? {};
      emit(UserLoaded(email: data['email'] ?? u.email, codigo: data['codigo']));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    emit(UserInitial());
  }
}
