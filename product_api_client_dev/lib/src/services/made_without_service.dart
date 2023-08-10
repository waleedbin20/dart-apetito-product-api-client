import 'dart:convert';

import '../apetito_product_api_client_base.dart';
import '../constants/uri_constants.dart';
import '../exceptions/client_exception.dart';
import '../models/made_without.dart';
import '../models/product.dart';
import '../models/product_made_without.dart';

class MadeWithoutService {
  MadeWithoutService({
    required ApetitoProductApiClientContext context,
  }) : _context = context;

  final ApetitoProductApiClientContext _context;

  /// Gets the made without that matches an id.
  Future<MadeWithout> getMadeWithoutById(String id) async {
    final response = await _context.client.get(
      Uri.https(authority, '$path/madewithouts/$id'),
    );

    ClientException.checkIsSuccessStatusCode(response);

    return MadeWithout.fromJson(json.decode(response.body));
  }

  /// Gets all the made withouts.
  Future<List<MadeWithout>> getMadeWithouts() async {
    final response = await _context.client.get(
      Uri.https(authority, '$path/madewithouts'),
    );

    ClientException.checkIsSuccessStatusCode(response);

    return (json.decode(response.body) as List)
        .map((e) => MadeWithout.fromJson(e))
        .toList();
  }

  /// Gets all the product made without information of the made without that matches an id.
  Future<List<ProductMadeWithout>> getProductMadeWithoutsByMadeWithoutId(
      String id) async {
    final response = await _context.client.get(
      Uri.https(authority, '$path/madewithouts/$id/productmadewithouts'),
    );

    ClientException.checkIsSuccessStatusCode(response);

    return (json.decode(response.body) as List)
        .map((e) => ProductMadeWithout.fromJson(e))
        .toList();
  }

  /// Gets all the products of the made without that matches an id.
  Future<List<Product>> getProductsByMadeWithoutId(String id) async {
    final response = await _context.client.get(
      Uri.https(authority, '$path/madewithouts/$id/products'),
    );

    ClientException.checkIsSuccessStatusCode(response);

    return (json.decode(response.body) as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }
}
