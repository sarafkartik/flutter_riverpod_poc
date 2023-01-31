import '../data/random_fact.dart';
import '../network/api/service/random_fact_service.dart';
import '../network/common/api_response.dart';

class RandomFactRepository {
  final RandomFactService service;

  RandomFactRepository(this.service);

  Future<ApiResponse<RandomFact>> getRandomFact() => service.fetchRandomFact();
}
