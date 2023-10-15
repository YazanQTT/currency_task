import 'package:currency_task/src/core/constants/constants.export.dart';
import 'package:currency_task/src/services/network/network.export.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'convert_endpoint_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  group('Historic endpoint', () {
    test('historicData API call success', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();

      when(
        mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/convert',
          params: {
            'apiKey': NetworkConstants.apiKey,
            'q': 'GBP_JPY',
            'compact': 'ultra',
            'date': '2023-10-10',
            'endDate': '2023-10-13',
          },
        ),
      ).thenAnswer((_) async {
        return ValidResponse(
          data: {
            "GBP_JPY": {
              "2023-10-10": 182.330822,
              "2023-10-11": 181.186726,
              "2023-10-12": 180.19776,
              "2023-10-13": 180.784945
            }
          },
          statusCode: 200,
        );
      });

      // Act
      final response = await mockNetworkService.get(
        baseUrl: NetworkConstants.baseUrl,
        path: '/api/v7/convert',
        params: {
          'apiKey': NetworkConstants.apiKey,
          'q': 'GBP_JPY',
          'compact': 'ultra',
          'date': '2023-10-10',
          'endDate': '2023-10-13',
        },
      );

      // Assert
      expect(response, isA<ValidResponse>());
      expect(response.statusCode, 200);
      expect(response.data, isA<Map<String, dynamic>>());
      expect(response.data['GBP_JPY'], isA<Map<String, dynamic>>());
    });

    test('historicData API call fail', () async {
      // Arrange
      final mockNetworkService = MockNetworkService();
      when(
        mockNetworkService.get(
          baseUrl: NetworkConstants.baseUrl,
          path: '/api/v7/convert',
          params: {
            'apiKey': NetworkConstants.apiKey,
            'q': 'GBP_JPY',
            'compact': 'ultra',
            'date': '2023-10-10',
            'endDate': '2023-10-13',
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
          'apiKey': NetworkConstants.apiKey,
          'q': 'GBP_JPY',
          'compact': 'ultra',
          'date': '2023-10-10',
          'endDate': '2023-10-13',
        },
      );

      // Assert
      expect(response, isA<ValidResponse>());
      expect(response.statusCode, 404);
      expect(response.data, null);
    });

    test('historicData API invalid URI', () async {
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
