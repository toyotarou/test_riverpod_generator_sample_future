import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'providers.g.dart';

part 'providers.freezed.dart';

@freezed
class SampleState with _$SampleState {
  const factory SampleState({
    @Default(0) int number,
  }) = _SampleState;
}

// @riverpod
// Future<int> fetchCounter(FetchCounterRef ref) async {
//   // 模擬的な非同期操作
//   await Future.delayed(const Duration(seconds: 2));
//   return 42;
// }

@riverpod
Future<SampleState> fetchCounter(FetchCounterRef ref) async {
  // 模擬的な非同期操作
  await Future.delayed(const Duration(seconds: 2));
  return const SampleState(number: 50);
}

@riverpod
Future<int> multipliedCounter(MultipliedCounterRef ref) async {
  final counter = await ref.watch(fetchCounterProvider.future);
  const multiplier = 2;
  return counter.number * multiplier;
}
