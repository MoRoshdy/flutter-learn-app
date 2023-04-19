// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/models/shop_app/login_model.dart';
import 'package:flutter_learn_app/modules/shop_app/login/cubit/states.dart';
import 'package:flutter_learn_app/shared/network/end_points.dart';
import 'package:flutter_learn_app/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool obscure = true;
  IconData suffix = Icons.visibility_outlined;

  void changeObscure(){
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangeObscureState());
  }

  ShopLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
})
  {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopLoginSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

}