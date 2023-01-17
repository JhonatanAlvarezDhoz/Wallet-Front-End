import 'package:flutter/material.dart';
import 'package:qr_wallet_front_end/models/models.dart';
import 'package:qr_wallet_front_end/utils/utils.dart';

class Session {
  UserToken? userToken;
  ValueNotifier<bool> isLogged = ValueNotifier<bool>(false);
  Session._();

  static final Session _instance = Session._();

  static Session get instance => _instance;

  updateToken(UserToken? userToken) {
    this.userToken = userToken;
  }

  //  Future<void> updateUser(UserDetails userDetails) async {
  //   this.userDetails = userDetails;
  //   if (userDetails.isFree!) {
  //     updateIsSubscribed(true);
  //   } else {
  //     try {
  //       await Purchases.logIn(userDetails.email!);
  //     } catch (e) {
  //       rethrow;
  //     }
  //   }
  // }

  updateIsLogged(bool logged) {
    isLogged.value = logged;
  }

  stop() async {
    userToken = null;
    isLogged.value = false;
    LocalStorage().setLocalStorageString("user_token", "");
  }
}
