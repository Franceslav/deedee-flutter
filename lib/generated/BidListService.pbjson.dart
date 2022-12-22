///
//  Generated code. Do not modify.
//  source: BidListService.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use placeBidRequestDescriptor instead')
const PlaceBidRequest$json = const {
  '1': 'PlaceBidRequest',
  '2': const [
    const {'1': 'bidListId', '3': 1, '4': 1, '5': 9, '10': 'bidListId'},
    const {'1': 'bidId', '3': 2, '4': 1, '5': 4, '10': 'bidId'},
    const {'1': 'messengerId', '3': 3, '4': 1, '5': 9, '10': 'messengerId'},
    const {'1': 'geoLocation', '3': 4, '4': 1, '5': 11, '6': '.bidlist.GeoLocation', '10': 'geoLocation'},
    const {'1': 'dueDate', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
  ],
};

/// Descriptor for `PlaceBidRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeBidRequestDescriptor = $convert.base64Decode('Cg9QbGFjZUJpZFJlcXVlc3QSHAoJYmlkTGlzdElkGAEgASgJUgliaWRMaXN0SWQSFAoFYmlkSWQYAiABKARSBWJpZElkEiAKC21lc3NlbmdlcklkGAMgASgJUgttZXNzZW5nZXJJZBI2CgtnZW9Mb2NhdGlvbhgEIAEoCzIULmJpZGxpc3QuR2VvTG9jYXRpb25SC2dlb0xvY2F0aW9uEjQKB2R1ZURhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdkdWVEYXRl');
@$core.Deprecated('Use updateBidRequestDescriptor instead')
const UpdateBidRequest$json = const {
  '1': 'UpdateBidRequest',
  '2': const [
    const {'1': 'bidListId', '3': 1, '4': 1, '5': 9, '10': 'bidListId'},
    const {'1': 'bidId', '3': 2, '4': 1, '5': 4, '10': 'bidId'},
    const {'1': 'messengerId', '3': 3, '4': 1, '5': 9, '10': 'messengerId'},
    const {'1': 'geoLocation', '3': 4, '4': 1, '5': 11, '6': '.bidlist.GeoLocation', '10': 'geoLocation'},
    const {'1': 'dueDate', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
  ],
};

/// Descriptor for `UpdateBidRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBidRequestDescriptor = $convert.base64Decode('ChBVcGRhdGVCaWRSZXF1ZXN0EhwKCWJpZExpc3RJZBgBIAEoCVIJYmlkTGlzdElkEhQKBWJpZElkGAIgASgEUgViaWRJZBIgCgttZXNzZW5nZXJJZBgDIAEoCVILbWVzc2VuZ2VySWQSNgoLZ2VvTG9jYXRpb24YBCABKAsyFC5iaWRsaXN0Lkdlb0xvY2F0aW9uUgtnZW9Mb2NhdGlvbhI0CgdkdWVEYXRlGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZQ==');
@$core.Deprecated('Use checkoutRequestDescriptor instead')
const CheckoutRequest$json = const {
  '1': 'CheckoutRequest',
  '2': const [
    const {'1': 'bidListId', '3': 1, '4': 1, '5': 9, '10': 'bidListId'},
    const {'1': 'bidId', '3': 2, '4': 1, '5': 4, '10': 'bidId'},
  ],
};

/// Descriptor for `CheckoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkoutRequestDescriptor = $convert.base64Decode('Cg9DaGVja291dFJlcXVlc3QSHAoJYmlkTGlzdElkGAEgASgJUgliaWRMaXN0SWQSFAoFYmlkSWQYAiABKARSBWJpZElk');
@$core.Deprecated('Use getBidListRequestDescriptor instead')
const GetBidListRequest$json = const {
  '1': 'GetBidListRequest',
  '2': const [
    const {'1': 'bidListId', '3': 1, '4': 1, '5': 9, '10': 'bidListId'},
  ],
};

/// Descriptor for `GetBidListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBidListRequestDescriptor = $convert.base64Decode('ChFHZXRCaWRMaXN0UmVxdWVzdBIcCgliaWRMaXN0SWQYASABKAlSCWJpZExpc3RJZA==');
@$core.Deprecated('Use bidListDescriptor instead')
const BidList$json = const {
  '1': 'BidList',
  '2': const [
    const {'1': 'bids', '3': 1, '4': 3, '5': 11, '6': '.bidlist.Bid', '10': 'bids'},
    const {'1': 'checkedOut', '3': 2, '4': 1, '5': 8, '10': 'checkedOut'},
  ],
};

/// Descriptor for `BidList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bidListDescriptor = $convert.base64Decode('CgdCaWRMaXN0EiAKBGJpZHMYASADKAsyDC5iaWRsaXN0LkJpZFIEYmlkcxIeCgpjaGVja2VkT3V0GAIgASgIUgpjaGVja2VkT3V0');
@$core.Deprecated('Use bidDescriptor instead')
const Bid$json = const {
  '1': 'Bid',
  '2': const [
    const {'1': 'bidId', '3': 1, '4': 1, '5': 4, '10': 'bidId'},
    const {'1': 'messengerId', '3': 2, '4': 1, '5': 9, '10': 'messengerId'},
  ],
};

/// Descriptor for `Bid`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bidDescriptor = $convert.base64Decode('CgNCaWQSFAoFYmlkSWQYASABKARSBWJpZElkEiAKC21lc3NlbmdlcklkGAIgASgJUgttZXNzZW5nZXJJZA==');
@$core.Deprecated('Use getBidPopularityRequestDescriptor instead')
const GetBidPopularityRequest$json = const {
  '1': 'GetBidPopularityRequest',
  '2': const [
    const {'1': 'bidId', '3': 1, '4': 1, '5': 4, '10': 'bidId'},
  ],
};

/// Descriptor for `GetBidPopularityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBidPopularityRequestDescriptor = $convert.base64Decode('ChdHZXRCaWRQb3B1bGFyaXR5UmVxdWVzdBIUCgViaWRJZBgBIAEoBFIFYmlkSWQ=');
@$core.Deprecated('Use getBidPopularityResponseDescriptor instead')
const GetBidPopularityResponse$json = const {
  '1': 'GetBidPopularityResponse',
  '2': const [
    const {'1': 'bidId', '3': 1, '4': 1, '5': 4, '10': 'bidId'},
    const {'1': 'messengerId', '3': 2, '4': 1, '5': 9, '10': 'messengerId'},
  ],
};

/// Descriptor for `GetBidPopularityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBidPopularityResponseDescriptor = $convert.base64Decode('ChhHZXRCaWRQb3B1bGFyaXR5UmVzcG9uc2USFAoFYmlkSWQYASABKARSBWJpZElkEiAKC21lc3NlbmdlcklkGAIgASgJUgttZXNzZW5nZXJJZA==');
@$core.Deprecated('Use geoLocationDescriptor instead')
const GeoLocation$json = const {
  '1': 'GeoLocation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'latitude', '3': 2, '4': 1, '5': 1, '10': 'latitude'},
    const {'1': 'longitude', '3': 3, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `GeoLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geoLocationDescriptor = $convert.base64Decode('CgtHZW9Mb2NhdGlvbhIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIbGF0aXR1ZGUYAiABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgDIAEoAVIJbG9uZ2l0dWRl');
