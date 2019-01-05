package edriven.cordova.plugins;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import android.content.Intent;
import android.net.Uri;

public class Whatsapp extends CordovaPlugin {
    public static final String ACTION_WHATSAPP_SEND = "send";

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        try {
            if (ACTION_WHATSAPP_SEND.equals(action)) {

                String url = "https://wa.me/" + args.getString(0);
                Intent i = new Intent(Intent.ACTION_VIEW);
                i.setData(Uri.parse(url));
                this.cordova.getActivity().startActivity(i);
                callbackContext.success();
                return true;
            }

            callbackContext.error("invalid action");
            return false;

        } catch (Exception e) {

            callbackContext.error(e.getMessage());
            return false;
        }
    }
}