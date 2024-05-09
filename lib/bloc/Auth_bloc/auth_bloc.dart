import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool obscureText = false;
  UserCredential? authresult;
  final _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<ShowpasswordEvent>((event, emit) {
      emit(ShowpasswordState());
    });

    on<LoignEvent>((event, emit) async{
      emit(LoadingState());
try {
        authresult = await _auth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) async {
          uid = value.user!.uid;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('uid', value.user!.uid);
          print(uid);
          return null;
        });
        emit(SuccessLoginState());
      } on FirebaseAuthException catch (e) {
        String message = 'error Ocurred';
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        }

        emit(Registererrstate(error: message));
      } catch (e) {
        print(e);
      }
    });

    on<RegesterEvent>((event, emit) async {
      emit(LoadingState());
      try {
        authresult = await _auth
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) async {
              print(authresult);
          final ref = FirebaseStorage.instance
              .ref()
              .child('user_image')
              .child('${value.user!.uid}.jpg');
          await ref.putFile(event.image!);
          final url = await ref.getDownloadURL();
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(value.user!.uid)
              .set({
            'email': event.email,
            'password': event.password,
            'image_url': url,
            'phone': event.phone,
            'uid': value.user!.uid
          });
          uid = value.user!.uid;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('uid', value.user!.uid);
          print("adjfajfnjdf$uid");
          emit(SuccessRegesterState());
          return null;
        });
      } on FirebaseAuthException catch (e) {
        String message = 'error Ocurred';
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        }

        emit(Registererrstate(error: message));
      } catch (e) {
        print(e);
      }
    });
  }
}
