// Mocks generated by Mockito 5.4.2 from annotations
// in currency_task/src/features/converter/domain/use_cases/convert_use_cases.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:currency_task/src/src.export.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeValidResponse_0 extends _i1.SmartFake implements _i2.ValidResponse {
  _FakeValidResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ConvertUseCases].
///
/// See the documentation for Mockito's code generation for more information.
class MockConvertUseCases extends _i1.Mock implements _i2.ConvertUseCases {
  MockConvertUseCases() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.ValidResponse> execute(
    String? fCurrencyCode,
    String? tCurrencyCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            fCurrencyCode,
            tCurrencyCode,
          ],
        ),
        returnValue: _i3.Future<_i2.ValidResponse>.value(_FakeValidResponse_0(
          this,
          Invocation.method(
            #execute,
            [
              fCurrencyCode,
              tCurrencyCode,
            ],
          ),
        )),
      ) as _i3.Future<_i2.ValidResponse>);
}