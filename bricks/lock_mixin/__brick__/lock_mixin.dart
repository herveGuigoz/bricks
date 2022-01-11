import 'dart:async';

/// A lock service to prevent successive spamming a request.
/// [T] is an unique identifier used to prevent from calling twice the same
/// action.
/// 
/// ```dart
/// class Pagination<T> extends StateNotifier<AsyncValue<List<T>>> with Lock<int> {
///   Pagination({
///     AsyncValue<List<T>> state = const AsyncValue.loading(),
///   }) : super(state) {
///     _loadItems();
///     scrollController.addListener(_onScroll);
///   }
///
///   final scrollController = ScrollController();
///   int _page = 1;
///   bool _hasNext = true;
///
///   @override
///   set state(AsyncValue<List<T>> value) {
///     value.maybeWhen(
///       data: (data) {
///         super.state = AsyncData([...state.asData?.value ?? [], ...data]);
///         _page++;
///         _hasNext = data.isNotEmpty;
///       },
///       orElse: () => super.state = value,
///     );
///   }
///
///   bool get _isBottom {
///     if (!scrollController.hasClients) return false;
///     final maxScroll = scrollController.position.maxScrollExtent;
///     final currentScroll = scrollController.offset;
///     return currentScroll >= (maxScroll * 0.7);
///   }
///
///   void _onScroll() {
///     if (_isBottom && _hasNext) _loadItems();
///   }
///
///   Future<void> _loadItems() async {
///     return lock(
///       () async {/* Perform Get request */},
///       key: _page,
///       onError: (error) => state = AsyncError(error),
///     );
///   }
///
///   @override
///   void dispose() {
///     scrollController.dispose();
///     super.dispose();
///   }
/// }
/// ```
mixin Lock<T> {
  bool _isLocked = false;
  bool get isLocked => _isLocked;
  final _keys = <T>[];

  Future<void> lock(
    Future<void> Function() action, {
    required T key,
    void Function(Object error)? onError,
  }) async {
    if (!_keys.contains(key) || !_isLocked) {
      _isLocked = true;
      _keys.add(key);
      try {
        await action();
      } catch (e) {
        onError?.call(e);
      }
      _isLocked = false;
    }
  }

  void clear() => _keys.clear();
}