import 'package:currency_task/src/src.export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'convert_endpoint_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  group('Convert endpoint', () {
    test('convertCurrencies API call success', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();

      when(mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/convert',
          params: {
            'q': 'GBP_JPY',
            'compact': 'ultra',
            'apiKey': NetworkConstants.apiKey,
          })).thenAnswer((_) async {
        return ValidResponse(
          data: {'exchangeRate': 1.08},
          statusCode: 200,
        );
      });

      // Act
      final response = await mockNetworkService.get(
        baseUrl: NetworkConstants.baseUrl,
        path: '/api/v7/convert',
        params: {
          'q': 'GBP_JPY',
          'compact': 'ultra',
          'apiKey': NetworkConstants.apiKey,
        },
      );

      // Assert
      expect(response, isA<ValidResponse>());
      expect(response.statusCode, 200);
      expect(response.data, isA<Map<String, dynamic>>());
      expect(response.data['exchangeRate'], 1.08);
    });

    test('convertCurrencies API call fail', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();
      when(
        mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/convert',
          params: {
            'q': 'GBP_JPY',
            'compact': 'ultra',
            'apiKey': NetworkConstants.apiKey,
          },
        ),
      ).thenAnswer((_) async {
        return ValidResponse(
          data: null,
          statusCode: 404,
        );
      });

      // Act
      final response = await mockNetworkService.get(
        baseUrl: NetworkConstants.baseUrl,
        path: '/api/v7/convert',
        params: {
          'q': 'GBP_JPY',
          'compact': 'ultra',
          'apiKey': NetworkConstants.apiKey,
        },
      );

      // Assert
      expect(response, isA<ValidResponse>());
      expect(response.statusCode, 404);
      expect(response.data, null);
    });

    test('convertCurrencies API invalid URI', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();
      when(
        mockNetworkService.get(baseUrl: ''),
      ).thenAnswer((_) async {
        return ValidResponse(
          statusCode: 500,
          message: 'Not valid URL',
        );
      });

      // Act
      final response = await mockNetworkService.get(baseUrl: '');

      // Assert
      expect(response, isA<ValidResponse>());
      expect(response.statusCode, 500);
      expect(response.message, 'Not valid URL');
    });
  });
}
