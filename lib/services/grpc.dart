import 'package:deedee/generated/BucketService.pbgrpc.dart';
import 'package:deedee/generated/timestamp.pb.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/services/locator.dart';
import 'package:deedee/services/shared.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

class GRCPUtils {
  late BucketServiceClient stub;

  Future<void> placeTag(
      AccountType accountType,
      String topic,
      String messengerId,
      double lat,
      double lon,
      List<String> filterKeys) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    try {
      var timestamp = Timestamp()
        ..seconds = Int64.parseInt(
            (DateTime.now().millisecondsSinceEpoch / 1000).round().toString());
      var geo = GeoLocation()
        ..latitude = lat
        ..longitude = lon
        ..title = "";
      var tag = Tag()
        ..bucketId = topic
        ..messengerId = messengerId
        ..geoLocation = geo
        ..dueDate = timestamp
        ..tagType = Tag_TYPE.valueOf(accountType.index)!;

      var response = await stub.placeTag(PlaceTagRequest()
        ..tag = tag
        ..filters.addAll(filterKeys));
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Bucket> getBucket(String bucketId, AccountType accountType) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    var response = await stub.getBucket(GetBucketRequest()
      ..bucketId = bucketId
      ..tagType = Tag_TYPE.valueOf(accountType.index)!);
    // .then((p0) async {
    // await channel.shutdown();
    // },);

    return response.bucket;
    //
  }

  Future<Bucket> getFilteredTags(String bucketId, List<String> activeFilters,
      AccountType accountType) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    var response = await stub.getFilteredTags(GetBucketRequest()
      ..bucketId = bucketId
      ..filters.addAll(activeFilters)
      ..tagType = Tag_TYPE.valueOf(accountType.index)!);

    return response.bucket;
  }

  Future<List<String>> getTopics(double latitude, double longitude) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    var geoLocation = GeoLocation()
      ..latitude = latitude
      ..longitude = longitude;
    // return [Topic()..title = "test0", Topic()..title = "test1"];
    var response = await stub
        .getTopics(GetTopicTitlesRequest()..geoLocation = geoLocation);

    return response.topicTitles;
  }

  Future<List<FilterKey>> getFilterItems(String topic) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    var response =
        await stub.getFilterKeys(GetFilterKeysRequest()..topic = topic);

    return response.items;
  }

  Future<bool> verifyAuthCode(String code) async {
    String? url = await serviceLocator.get<SharedUtils>().getPrefsIpAddress();
    String? port = await serviceLocator.get<SharedUtils>().getPrefsPort();
    final channel = ClientChannel(
      url!,
      port: int.parse(port!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = BucketServiceClient(channel);

    var response =
        await stub.verifyAuthCode(VerifyAuthCodeRequest()..code = code);

    return response.authenticated;
  }
}
