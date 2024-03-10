import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/global_data/repository/products_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {


  LoginCubit() : super(const LoginState(status: LoginStatus.initial));

  void userLogin({required String username, required String password}) async {
    emit( const LoginState(status: LoginStatus.loading));
    try {
      await ProductsRepo.postProducts(username, password);
      emit(const LoginState(status: LoginStatus.success));
    } catch (e) {
      emit(const LoginState(status: LoginStatus.failure, errorMessage: 'Invalid username or password.'));
    }
  }
}