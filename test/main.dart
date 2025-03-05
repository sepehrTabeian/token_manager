import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
@GenerateMocks([IStorageService])
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:token_manager/storage_service.dart';

import 'main.mocks.dart';
@GenerateMocks([IStorageService])
void main() {
  late MockIStorageService mockStorage;

  setUp(() {
    mockStorage = MockIStorageService();
  });

  test('Should store and retrieve token correctly', () async {
    when(mockStorage.read('token')).thenAnswer((_) async => 'test_token');

    await mockStorage.write('token', 'test_token');

    expect(await mockStorage.read('token'), 'test_token');
  });

  test('Should delete token correctly', () async {
    await mockStorage.delete('token');

    when(mockStorage.read('token')).thenAnswer((_) async => null);

    expect(await mockStorage.read('token'), null);
  });
}
