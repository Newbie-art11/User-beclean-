import 'package:beclean_user/services/event/register_event.dart';
import 'package:beclean_user/services/state/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      // emit(RegisterLoading());

      try {
        final response = await http.post(
          Uri.parse('http://beclean.unimal.link/api/v1/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': event.name,
            'email': event.email,
            'phone': event.phone,
            'password': event.password,
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final token = data['token'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwt_token', token);
          emit(RegisterSuccess(token: token));
        } else if (response.statusCode == 400) {
          emit(RegisterFailure(error: 'Register gagal!'));
        }
      } catch (e) {
        emit(RegisterFailure(error: 'Terjadi kesalahan, coba lagi nanti.'));
      }
    });
  }
}
