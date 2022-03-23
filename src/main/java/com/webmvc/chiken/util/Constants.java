package com.webmvc.chiken.util;

public class Constants {
    public static String FACEBOOK_APP_ID = "512141757136187";
    public static String FACEBOOK_APP_SECRET = "6ac6e359e2eda3f8bfbca0402f3e3393";
    public static String FACEBOOK_REDIRECT_URL = "https://fastfoodress.herokuapp.com/fb-login";
//    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8081/chiken_war_exploded/fb-login";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    public static String GOOGLE_CLIENT_ID = "1083386569886-fcnd182hruik0e6cgabqad22o0279e61.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "https://fastfoodress.herokuapp.com/gg-login";
//    public static String GOOGLE_REDIRECT_URI = "http://localhost:8081/chiken_war_exploded/gg-login";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
