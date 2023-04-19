import 'package:flutter_learn_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_learn_app/shared/components/components.dart';
import 'package:flutter_learn_app/shared/network/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String? token = '';

String? uId = '';