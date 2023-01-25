import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_init/src/domain/random_fact_repository.dart';
import 'package:riverpod_init/src/data/random_fact.dart';
import 'package:riverpod_init/src/network/api/common/api_response.dart';

class FakeRandomFactRepository0 extends Fake implements RandomFactRepository {

  final randomFact = RandomFact(id: '12345', text: "fact");

  @override
  Future<ApiResponse<RandomFact>> getRandomFact() async {
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(ApiResponse(success: true, data: randomFact));
  }
}
