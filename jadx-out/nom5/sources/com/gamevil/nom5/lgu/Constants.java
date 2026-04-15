package com.gamevil.nom5.lgu;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Handler;
import android.util.Log;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* JADX INFO: loaded from: classes.dex */
public enum Constants {
    LGU;

    private final Handler handler = new Handler();
    private final String STR_NETWORK_WARNING = "Network Warining";
    private final String STR_GENERAL_ERROR = "General Error(Constants E)";
    public final Integer INT_LGU_ARM_PASSED = 0;
    public final Integer INT_LGU_IAP_GENERAL_ERROR = -65536;
    public final Integer INT_LGU_IAP_NOT_INSTALLED = -100;
    public final Integer INT_LGU_IAP_NOT_CHARGED = 999;
    private final Properties properties = new Properties();
    private ConcurrentMap<Long, String> notificationMessageMap = new ConcurrentHashMap();

    /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
    public static Constants[] valuesCustom() {
        Constants[] constantsArrValuesCustom = values();
        int length = constantsArrValuesCustom.length;
        Constants[] constantsArr = new Constants[length];
        System.arraycopy(constantsArrValuesCustom, 0, constantsArr, 0, length);
        return constantsArr;
    }

    Constants() {
        InputStream is = null;
        try {
            try {
                try {
                    is = NexusGLActivity.myActivity.getBaseContext().getResources().openRawResource(C0046R.raw.message);
                    this.properties.load(is);
                } catch (Exception e) {
                    Log.e(getClass().getSimpleName(), e.getMessage());
                    e.printStackTrace();
                    if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e2) {
                            Log.e(getClass().getSimpleName(), e2.getMessage());
                            e2.printStackTrace();
                        }
                    }
                }
            } finally {
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e3) {
                        Log.e(getClass().getSimpleName(), e3.getMessage());
                        e3.printStackTrace();
                    }
                }
            }
        } catch (IOException e4) {
            Log.e(getClass().getSimpleName(), e4.getMessage());
            e4.printStackTrace();
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e5) {
                    Log.e(getClass().getSimpleName(), e5.getMessage());
                    e5.printStackTrace();
                }
            }
        }
    }

    public String getMessage(Integer msgCode) {
        if (msgCode != null) {
            if (this.properties.containsKey(msgCode.toString())) {
                return this.properties.getProperty(msgCode.toString());
            }
            String strMsg = "0x" + Integer.toHexString(msgCode.intValue()).toUpperCase();
            if (this.properties.containsKey(strMsg)) {
                this.properties.put(msgCode.toString(), this.properties.getProperty(strMsg));
                return this.properties.getProperty(msgCode.toString());
            }
        }
        return "General Error(Constants E)";
    }

    public String getMessage(Integer msgCode, Integer elseCode) {
        if (msgCode != null) {
            if (this.properties.containsKey(msgCode.toString())) {
                return this.properties.getProperty(msgCode.toString());
            }
            String strMsg = "0x" + Integer.toHexString(msgCode.intValue()).toUpperCase();
            if (this.properties.containsKey(strMsg)) {
                this.properties.put(msgCode.toString(), this.properties.getProperty(strMsg));
                return this.properties.getProperty(msgCode.toString());
            }
        }
        if (this.properties.containsKey(elseCode.toString())) {
            return this.properties.getProperty(elseCode.toString());
        }
        return getMessage(null);
    }

    public void addNotificationMessage(Long msgNo, String errorMsg) {
        if (errorMsg == null) {
            errorMsg = "Network Warining";
        }
        this.notificationMessageMap.put(msgNo, errorMsg);
    }

    public String getNotificationMessage(Long msgNo) {
        if (this.notificationMessageMap.containsKey(msgNo)) {
            return this.notificationMessageMap.remove(msgNo);
        }
        return null;
    }

    public void showNetworkAlert(final Long currentMillis, String errorMsg, final boolean bCallback) {
        addNotificationMessage(currentMillis, errorMsg);
        this.handler.post(new Runnable() { // from class: com.gamevil.nom5.lgu.Constants.1
            @Override // java.lang.Runnable
            public void run() {
                AlertDialog.Builder builder = new AlertDialog.Builder(NexusGLActivity.myActivity);
                builder.setTitle("Alert");
                builder.setMessage(Constants.this.getNotificationMessage(currentMillis));
                final boolean z = bCallback;
                builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.gamevil.nom5.lgu.Constants.1.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        if (z) {
                            Natives.handleCletEvent(33, -1, -1, 0);
                        }
                    }
                });
                builder.create();
                builder.show();
            }
        });
    }
}
