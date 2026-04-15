package com.lgt.arm;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

/* JADX INFO: loaded from: classes.dex */
public class Util {
    private static final String TAG = "CP_Arm_Tool";

    public static boolean existFile(String fileName) {
        File file = new File(fileName);
        return file.exists();
    }

    public static String readFile(Context ctx, String fileName) throws Exception {
        Log.d(TAG, String.valueOf(Util.class.toString()) + " readFile [" + fileName + "]");
        File file = new File(fileName);
        FileInputStream fis = new FileInputStream(file);
        int len = fis.available();
        InputStreamReader isr = new InputStreamReader(fis);
        char[] buf = new char[len];
        isr.read(buf);
        String res = new String(buf);
        isr.close();
        fis.close();
        return res;
    }

    public static String readOpenFile(Context ctx, String fileName) throws Exception {
        Log.d(TAG, String.valueOf(Util.class.toString()) + " readOpenFile [" + fileName + "]");
        FileInputStream fis = ctx.openFileInput(fileName);
        InputStreamReader isr = new InputStreamReader(fis);
        char[] buf = new char[fis.available()];
        isr.read(buf);
        String res = new String(Baes64.base64Decode(new String(buf)));
        isr.close();
        fis.close();
        return res;
    }

    public static void writeOpenFile(Context ctx, String fileName, String data) throws Exception {
        Log.d(TAG, String.valueOf(Util.class.toString()) + " writeOpenFile [" + fileName + "][" + data + "]");
        FileOutputStream fOut = ctx.openFileOutput(fileName, 0);
        OutputStreamWriter osw = new OutputStreamWriter(fOut);
        osw.write(Baes64.base64Encode(data.getBytes()));
        osw.flush();
        osw.close();
        fOut.close();
    }

    public static String getIMEINumber(Context ctx) {
        TelephonyManager tManager = (TelephonyManager) ctx.getSystemService("phone");
        String imeiNo = tManager.getDeviceId();
        return imeiNo;
    }

    public static String getTelNumber(Context ctx) {
        try {
            TelephonyManager tManager = (TelephonyManager) ctx.getSystemService("phone");
            String telNo = tManager.getLine1Number();
            return telNo;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x001d, code lost:
    
        if (r0.equals("000000000000000") != false) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean getEmul(Context ctx) {
        try {
            String telNo = getTelNumber(ctx);
            String deviceID = getIMEINumber(ctx);
            if (telNo == null || deviceID == null) {
                return true;
            }
            if (!telNo.equals("15555218135")) {
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
