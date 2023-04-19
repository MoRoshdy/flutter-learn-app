// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_app/layout/shop%20app/cubit/cubit.dart';
import 'package:flutter_learn_app/layout/shop%20app/cubit/states.dart';
import 'package:flutter_learn_app/models/shop_app/categories_model.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]),
          separatorBuilder: (context, index) => const Divider(thickness: 2.0,),
          itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image),
          height: 80.0,
          width: 80.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20.0,),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}
