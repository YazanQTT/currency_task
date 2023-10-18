import 'package:bloc_test/bloc_test.dart';
import 'package:currency_task/src/core/injection/inj.dart';
import 'package:currency_task/src/src.export.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  configureDependencies(env: ValueConstants.test);

  group('HistoricBloc', () {
    late HistoricBloc historicBloc;
    late HistoricUseCases historicUseCases;

    setUp(() {
      historicUseCases =
          getIt.get<HistoricUseCases>() as MockHistoricUseCasesImpl;
      historicBloc = HistoricBloc();
    });

    tearDown(() => historicBloc.close());

    test('Initial state is correct', () {
      expect(historicBloc.state, const HistoricState());
    });

    blocTest(
      'emits [Loading, Success] when GetHistoricDataEvent is added with successful API call',
      build: () {
        when(historicUseCases.execute()).thenAnswer((_) async {
          return Right(ValidResponse(
            data: {
              "GBP_USD": {
                "2023-10-01": 1.219237,
                "2023-10-02": 1.209072,
                "2023-10-03": 1.207788,
                "2023-10-04": 1.213575,
                "2023-10-05": 1.218702,
                "2023-10-06": 1.224,
                "2023-10-07": 1.224
              },
              "EUR_USD": {
                "2023-10-01": 0.006687,
                "2023-10-02": 0.006673,
                "2023-10-03": 0.006703,
                "2023-10-04": 0.006713,
                "2023-10-05": 0.006736,
                "2023-10-06": 0.006701,
                "2023-10-07": 0.006701
              }
            },
            statusCode: 200,
          ));
        });
        return historicBloc;
      },
      act: (_) => historicBloc.add(GetHistoricDataEvent()),
      expect: () => [
        const HistoricState(historicStateStatus: HistoricStateStatus.LOADING),
        HistoricState(
          historicStateStatus: HistoricStateStatus.SUCCESS,
          historicData: HistoricDataModel.fromJson({
            "GBP_USD": {
              "2023-10-01": 1.219237,
              "2023-10-02": 1.209072,
              "2023-10-03": 1.207788,
              "2023-10-04": 1.213575,
              "2023-10-05": 1.218702,
              "2023-10-06": 1.224,
              "2023-10-07": 1.224
            },
            "EUR_USD": {
              "2023-10-01": 0.006687,
              "2023-10-02": 0.006673,
              "2023-10-03": 0.006703,
              "2023-10-04": 0.006713,
              "2023-10-05": 0.006736,
              "2023-10-06": 0.006701,
              "2023-10-07": 0.006701
            }
          }),
        ),
      ],
    );

    blocTest(
      'emits [Loading, Error] when GetHistoricDataEvent results in an error',
      build: () {
        when(historicUseCases.execute()).thenAnswer((_) async {
          return Left(Failure(statusCode: 500, message: ''));
        });
        return historicBloc;
      },
      act: (_) => historicBloc.add(GetHistoricDataEvent()),
      expect: () => [
        const HistoricState(historicStateStatus: HistoricStateStatus.LOADING),
        const HistoricState(
          historicStateStatus: HistoricStateStatus.ERROR,
        ),
      ],
    );
  });
}
