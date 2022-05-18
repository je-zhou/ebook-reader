// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookViewStateTearOff {
  const _$BookViewStateTearOff();

  _BookViewState call({required bool isGridView, required String searchBy}) {
    return _BookViewState(
      isGridView: isGridView,
      searchBy: searchBy,
    );
  }
}

/// @nodoc
const $BookViewState = _$BookViewStateTearOff();

/// @nodoc
mixin _$BookViewState {
  bool get isGridView => throw _privateConstructorUsedError;
  String get searchBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookViewStateCopyWith<BookViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookViewStateCopyWith<$Res> {
  factory $BookViewStateCopyWith(
          BookViewState value, $Res Function(BookViewState) then) =
      _$BookViewStateCopyWithImpl<$Res>;
  $Res call({bool isGridView, String searchBy});
}

/// @nodoc
class _$BookViewStateCopyWithImpl<$Res>
    implements $BookViewStateCopyWith<$Res> {
  _$BookViewStateCopyWithImpl(this._value, this._then);

  final BookViewState _value;
  // ignore: unused_field
  final $Res Function(BookViewState) _then;

  @override
  $Res call({
    Object? isGridView = freezed,
    Object? searchBy = freezed,
  }) {
    return _then(_value.copyWith(
      isGridView: isGridView == freezed
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      searchBy: searchBy == freezed
          ? _value.searchBy
          : searchBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BookViewStateCopyWith<$Res>
    implements $BookViewStateCopyWith<$Res> {
  factory _$BookViewStateCopyWith(
          _BookViewState value, $Res Function(_BookViewState) then) =
      __$BookViewStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isGridView, String searchBy});
}

/// @nodoc
class __$BookViewStateCopyWithImpl<$Res>
    extends _$BookViewStateCopyWithImpl<$Res>
    implements _$BookViewStateCopyWith<$Res> {
  __$BookViewStateCopyWithImpl(
      _BookViewState _value, $Res Function(_BookViewState) _then)
      : super(_value, (v) => _then(v as _BookViewState));

  @override
  _BookViewState get _value => super._value as _BookViewState;

  @override
  $Res call({
    Object? isGridView = freezed,
    Object? searchBy = freezed,
  }) {
    return _then(_BookViewState(
      isGridView: isGridView == freezed
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      searchBy: searchBy == freezed
          ? _value.searchBy
          : searchBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BookViewState implements _BookViewState {
  const _$_BookViewState({required this.isGridView, required this.searchBy});

  @override
  final bool isGridView;
  @override
  final String searchBy;

  @override
  String toString() {
    return 'BookViewState(isGridView: $isGridView, searchBy: $searchBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookViewState &&
            const DeepCollectionEquality()
                .equals(other.isGridView, isGridView) &&
            const DeepCollectionEquality().equals(other.searchBy, searchBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isGridView),
      const DeepCollectionEquality().hash(searchBy));

  @JsonKey(ignore: true)
  @override
  _$BookViewStateCopyWith<_BookViewState> get copyWith =>
      __$BookViewStateCopyWithImpl<_BookViewState>(this, _$identity);
}

abstract class _BookViewState implements BookViewState {
  const factory _BookViewState(
      {required bool isGridView, required String searchBy}) = _$_BookViewState;

  @override
  bool get isGridView;
  @override
  String get searchBy;
  @override
  @JsonKey(ignore: true)
  _$BookViewStateCopyWith<_BookViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
