
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'AuthEvent.dart';
part 'AuthState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {
    // Registro
    on<RegisterSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final cred = await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        await cred.user?.getIdToken(true);
        await cred.user?.reload();

        // Guardar datos en Firestore
        await _firestore.collection("users").doc(cred.user!.uid).set({
          "email": event.email,
          "codigo": event.codigo,
          "createdAt": FieldValue.serverTimestamp(), // mejor que DateTime.now()
        }, SetOptions(merge: true));

        emit(AuthAuthenticated(user: cred.user)); // <- importante
      } on FirebaseAuthException catch (e) {
        emit(AuthError(_mapAuthError(e)));
        emit(AuthInitial());
      } catch (e) {
        emit(AuthError('Error inesperado: $e'));
        emit(AuthInitial());
      }
    });

    // Login
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final cred = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await cred.user?.getIdToken(true);
        await cred.user?.reload();
        emit(AuthAuthenticated(user: cred.user)); // <- importante
      } on FirebaseAuthException catch (e) {
        emit(AuthError(_mapAuthError(e)));
        emit(AuthInitial());
      } catch (e) {
        emit(AuthError('Error inesperado: $e'));
        emit(AuthInitial());
      }
    });

    // Logout
    on<LogoutRequested>((event, emit) async {
      await _auth.signOut();
      emit(AuthInitial());
    });
  }

  String _mapAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Correo inválido';
      case 'user-disabled':
        return 'Usuario deshabilitado';
      case 'user-not-found':
        return 'No existe una cuenta con ese correo';
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'email-already-in-use':
        return 'Este correo ya está en uso';
      case 'weak-password':
        return 'La contraseña debe tener 6+ caracteres';
      case 'operation-not-allowed':
        return 'Proveedor de acceso deshabilitado';
      default:
        return e.message ?? 'Error de autenticación';
    }
  }
}