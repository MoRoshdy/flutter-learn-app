// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/shop%20app/cubit/states.dart';
import 'package:flutter_learn_app/models/shop_app/categories_model.dart';
import 'package:flutter_learn_app/models/shop_app/change_favorites_model.dart';
import 'package:flutter_learn_app/models/shop_app/favorites_model.dart';
import 'package:flutter_learn_app/models/shop_app/home_model.dart';
import 'package:flutter_learn_app/models/shop_app/login_model.dart';
import 'package:flutter_learn_app/modules/shop_app/categories/categories_screen.dart';
import 'package:flutter_learn_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:flutter_learn_app/modules/shop_app/products/products_screen.dart';
import 'package:flutter_learn_app/modules/shop_app/settings/settings_screen.dart';
import 'package:flutter_learn_app/shared/components/constants.dart';
import 'package:flutter_learn_app/shared/network/end_points.dart';
import 'package:flutter_learn_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =
      [
        ProductsScreen(),
        CategoriesScreen(),
        FavoritesScreen(),
        SettingsScreen(),
      ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int?, bool?> favorites = {};

  void getHomeData(){
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // ignore: avoid_function_literals_in_foreach_calls
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({
          element.id : element.inFavorites,
        });
      });

      print(homeModel!.data!.banners![0].image);
      print(homeModel!.status);

      print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories(){

    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int? productId)
  {
    favorites[productId] == true ? favorites[productId] = false : favorites[productId] = true;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id' : productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if(changeFavoritesModel!.status == false){
        favorites[productId] == true ? favorites[productId] = false : favorites[productId] = true;
      }
      else
        {
          getFavorites();
        }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error){
      favorites[productId] == true ? favorites[productId] = false : favorites[productId] = true;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites(){
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData(){
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);

      emit(ShopSuccessUserDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
}){
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name':name,
        'email':email,
        'phone':phone,

      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);

      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}