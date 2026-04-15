package com.feelingk.iap.util;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.util.Log;
import java.text.SimpleDateFormat;
import java.util.Date;

/* JADX INFO: loaded from: classes.dex */
public class CommonF {
    static final String TAG = "Util.CommonF";
    static int m_UsimState = 0;

    public static String getMDN(Context context, int CarrierIndex) {
        TelephonyManager tm = (TelephonyManager) context.getSystemService("phone");
        if (tm == null) {
            return null;
        }
        String phoneNumber = tm.getLine1Number();
        return CarrierIndex == 2 ? convertMDN(phoneNumber) : phoneNumber;
    }

    public static String convertMDN(String telNumber) {
        if (!telNumber.startsWith("+82", 0)) {
            return telNumber;
        }
        String converMDN = String.format("0%s", telNumber.substring(3));
        return converMDN;
    }

    public static String getTID(Context context, String pid) {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String FixDate = format.format(date);
        String makeTID = String.format("%s_%s", FixDate, pid);
        return makeTID;
    }

    public static int getCarrier(Context context) {
        TelephonyManager systemService = (TelephonyManager) context.getSystemService("phone");
        if (systemService == null) {
            return 0;
        }
        String strNetworkOperator = systemService.getSimOperator();
        if (strNetworkOperator != null) {
            if (strNetworkOperator.indexOf("05") != -1) {
                return 1;
            }
            if (strNetworkOperator.indexOf("02") != -1 || strNetworkOperator.indexOf("04") != -1 || strNetworkOperator.indexOf("08") != -1) {
                return 2;
            }
            if (strNetworkOperator.indexOf("06") != -1) {
                return 3;
            }
        }
        return 0;
    }

    public static final class LOGGER {
        /* JADX INFO: renamed from: i */
        public static void m2i(String tag, String msg) {
            Log.i(tag, msg);
        }

        /* JADX INFO: renamed from: e */
        public static void m0e(String tag, String msg) {
            Log.e(tag, msg);
        }

        /* JADX INFO: renamed from: ex */
        public static void m1ex(String tag, String msg) {
            Log.w(tag, "Exception : " + msg);
        }
    }
}
