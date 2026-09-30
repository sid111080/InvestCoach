import 'package:flutter/foundation.dart';

import '../../core/errors/app_exception.dart';
import '../../core/network/api_client.dart';
import '../dto/auth_dto.dart';
import '../mappers/auth_mapper.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_preferences.dart';
import '../../domain/repositories/auth_repository.dart';

/// Реальная реализация [AuthRepository] поверх REST API.
final class RemoteAuthRepository implements AuthRepository {
  const RemoteAuthRepository(this._api);

  final ApiClient _api;

  @override
  Future<AppUser> createAccount(String name) async {
    try {
      final response = await _api.dio.post(
        '/auth/firebase',
        data: {
          // ID Token подставляет _AuthInterceptor.
          'device_info': {
            'platform': _platformName(),
          },
        },
      );
      return AuthResponseDto.fromJson(response.data).user.toEntity();
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<UserPreferences> updatePreferences(
    UserPreferences preferences,
  ) async {
    try {
      final response = await _api.dio.patch(
        '/users/preferences',
        data: preferences.toJson(),
      );
      return UserPreferencesDto.fromJson(response.data).toEntity();
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<AppUser?> fetchMe() async {
    try {
      final response = await _api.dio.get('/users/me');
      return UserDto.fromJson(response.data as Map<String, dynamic>).toEntity();
    } catch (error) {
      final appException = _api.toAppException(error);
      // 401 — аккаунт ещё не создан: не ошибка для UI.
      if (appException is UnauthorizedException) return null;
      throw appException;
    }
  }

  String _platformName() => switch (defaultTargetPlatform) {
        TargetPlatform.android => 'android',
        TargetPlatform.iOS => 'ios',
        _ => 'unknown',
      };
}
