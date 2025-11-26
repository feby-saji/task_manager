// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Attachment {

 String get id; String get taskId; String? get localPath;// null if only downloaded from remote
 String? get url;// null if not in supabse yet
 bool get isDeleted; AttachmentType get type; SyncPendingOps get pendingOp;
/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttachmentCopyWith<Attachment> get copyWith => _$AttachmentCopyWithImpl<Attachment>(this as Attachment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attachment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.url, url) || other.url == url)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.pendingOp, pendingOp) || other.pendingOp == pendingOp));
}


@override
int get hashCode => Object.hash(runtimeType,id,taskId,localPath,url,isDeleted,type,pendingOp);

@override
String toString() {
  return 'Attachment(id: $id, taskId: $taskId, localPath: $localPath, url: $url, isDeleted: $isDeleted, type: $type, pendingOp: $pendingOp)';
}


}

/// @nodoc
abstract mixin class $AttachmentCopyWith<$Res>  {
  factory $AttachmentCopyWith(Attachment value, $Res Function(Attachment) _then) = _$AttachmentCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String? localPath, String? url, bool isDeleted, AttachmentType type, SyncPendingOps pendingOp
});




}
/// @nodoc
class _$AttachmentCopyWithImpl<$Res>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._self, this._then);

  final Attachment _self;
  final $Res Function(Attachment) _then;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? localPath = freezed,Object? url = freezed,Object? isDeleted = null,Object? type = null,Object? pendingOp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttachmentType,pendingOp: null == pendingOp ? _self.pendingOp : pendingOp // ignore: cast_nullable_to_non_nullable
as SyncPendingOps,
  ));
}

}


/// Adds pattern-matching-related methods to [Attachment].
extension AttachmentPatterns on Attachment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attachment value)  $default,){
final _that = this;
switch (_that) {
case _Attachment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attachment value)?  $default,){
final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String? localPath,  String? url,  bool isDeleted,  AttachmentType type,  SyncPendingOps pendingOp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that.id,_that.taskId,_that.localPath,_that.url,_that.isDeleted,_that.type,_that.pendingOp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String? localPath,  String? url,  bool isDeleted,  AttachmentType type,  SyncPendingOps pendingOp)  $default,) {final _that = this;
switch (_that) {
case _Attachment():
return $default(_that.id,_that.taskId,_that.localPath,_that.url,_that.isDeleted,_that.type,_that.pendingOp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String? localPath,  String? url,  bool isDeleted,  AttachmentType type,  SyncPendingOps pendingOp)?  $default,) {final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that.id,_that.taskId,_that.localPath,_that.url,_that.isDeleted,_that.type,_that.pendingOp);case _:
  return null;

}
}

}

/// @nodoc


class _Attachment implements Attachment {
  const _Attachment({required this.id, required this.taskId, this.localPath, this.url, this.isDeleted = false, required this.type, required this.pendingOp});
  

@override final  String id;
@override final  String taskId;
@override final  String? localPath;
// null if only downloaded from remote
@override final  String? url;
// null if not in supabse yet
@override@JsonKey() final  bool isDeleted;
@override final  AttachmentType type;
@override final  SyncPendingOps pendingOp;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttachmentCopyWith<_Attachment> get copyWith => __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attachment&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.url, url) || other.url == url)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.pendingOp, pendingOp) || other.pendingOp == pendingOp));
}


@override
int get hashCode => Object.hash(runtimeType,id,taskId,localPath,url,isDeleted,type,pendingOp);

@override
String toString() {
  return 'Attachment(id: $id, taskId: $taskId, localPath: $localPath, url: $url, isDeleted: $isDeleted, type: $type, pendingOp: $pendingOp)';
}


}

/// @nodoc
abstract mixin class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(_Attachment value, $Res Function(_Attachment) _then) = __$AttachmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String? localPath, String? url, bool isDeleted, AttachmentType type, SyncPendingOps pendingOp
});




}
/// @nodoc
class __$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(this._self, this._then);

  final _Attachment _self;
  final $Res Function(_Attachment) _then;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? localPath = freezed,Object? url = freezed,Object? isDeleted = null,Object? type = null,Object? pendingOp = null,}) {
  return _then(_Attachment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttachmentType,pendingOp: null == pendingOp ? _self.pendingOp : pendingOp // ignore: cast_nullable_to_non_nullable
as SyncPendingOps,
  ));
}


}

// dart format on
