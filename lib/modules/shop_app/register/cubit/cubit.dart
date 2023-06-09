// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/models/shop_app/login_model.dart';
import 'package:flutter_learn_app/modules/shop_app/register/cubit/states.dart';
import 'package:flutter_learn_app/shared/network/end_points.dart';
import 'package:flutter_learn_app/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  bool obscure = true;
  IconData suffix = Icons.visibility_outlined;

  void changeObscure(){
    obscure = !obscure;
    suffix = obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangeObscureState());
  }

  ShopLoginModel? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
})
  {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);

      emit(ShopRegisterSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

}