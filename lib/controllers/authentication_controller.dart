import 'package:beclean_user/controllers/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

//States
abstract class AutheState {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AutheState {}

class AuthLoading extends AutheState {}

class AuthSucces extends AutheState {
  final String token;
  AuthSucces(this.token);
}

class AuthFailure extends AutheState {
  final String error;
  AuthFailure(this.error);
}

//Event
abstract class AuthEvent {
  @override
  List<Object> get props => [];
}

class RegisterUser extends AuthEvent {
  final Map<String, dynamic> userData;
  RegisterUser(this.userData);
}

//BLoc
class AuthBloc extends Bloc<AuthEvent, AutheState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial());
  @override
  Stream<AutheState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterUser) {
      yield AuthLoading();
      try {
        final token = await authRepository.registerUser(event.userData);
        yield AuthSucces(token);
      } catch (e) {
        yield AuthFailure("Register Failed");
      }
    }
  }
}
