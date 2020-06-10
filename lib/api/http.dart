import 'package:dio/dio.dart';

class Http {
  static Http instance;
  Dio dio;
  BaseOptions options;

  static Http getInstance() {
    if (null == instance) instance = Http();
    return instance;
  }

  Http () {
    options = BaseOptions(
      baseUrl: "http://10.70.1.33:3000",
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    /// 请求拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        /// 数据请求之前的拦截器
        return options;
      },
      onResponse: (Response response) {
        /// 数据响应之前拦截器
        return response;
      },
      onError: (DioError e) {
        return e;
      }
    ));
  }

  /// post请求
  /// url 请求的地址
  /// data 请求参数【可选】
  /// options RequestOptions【可选】
  /// cancelToken CancelToken【可选】
  post (url, { Map<String, String> data, RequestOptions options, CancelToken cancelToken }) async {
    Response response;

    try {
      response = await dio.post(url, data: data, options: options, cancelToken: cancelToken);

      return response.data;
    } on DioError catch (e) {
      /// 这边处理错误
      formatError(e);
      throw(e.message.toString());
    }
  }

  /// post请求
  /// url 请求的地址
  /// data 请求参数【可选】
  /// options RequestOptions【可选】
  /// cancelToken CancelToken【可选】
  get (url, { Map<String, String> data, RequestOptions options, CancelToken cancelToken }) async {
    Response response;

    try {
      response = await dio.get(url, queryParameters: data, options: options, cancelToken: cancelToken);

      return response.data;
    } on DioError catch (e) {
      /// 这边处理错误
      formatError(e);
      throw(e.message.toString());
    }
  }

  /// http 请求错误拦截器
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("[error]连接超时===${e.message}");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("[error]请求超时===${e.message}");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("[error]响应超时===${e.message}");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("[error]出现异常===${e.message}");
    } else if (e.type == DioErrorType.CANCEL) {
      print("[error]请求取消===${e.message}");
    } else {
      print("[error]未知错误===${e.message}");
    }
  }
}