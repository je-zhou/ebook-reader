// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookTearOff {
  const _$BookTearOff();

  _Book call(
      {String? id,
      String? href,
      required String title,
      required String author,
      required String imageUrl}) {
    return _Book(
      id: id,
      href: href,
      title: title,
      author: author,
      imageUrl: imageUrl,
    );
  }
}

/// @nodoc
const $Book = _$BookTearOff();

/// @nodoc
mixin _$Book {
  String? get id => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res>;
  $Res call(
      {String? id, String? href, String title, String author, String imageUrl});
}

/// @nodoc
class _$BookCopyWithImpl<$Res> implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  final Book _value;
  // ignore: unused_field
  final $Res Function(Book) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? href = freezed,
    Object? title = freezed,
    Object? author = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) then) =
      __$BookCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, String? href, String title, String author, String imageUrl});
}

/// @nodoc
class __$BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(_Book _value, $Res Function(_Book) _then)
      : super(_value, (v) => _then(v as _Book));

  @override
  _Book get _value => super._value as _Book;

  @override
  $Res call({
    Object? id = freezed,
    Object? href = freezed,
    Object? title = freezed,
    Object? author = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Book(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Book implements _Book {
  const _$_Book(
      {this.id,
      this.href,
      required this.title,
      required this.author,
      required this.imageUrl});

  @override
  final String? id;
  @override
  final String? href;
  @override
  final String title;
  @override
  final String author;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Book(id: $id, href: $href, title: $title, author: $author, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Book &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.href, href) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(href),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$BookCopyWith<_Book> get copyWith =>
      __$BookCopyWithImpl<_Book>(this, _$identity);
}

abstract class _Book implements Book {
  const factory _Book(
      {String? id,
      String? href,
      required String title,
      required String author,
      required String imageUrl}) = _$_Book;

  @override
  String? get id;
  @override
  String? get href;
  @override
  String get title;
  @override
  String get author;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$BookCopyWith<_Book> get copyWith => throw _privateConstructorUsedError;
}
