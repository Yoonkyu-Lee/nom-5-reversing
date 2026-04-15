package com.google.android.apps.analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.google.android.apps.analytics.PersistentEventStore;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class AnalyticsReceiver extends BroadcastReceiver {
    private static final String INSTALL_ACTION = "com.android.vending.INSTALL_REFERRER";

    static String formatReferrer(String str) {
        String[] strArrSplit = str.split("&");
        HashMap map = new HashMap();
        for (String str2 : strArrSplit) {
            String[] strArrSplit2 = str2.split("=");
            if (strArrSplit2.length != 2) {
                break;
            }
            map.put(strArrSplit2[0], strArrSplit2[1]);
        }
        boolean z = map.get("utm_campaign") != null;
        boolean z2 = map.get("utm_medium") != null;
        boolean z3 = map.get("utm_source") != null;
        if (!z || !z2 || !z3) {
            Log.w(GoogleAnalyticsTracker.TRACKER_TAG, "Badly formatted referrer missing campaign, name or source");
            return null;
        }
        String[][] strArr = {new String[]{"utmcid", (String) map.get("utm_id")}, new String[]{"utmcsr", (String) map.get("utm_source")}, new String[]{"utmgclid", (String) map.get("gclid")}, new String[]{"utmccn", (String) map.get("utm_campaign")}, new String[]{"utmcmd", (String) map.get("utm_medium")}, new String[]{"utmctr", (String) map.get("utm_term")}, new String[]{"utmcct", (String) map.get("utm_content")}};
        StringBuilder sb = new StringBuilder();
        boolean z4 = true;
        for (int i = 0; i < strArr.length; i++) {
            if (strArr[i][1] != null) {
                String strReplace = strArr[i][1].replace("+", "%20").replace(" ", "%20");
                if (z4) {
                    z4 = false;
                } else {
                    sb.append("|");
                }
                sb.append(strArr[i][0]).append("=").append(strReplace);
            }
        }
        return sb.toString();
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra("referrer");
        if (!INSTALL_ACTION.equals(intent.getAction()) || stringExtra == null) {
            return;
        }
        String referrer = formatReferrer(stringExtra);
        if (referrer == null) {
            Log.w(GoogleAnalyticsTracker.TRACKER_TAG, "Badly formatted referrer, ignored");
        } else {
            new PersistentEventStore(new PersistentEventStore.DataBaseHelper(context)).setReferrer(referrer);
            Log.d(GoogleAnalyticsTracker.TRACKER_TAG, "Stored referrer:" + referrer);
        }
    }
}
