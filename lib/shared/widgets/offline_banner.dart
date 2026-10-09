import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/connectivity_service.dart';
import '../../core/theme/app_dimensions.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/theme_provider.dart';
import '../../l10n/app_localizations.dart';

/// Riverpod-провайдер статуса сети.
final connectivityServiceProvider =
    Provider<ConnectivityService>((ref) {
  final service = ConnectivityService();
  service.initialize();
  ref.onDispose(service.dispose);
  return service;
});

/// Поток «онлайн / оффлайн».
final isOnlineProvider = StreamProvider<bool>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return service.onlineChanged;
});

/// Баннер «Вы оффлайн» — появляется сверху при потере сети.
class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final palette = context.palette;
    final onlineAsync = ref.watch(isOnlineProvider);
    final online = onlineAsync.value ?? true;

    if (online) return const SizedBox.shrink();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      color: palette.warning.withValues(alpha: 0.15),
      child: Row(
        children: [
          Icon(Icons.cloud_off, size: 18, color: palette.warning),
          const SizedBox(width: AppDimensions.spaceXs),
          Expanded(
            child: Text(
              l10n.offlineBanner,
              style: AppTextStyles.labelMedium
                  .copyWith(color: palette.warning),
            ),
          ),
        ],
      ),
    );
  }
}
