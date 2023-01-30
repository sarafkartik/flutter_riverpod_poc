import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_init/src/domain/random_fact_repository.dart';
import 'package:riverpod_init/src/data/random_fact.dart';
import 'package:riverpod_init/src/network/common/api_response.dart';


import 'random_fact_repository_test.mocks.dart';

@GenerateMocks([RandomFactRepository])
void main() {
  final mockRepository = MockRandomFactRepository();
  final randomFact = RandomFact(id: '', text: '');
  const errorMessage = "Error!";

  test(
      'Returns'
      'ApiResponse(success:true, data:RandomFact(id: '
      ', text: '
      '))'
      'when api call is successful', () async {
    when(mockRepository.getRandomFact()).thenAnswer((_) async {
      return ApiResponse(success: true, data: randomFact);
    });
    final response = await mockRepository.getRandomFact();
    expect(response.success, true);
    expect(response.data, randomFact);
  });

  test(
      'Returns'
      'ApiResponse(success:false, error: "Error!")'
      'when api call is unsuccessful', () async {
    when(mockRepository.getRandomFact()).thenAnswer((_) async {
      return ApiResponse(success: false, error: errorMessage);
    });
    final response = await mockRepository.getRandomFact();
    expect(response.success, false);
    expect(response.error, errorMessage);
  });
}
