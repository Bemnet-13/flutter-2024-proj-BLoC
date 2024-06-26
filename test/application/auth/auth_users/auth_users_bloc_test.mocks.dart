// Mocks generated by Mockito 5.4.4 from annotations
// in FantasyE/test/application/auth/auth_users/auth_users_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:FantasyE/domain/auth/user.dart' as _i6;
import 'package:FantasyE/domain/auth/value_objects.dart' as _i7;
import 'package:FantasyE/domain/manage_account/i_manage_account_facade.dart'
    as _i3;
import 'package:FantasyE/domain/manage_account/manage_account_failure.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IManageAccountFacade].
///
/// See the documentation for Mockito's code generation for more information.
class MockIManageAccountFacade extends _i1.Mock
    implements _i3.IManageAccountFacade {
  MockIManageAccountFacade() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.ManageAccountFailure, List<_i6.UserDetails>>>
      getAllUsers() => (super.noSuchMethod(
            Invocation.method(
              #getAllUsers,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.ManageAccountFailure,
                        List<_i6.UserDetails>>>.value(
                _FakeEither_0<_i5.ManageAccountFailure, List<_i6.UserDetails>>(
              this,
              Invocation.method(
                #getAllUsers,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.ManageAccountFailure, List<_i6.UserDetails>>>);

  @override
  _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>> updateUserAccount({
    required _i7.EmailAddress? emailAddress,
    required _i7.Password? password,
    required _i7.Name? name,
    required _i7.TeamName? teamName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserAccount,
          [],
          {
            #emailAddress: emailAddress,
            #password: password,
            #name: name,
            #teamName: teamName,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>.value(
                _FakeEither_0<_i5.ManageAccountFailure, _i2.Unit>(
          this,
          Invocation.method(
            #updateUserAccount,
            [],
            {
              #emailAddress: emailAddress,
              #password: password,
              #name: name,
              #teamName: teamName,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>);

  @override
  _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>> deleteUserAccount(
          {required String? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUserAccount,
          [],
          {#userId: userId},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>.value(
                _FakeEither_0<_i5.ManageAccountFailure, _i2.Unit>(
          this,
          Invocation.method(
            #deleteUserAccount,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>);

  @override
  _i4.Future<
      _i2.Either<_i5.ManageAccountFailure, _i2.Unit>> suspendUserAccount({
    required String? userId,
    required bool? suspensionState,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #suspendUserAccount,
          [],
          {
            #userId: userId,
            #suspensionState: suspensionState,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>.value(
                _FakeEither_0<_i5.ManageAccountFailure, _i2.Unit>(
          this,
          Invocation.method(
            #suspendUserAccount,
            [],
            {
              #userId: userId,
              #suspensionState: suspensionState,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ManageAccountFailure, _i2.Unit>>);
}
