class AppConfig {
  //static String ip = "10.0.2.2:3000";
  static String ip = "192.168.1.16:3000";
  //static String ip = "http://521b8f30acbd.ngrok.io:3000";
  static String URL_GET_IMAGE = "http://" + ip + "/images/";
  static String URL_LOGIN = "http://" + ip + "/auth/login";
  static String URL_GET_CURRENT_CLIENT = "http://" + ip + "/users/me";
  static String URL_EDIT_CLIENT = "http://" + ip + "/users/clients/edit";
  static String URL_EDIT_CLIENT_PASSWORD = "http://" + ip + "/users/clients/editpassword";
  static String URL_NEW_ACCOUNT = "http://" + ip + "/auth/newaccount";
  static String URL_SEND_REQUEST_CODE = "http://" + ip + "/auth/sendCode";
  static String URL_CHECK_REQUEST_CODE = "http://" + ip + "/auth/check";
  static String URL_RESEND_REQUEST_CODE = "http://" + ip + "/auth/resendCode";
  static String URL_GET_CATEGORY = "http://" + ip + "/category/getAll";
  static String URL_GET_ALL_PRODUCT_TYPE =
      "http://" + ip + "/products/getAllTypes";
  static String URL_GET_ALL_PRODUCT_FAVORIS =
      "http://" + ip + "/products/getAllFavoris";
  static String URL_GET_HISTORY =
      "http://" + ip + "/history/getAll";
  static String URL_IS_PRODUCT_FAVORIS =
      "http://" + ip + "/products/isFavoris";
  static String URL_IS_PRODUCT_ADD_FAVORIS =
      "http://" + ip + "/products/addToFavoris";
  static String URL_IS_PRODUCT_REMOVE_FAVORIS =
      "http://" + ip + "/products/removeFromFavoris";
  static String URL_GET_ALL_PRODUCT_DETAILS =
      "http://" + ip + "/products/getProductDetail/";

  static String URL_GET_ALL_PRODUCT_BY_CATEGORY =
      "http://" + ip + "/category/getAllProductsByCategory";






  static String URL_CHANGE_PASSWORD = "http://" + ip + "/auth/change-password";

  static String URL_UPLOAD_IMAGE = "http://" + ip + "/uploads";
  static String URL_GET_HOODS = "http://" + ip + "/hood/";
  static String URL_GET_LOSTS = "http://" + ip + "/lost/";
  static String URL_NEW_HOODS = "http://" + ip + "/hood/new";

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
