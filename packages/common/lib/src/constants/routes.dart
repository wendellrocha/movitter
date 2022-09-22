import 'env.dart';

const String kBaseUrl = 'https://api.themoviedb.org/3/';
const String kPagination = '?page={{page}}';
const Map<String, String> kQueryParams = {
  'api_key': Env.apiKey,
  'language': 'pt-BR',
};
