abstract class BaseError {
  final String? message;

  const BaseError({this.message});
}

class AccountNotVerifiedError extends BaseError {
  const AccountNotVerifiedError({String? message}) : super(message: message);
}

///================= Unknown ERROR ====================

class CustomError extends BaseError {
  const CustomError({String? message}) : super(message: message);
}

///================= Unknown ERROR ====================

class CancelError extends BaseError {
  const CancelError({String? message}) : super(message: message);
}

///================= Unknown ERROR ====================

class LoginRequiredError extends BaseError {
  const LoginRequiredError({String? message}) : super(message: message);
}

///================= Unknown ERROR ====================

class UnknownError extends BaseError {
  const UnknownError({String? message}) : super(message: message);
}

///================= Connection ERROR ====================

class ConnectionError extends BaseError {
  const ConnectionError({String? message}) : super(message: message);
}

class SocketError extends ConnectionError {
  const SocketError({String? message}) : super(message: message);
}

class NetError extends ConnectionError {
  const NetError({String? message}) : super(message: message);
}

class TimeoutError extends ConnectionError {
  const TimeoutError({String? message}) : super(message: message);
}

///================= HTTP ERROR ====================

class HttpError extends BaseError {
  const HttpError({String? message}) : super(message: message);
}

class UnauthorizedHttpError extends HttpError {
  const UnauthorizedHttpError({String? message}) : super(message: message);
}

class InternalServerError extends HttpError {
  const InternalServerError({String? message}) : super(message: message);
}

class BadRequestError extends HttpError {
  const BadRequestError({String? message}) : super(message: message);
}

class ConflictError extends HttpError {
  const ConflictError({String? message}) : super(message: message);
}

class ForbiddenError extends HttpError {
  const ForbiddenError({String? message}) : super(message: message);
}

class NotFoundError extends HttpError {
  const NotFoundError({String? message}) : super(message: message);
}
