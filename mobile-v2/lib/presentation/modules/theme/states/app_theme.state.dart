import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immich_mobile/domain/models/app_setting.model.dart';
import 'package:immich_mobile/domain/services/app_setting.service.dart';
import 'package:immich_mobile/presentation/modules/theme/models/app_theme.model.dart';

class AppThemeCubit extends Cubit<AppTheme> {
  final AppSettingService _appSettings;
  StreamSubscription? _appSettingSubscription;

  AppThemeCubit(this._appSettings) : super(AppTheme.blue) {
    _appSettingSubscription = _appSettings
        .watchSetting(AppSetting.appTheme)
        .listen((theme) => emit(theme));
  }

  @override
  Future<void> close() {
    _appSettingSubscription?.cancel();
    return super.close();
  }
}
