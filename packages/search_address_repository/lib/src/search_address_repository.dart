import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import 'package:search_address_repository/search_address_repository.dart';

class SearchAddressRepository {
  Future<List<AddressModel>> onAddressSearch(String query) async {
    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$query&format=json');
      final response = await http.get(url);
      return (json.decode(response.body) as List)
          .map((json) => AddressModel.fromJson(json))
          .toList();
    } catch (error) {
      debugPrint(
          'SearchAddressRepository onAddressSearch Error: ${error.toString()}');
      return [];
    }
  }

  Future<AddressModel> onLocationSearch(LatLng location) async {
    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}');
      final response = await http.get(url);
      final data = json.decode(response.body);
      return AddressModel.fromJson(data);
    } catch (error) {
      debugPrint(
          'SearchAddressRepository onLocationSearch Error: ${error.toString()}');
      return AddressModel(address: 'Server Error');
    }
  }
}
