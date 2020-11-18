package controller;

import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;

public class RestFb
{
    public static String FB_REDIRECT_URL = "";
    private static final String FB_APP_ID = "751648455607335";
    private static final String FB_APP_SECRET = "5cbff0a17b794f22f2d29d2779b21a66";
    private static final String FB_LINK_GET_TOKEN
        = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
    
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String link = String.format(FB_LINK_GET_TOKEN,
            FB_APP_ID, FB_APP_SECRET, FB_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(
            accessToken, FB_APP_SECRET, Version.LATEST);
        return facebookClient.fetchObject("me", User.class);
    }
    
    public static String getOAuthUrl() {
        return "https://www.facebook.com/dialog/oauth?"
            + "client_id="     + FB_APP_ID
            + "&redirect_uri=" + FB_REDIRECT_URL;
    }
}
