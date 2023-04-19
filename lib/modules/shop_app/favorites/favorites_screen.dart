// ignore_for_file: use_key_in_widget_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/shop%20app/cubit/cubit.dart';
import 'package:flutter_learn_app/layout/shop%20app/cubit/states.dart';
import 'package:flutter_learn_app/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel!.data!.data![index].product, context),
            separatorBuilder: (context, index) => const Divider(thickness: 2.0,),
            itemCount: ShopCubit.get(context).favoritesModel!.data!.data!.length,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }

}
