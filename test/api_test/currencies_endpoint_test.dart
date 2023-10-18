import 'package:currency_task/src/core/constants/constants.export.dart';
import 'package:currency_task/src/services/network/network.export.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'convert_endpoint_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  group('Currencies endpoint', () {
    test('getCurrencies API call success', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();

      when(
        mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/currencies',
          params: {
            'apiKey': NetworkConstants.apiKey,
          },
        ),
      ).thenAnswer((_) async {
        return Right(ValidResponse(data: {
          'USD': {
            'id': 'usd',
            'currencyName': 'US Dollar',
            'currencySymbol': '\$'
          }
        }, statusCode: 200));
      });

      // Act
      final response = await mockNetworkService.get(
        baseUrl: NetworkConstants.baseUrl,
        path: '/api/v7/currencies',
        params: {
          'apiKey': NetworkConstants.apiKey,
        },
      );

      ValidResponse validResponse = ValidResponse();
      response.fold((l) => null, (r) => validResponse = r);

      // Assert
      expect(response, isA<Right>());
      expect(validResponse, isA<ValidResponse>());
      expect(validResponse.statusCode, 200);
      expect(validResponse.data, isA<Map<String, dynamic>>());
      expect(validResponse.data['USD'], isA<Map<String, dynamic>>());
      expect(validResponse.data['USD']['id'], 'usd');
      expect(validResponse.data['USD']['currencyName'], 'US Dollar');
      expect(validResponse.data['USD']['currencySymbol'], '\$');
    });

    test('getCurrencies API call fail', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();

      when(
        mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/currencies',
          params: {
            'apiKey': NetworkConstants.apiKey,
          },
        ),
      ).thenAnswer((_) async {
        return Left(Failure(statusCode: 400, message: 'No data'));
      });

      // Act
      final response = await mockNetworkService.get(
        baseUrl: NetworkConstants.baseUrl,
        path: '/api/v7/currencies',
        params: {
          'apiKey': NetworkConstants.apiKey,
        },
      );

      late Failure failure;
      response.fold((l) => failure = l, (r) => null);

      // Assert
      expect(response, isA<Left>());
      expect(failure, isA<Failure>());
      expect(failure.statusCode, 400);
      expect(failure.message, 'No data');
    });

    test('getCurrencies API invalid URI', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();
      when(
        mockNetworkService.get(baseUrl: ''),
      ).thenAnswer((_) async {
        return Left(Failure(statusCode: 500, message: 'Not valid URL'));
      });

      // Act
      final response = await mockNetworkService.get(baseUrl: '');
      late Failure failure;
      response.fold((l) => failure = l, (r) => null);

      // Assert
      expect(response, isA<Left>());
      expect(failure, isA<Failure>());
      expect(failure.statusCode, 500);
      expect(failure.message, 'Not valid URL');
    });
  });
}
