// Mocks generated by Mockito 5.4.4 from annotations
// in FantasyE/test/application/auth/auth_logic/auth_logic_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:FantasyE/domain/auth/auth_failure.dart' as _i5;
import 'package:FantasyE/domain/auth/i_auth_facade.dart' as _i3;
import 'package:FantasyE/domain/auth/user.dart' as _i7;
import 'package:FantasyE/domain/auth/value_objects.dart' as _i6;
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

class _FakeOption_1<A> extends _i1.SmartFake implements _i2.Option<A> {
  _FakeOption_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IAuthFacade].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthFacade extends _i1.Mock implements _i3.IAuthFacade {
  MockIAuthFacade() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>>
      registerWithEmailAndPassword({
    required _i6.EmailAddress? emailAddress,
    required _i6.Password? password,
    required _i6.Name? name,
    required _i6.Role? role,
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #registerWithEmailAndPassword,
              [],
              {
                #emailAddress: emailAddress,
                #password: password,
                #name: name,
                #role: role,
              },
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>>.value(
                    _FakeEither_0<_i5.AuthFailure, _i2.Unit>(
              this,
              Invocation.method(
                #registerWithEmailAndPassword,
                [],
                {
                  #emailAddress: emailAddress,
                  #password: password,
                  #name: name,
                  #role: role,
                },
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>>);

  @override
  _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>> loginWithEmailAndPassword({
    required _i6.EmailAddress? emailAddress,
    required _i6.Password? password,
    required _i6.Role? role,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmailAndPassword,
          [],
          {
            #emailAddress: emailAddress,
            #password: password,
            #role: role,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>>.value(
            _FakeEither_0<_i5.AuthFailure, _i2.Unit>(
          this,
          Invocation.method(
            #loginWithEmailAndPassword,
            [],
            {
              #emailAddress: emailAddress,
              #password: password,
              #role: role,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthFailure, _i2.Unit>>);

  @override
  _i4.Future<_i2.Option<_i7.User>> getSignedInUser() => (super.noSuchMethod(
        Invocation.method(
          #getSignedInUser,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Option<_i7.User>>.value(_FakeOption_1<_i7.User>(
          this,
          Invocation.method(
            #getSignedInUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Option<_i7.User>>);

  @override
  _i4.Future<void> logOut() => (super.noSuchMethod(
        Invocation.method(
          #logOut,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}