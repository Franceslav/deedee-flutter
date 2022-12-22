///
//  Generated code. Do not modify.
//  source: BidListService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'timestamp.pb.dart' as $1;

class PlaceBidRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PlaceBidRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidListId', protoName: 'bidListId')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..aOM<GeoLocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: GeoLocation.create)
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', protoName: 'dueDate', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  PlaceBidRequest._() : super();
  factory PlaceBidRequest({
    $core.String? bidListId,
    $fixnum.Int64? bidId,
    $core.String? messengerId,
    GeoLocation? geoLocation,
    $1.Timestamp? dueDate,
  }) {
    final _result = create();
    if (bidListId != null) {
      _result.bidListId = bidListId;
    }
    if (bidId != null) {
      _result.bidId = bidId;
    }
    if (messengerId != null) {
      _result.messengerId = messengerId;
    }
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    return _result;
  }
  factory PlaceBidRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlaceBidRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PlaceBidRequest clone() => PlaceBidRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PlaceBidRequest copyWith(void Function(PlaceBidRequest) updates) => super.copyWith((message) => updates(message as PlaceBidRequest)) as PlaceBidRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaceBidRequest create() => PlaceBidRequest._();
  PlaceBidRequest createEmptyInstance() => create();
  static $pb.PbList<PlaceBidRequest> createRepeated() => $pb.PbList<PlaceBidRequest>();
  @$core.pragma('dart2js:noInline')
  static PlaceBidRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlaceBidRequest>(create);
  static PlaceBidRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bidListId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bidListId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidListId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidListId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bidId => $_getI64(1);
  @$pb.TagNumber(2)
  set bidId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBidId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBidId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get messengerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set messengerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessengerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessengerId() => clearField(3);

  @$pb.TagNumber(4)
  GeoLocation get geoLocation => $_getN(3);
  @$pb.TagNumber(4)
  set geoLocation(GeoLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeoLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeoLocation() => clearField(4);
  @$pb.TagNumber(4)
  GeoLocation ensureGeoLocation() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get dueDate => $_getN(4);
  @$pb.TagNumber(5)
  set dueDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDueDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDueDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDueDate() => $_ensure(4);
}

class UpdateBidRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateBidRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidListId', protoName: 'bidListId')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..aOM<GeoLocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'geoLocation', protoName: 'geoLocation', subBuilder: GeoLocation.create)
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dueDate', protoName: 'dueDate', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  UpdateBidRequest._() : super();
  factory UpdateBidRequest({
    $core.String? bidListId,
    $fixnum.Int64? bidId,
    $core.String? messengerId,
    GeoLocation? geoLocation,
    $1.Timestamp? dueDate,
  }) {
    final _result = create();
    if (bidListId != null) {
      _result.bidListId = bidListId;
    }
    if (bidId != null) {
      _result.bidId = bidId;
    }
    if (messengerId != null) {
      _result.messengerId = messengerId;
    }
    if (geoLocation != null) {
      _result.geoLocation = geoLocation;
    }
    if (dueDate != null) {
      _result.dueDate = dueDate;
    }
    return _result;
  }
  factory UpdateBidRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBidRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBidRequest clone() => UpdateBidRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBidRequest copyWith(void Function(UpdateBidRequest) updates) => super.copyWith((message) => updates(message as UpdateBidRequest)) as UpdateBidRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateBidRequest create() => UpdateBidRequest._();
  UpdateBidRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBidRequest> createRepeated() => $pb.PbList<UpdateBidRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBidRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBidRequest>(create);
  static UpdateBidRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bidListId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bidListId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidListId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidListId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bidId => $_getI64(1);
  @$pb.TagNumber(2)
  set bidId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBidId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBidId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get messengerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set messengerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessengerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessengerId() => clearField(3);

  @$pb.TagNumber(4)
  GeoLocation get geoLocation => $_getN(3);
  @$pb.TagNumber(4)
  set geoLocation(GeoLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeoLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeoLocation() => clearField(4);
  @$pb.TagNumber(4)
  GeoLocation ensureGeoLocation() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get dueDate => $_getN(4);
  @$pb.TagNumber(5)
  set dueDate($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDueDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDueDate() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDueDate() => $_ensure(4);
}

class CheckoutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CheckoutRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidListId', protoName: 'bidListId')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  CheckoutRequest._() : super();
  factory CheckoutRequest({
    $core.String? bidListId,
    $fixnum.Int64? bidId,
  }) {
    final _result = create();
    if (bidListId != null) {
      _result.bidListId = bidListId;
    }
    if (bidId != null) {
      _result.bidId = bidId;
    }
    return _result;
  }
  factory CheckoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckoutRequest clone() => CheckoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckoutRequest copyWith(void Function(CheckoutRequest) updates) => super.copyWith((message) => updates(message as CheckoutRequest)) as CheckoutRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckoutRequest create() => CheckoutRequest._();
  CheckoutRequest createEmptyInstance() => create();
  static $pb.PbList<CheckoutRequest> createRepeated() => $pb.PbList<CheckoutRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckoutRequest>(create);
  static CheckoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bidListId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bidListId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidListId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidListId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bidId => $_getI64(1);
  @$pb.TagNumber(2)
  set bidId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBidId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBidId() => clearField(2);
}

class GetBidListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBidListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidListId', protoName: 'bidListId')
    ..hasRequiredFields = false
  ;

  GetBidListRequest._() : super();
  factory GetBidListRequest({
    $core.String? bidListId,
  }) {
    final _result = create();
    if (bidListId != null) {
      _result.bidListId = bidListId;
    }
    return _result;
  }
  factory GetBidListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBidListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBidListRequest clone() => GetBidListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBidListRequest copyWith(void Function(GetBidListRequest) updates) => super.copyWith((message) => updates(message as GetBidListRequest)) as GetBidListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBidListRequest create() => GetBidListRequest._();
  GetBidListRequest createEmptyInstance() => create();
  static $pb.PbList<GetBidListRequest> createRepeated() => $pb.PbList<GetBidListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBidListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBidListRequest>(create);
  static GetBidListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bidListId => $_getSZ(0);
  @$pb.TagNumber(1)
  set bidListId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidListId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidListId() => clearField(1);
}

