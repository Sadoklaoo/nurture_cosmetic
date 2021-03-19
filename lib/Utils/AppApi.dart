class AppConfig {
  static String ip = "87.106.169.57:8080/";

  static String URL_LOGIN = "http://" + ip + "/api/authenticate";
  static String URL_GET_CURRENT_CLIENT = "http://" + ip + "/user/me";
  static String URL_CHANGE_PASSWORD = "http://" + ip + "/auth/change-password";
  static String URL_GET_IMAGE = "http://" + ip + "/images/";
  static String URL_EDIT_CLIENT = "http://" + ip + "/user/edit";
  static String URL_UPLOAD_IMAGE = "http://" + ip + "/uploads";
  static String URL_GET_HOODS = "http://" + ip + "/hood/";
  static String URL_GET_LOSTS = "http://" + ip + "/lost/";
  static String URL_NEW_HOODS = "http://" + ip + "/hood/new";

  static String URL_GET_PPRODUCT_BYSTORE =
      "http://" + ip + "/product/getByStoreId";
  static String URL_GET_ALL_ORDER =
      "http://" + ip + "/user/clients/transaction";
  static String URL_GET_ALL_ORDER_CLIENT_STORE =
      "http://" + ip + "/user/clients/transactionbystoreid";
  static String URL_UPDATE_TOKEN_NOTIFICATION =
      "http://" + ip + "/user/clients/updateToken";
  static String URL_GET_NOTIFICATIONS =
      "http://" + ip + "/notification/getByClient";
  static String URL_DELETE_NOTIFICATION =
      "http://" + ip + "/notification/delete/";
  static String URL_STAT_PROFILE =
      "http://" + ip + "/user/clients/statsprofile";
  static String URL_STAT_CHART = "http://" + ip + "/user/clients/statschart";
}
