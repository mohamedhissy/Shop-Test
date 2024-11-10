import'package:shop_test/core/extension/extensions.dart';
import '../../presentation/model/login_model.dart';
import '../response/login_response.dart';

extension LoginMapper on LoginResponse {
  LoginModel toDomain() {
    return LoginModel(
      result: result.onNull(),
      message: message.onNull(),
      accessToken: accessToken.onNull(),
      tokenType: tokenType.onNull(),
      expiresAt: expiresAt.onNull(),
      user: user!.toDomain(),
    );
  }
}

extension UserMapper on UserResponse {
  User toDomain() {
    return User(
      id: id.onNull(),
      type: type.onNull(),
      name: name.onNull(),
      email: email.onNull(),
      avatar: avatar.onNull(),
      avatarOriginal: avatarOriginal.onNull(),
      phone: phone.onNull(),
    );
  }
}