class BidList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BidList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..pc<Bid>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bids', $pb.PbFieldType.PM, subBuilder: Bid.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'checkedOut', protoName: 'checkedOut')
    ..hasRequiredFields = false
  ;

  BidList._() : super();
  factory BidList({
    $core.Iterable<Bid>? bids,
    $core.bool? checkedOut,
  }) {
    final _result = create();
    if (bids != null) {
      _result.bids.addAll(bids);
    }
    if (checkedOut != null) {
      _result.checkedOut = checkedOut;
    }
    return _result;
  }
  factory BidList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BidList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BidList clone() => BidList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BidList copyWith(void Function(BidList) updates) => super.copyWith((message) => updates(message as BidList)) as BidList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BidList create() => BidList._();
  BidList createEmptyInstance() => create();
  static $pb.PbList<BidList> createRepeated() => $pb.PbList<BidList>();
  @$core.pragma('dart2js:noInline')
  static BidList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BidList>(create);
  static BidList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Bid> get bids => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get checkedOut => $_getBF(1);
  @$pb.TagNumber(2)
  set checkedOut($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCheckedOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearCheckedOut() => clearField(2);
}

class Bid extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Bid', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..hasRequiredFields = false
  ;

  Bid._() : super();
  factory Bid({
    $fixnum.Int64? bidId,
    $core.String? messengerId,
  }) {
    final _result = create();
    if (bidId != null) {
      _result.bidId = bidId;
    }
    if (messengerId != null) {
      _result.messengerId = messengerId;
    }
    return _result;
  }
  factory Bid.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bid.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bid clone() => Bid()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bid copyWith(void Function(Bid) updates) => super.copyWith((message) => updates(message as Bid)) as Bid; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Bid create() => Bid._();
  Bid createEmptyInstance() => create();
  static $pb.PbList<Bid> createRepeated() => $pb.PbList<Bid>();
  @$core.pragma('dart2js:noInline')
  static Bid getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bid>(create);
  static Bid? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bidId => $_getI64(0);
  @$pb.TagNumber(1)
  set bidId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messengerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set messengerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessengerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessengerId() => clearField(2);
}

class GetBidPopularityRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBidPopularityRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetBidPopularityRequest._() : super();
  factory GetBidPopularityRequest({
    $fixnum.Int64? bidId,
  }) {
    final _result = create();
    if (bidId != null) {
      _result.bidId = bidId;
    }
    return _result;
  }
  factory GetBidPopularityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBidPopularityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBidPopularityRequest clone() => GetBidPopularityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBidPopularityRequest copyWith(void Function(GetBidPopularityRequest) updates) => super.copyWith((message) => updates(message as GetBidPopularityRequest)) as GetBidPopularityRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBidPopularityRequest create() => GetBidPopularityRequest._();
  GetBidPopularityRequest createEmptyInstance() => create();
  static $pb.PbList<GetBidPopularityRequest> createRepeated() => $pb.PbList<GetBidPopularityRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBidPopularityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBidPopularityRequest>(create);
  static GetBidPopularityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bidId => $_getI64(0);
  @$pb.TagNumber(1)
  set bidId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidId() => clearField(1);
}

class GetBidPopularityResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBidPopularityResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bidId', $pb.PbFieldType.OU6, protoName: 'bidId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messengerId', protoName: 'messengerId')
    ..hasRequiredFields = false
  ;

  GetBidPopularityResponse._() : super();
  factory GetBidPopularityResponse({
    $fixnum.Int64? bidId,
    $core.String? messengerId,
  }) {
    final _result = create();
    if (bidId != null) {
      _result.bidId = bidId;
    }
    if (messengerId != null) {
      _result.messengerId = messengerId;
    }
    return _result;
  }
  factory GetBidPopularityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBidPopularityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBidPopularityResponse clone() => GetBidPopularityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBidPopularityResponse copyWith(void Function(GetBidPopularityResponse) updates) => super.copyWith((message) => updates(message as GetBidPopularityResponse)) as GetBidPopularityResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBidPopularityResponse create() => GetBidPopularityResponse._();
  GetBidPopularityResponse createEmptyInstance() => create();
  static $pb.PbList<GetBidPopularityResponse> createRepeated() => $pb.PbList<GetBidPopularityResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBidPopularityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBidPopularityResponse>(create);
  static GetBidPopularityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bidId => $_getI64(0);
  @$pb.TagNumber(1)
  set bidId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBidId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messengerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set messengerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessengerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessengerId() => clearField(2);
}

class GeoLocation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GeoLocation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bidlist'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GeoLocation._() : super();
  factory GeoLocation({
    $core.String? title,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    return _result;
  }
  factory GeoLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeoLocation clone() => GeoLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeoLocation copyWith(void Function(GeoLocation) updates) => super.copyWith((message) => updates(message as GeoLocation)) as GeoLocation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoLocation create() => GeoLocation._();
  GeoLocation createEmptyInstance() => create();
  static $pb.PbList<GeoLocation> createRepeated() => $pb.PbList<GeoLocation>();
  @$core.pragma('dart2js:noInline')
  static GeoLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoLocation>(create);
  static GeoLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get longitude => $_getN(2);
  @$pb.TagNumber(3)
  set longitude($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLongitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLongitude() => clearField(3);
}

