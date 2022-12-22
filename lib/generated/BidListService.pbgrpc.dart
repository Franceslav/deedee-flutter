///
//  Generated code. Do not modify.
//  source: BidListService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'BidListService.pb.dart' as $0;
export 'BidListService.pb.dart';

class BidListServiceClient extends $grpc.Client {
  static final _$placeBid = $grpc.ClientMethod<$0.PlaceBidRequest, $0.BidList>(
      '/bidlist.BidListService/PlaceBid',
      ($0.PlaceBidRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BidList.fromBuffer(value));
  static final _$updateItem =
      $grpc.ClientMethod<$0.UpdateBidRequest, $0.BidList>(
          '/bidlist.BidListService/UpdateItem',
          ($0.UpdateBidRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BidList.fromBuffer(value));
  static final _$checkout = $grpc.ClientMethod<$0.CheckoutRequest, $0.BidList>(
      '/bidlist.BidListService/Checkout',
      ($0.CheckoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BidList.fromBuffer(value));
  static final _$getBidList =
      $grpc.ClientMethod<$0.GetBidListRequest, $0.BidList>(
          '/bidlist.BidListService/GetBidList',
          ($0.GetBidListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BidList.fromBuffer(value));
  static final _$getItemPopularity = $grpc.ClientMethod<
          $0.GetBidPopularityRequest, $0.GetBidPopularityResponse>(
      '/bidlist.BidListService/GetItemPopularity',
      ($0.GetBidPopularityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetBidPopularityResponse.fromBuffer(value));

  BidListServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.BidList> placeBid($0.PlaceBidRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$placeBid, request, options: options);
  }

  $grpc.ResponseFuture<$0.BidList> updateItem($0.UpdateBidRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateItem, request, options: options);
  }

  $grpc.ResponseFuture<$0.BidList> checkout($0.CheckoutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkout, request, options: options);
  }

  $grpc.ResponseFuture<$0.BidList> getBidList($0.GetBidListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBidList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBidPopularityResponse> getItemPopularity(
      $0.GetBidPopularityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getItemPopularity, request, options: options);
  }
}

abstract class BidListServiceBase extends $grpc.Service {
  $core.String get $name => 'bidlist.BidListService';

  BidListServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PlaceBidRequest, $0.BidList>(
        'PlaceBid',
        placeBid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlaceBidRequest.fromBuffer(value),
        ($0.BidList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateBidRequest, $0.BidList>(
        'UpdateItem',
        updateItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateBidRequest.fromBuffer(value),
        ($0.BidList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckoutRequest, $0.BidList>(
        'Checkout',
        checkout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckoutRequest.fromBuffer(value),
        ($0.BidList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBidListRequest, $0.BidList>(
        'GetBidList',
        getBidList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBidListRequest.fromBuffer(value),
        ($0.BidList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBidPopularityRequest,
            $0.GetBidPopularityResponse>(
        'GetItemPopularity',
        getItemPopularity_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBidPopularityRequest.fromBuffer(value),
        ($0.GetBidPopularityResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.BidList> placeBid_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlaceBidRequest> request) async {
    return placeBid(call, await request);
  }

  $async.Future<$0.BidList> updateItem_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateBidRequest> request) async {
    return updateItem(call, await request);
  }

  $async.Future<$0.BidList> checkout_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CheckoutRequest> request) async {
    return checkout(call, await request);
  }

  $async.Future<$0.BidList> getBidList_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBidListRequest> request) async {
    return getBidList(call, await request);
  }

  $async.Future<$0.GetBidPopularityResponse> getItemPopularity_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetBidPopularityRequest> request) async {
    return getItemPopularity(call, await request);
  }

  $async.Future<$0.BidList> placeBid(
      $grpc.ServiceCall call, $0.PlaceBidRequest request);
  $async.Future<$0.BidList> updateItem(
      $grpc.ServiceCall call, $0.UpdateBidRequest request);
  $async.Future<$0.BidList> checkout(
      $grpc.ServiceCall call, $0.CheckoutRequest request);
  $async.Future<$0.BidList> getBidList(
      $grpc.ServiceCall call, $0.GetBidListRequest request);
  $async.Future<$0.GetBidPopularityResponse> getItemPopularity(
      $grpc.ServiceCall call, $0.GetBidPopularityRequest request);
}
