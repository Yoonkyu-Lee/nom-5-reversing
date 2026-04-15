package com.gamevil.nexus2;

import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Handler;
import android.os.RemoteException;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.ProgressBar;
import com.gamevil.nexus2.net.NexusConstants;
import com.gamevil.nexus2.p000ui.NexusSound;
import com.gamevil.nom5.lgu.C0046R;
import com.kaf.net.Network;
import com.lguplus.common.bill.IBillSocket;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;

/* JADX INFO: loaded from: classes.dex */
public class Natives {
    public static boolean bCanConn;
    public static IBillSocket billSock;
    private static EventListener eventListener;
    public static byte[] rcvData;
    private static UIListener uiListener;
    private static int recvLength = 0;
    private static String strAID = "0003572B";
    private static Handler mHandler = new Handler();
    private static Handler mHandler2 = new Handler();

    public interface EventListener {
        void GWSwapBuffers();

        void OnMessage(String str);
    }

    public interface UIListener {
        void OnEvent(int i);

        void OnSoundPlay(int i, int i2, boolean z);

        void OnStopSound();

        void OnUIStatusChange(int i);

        void OnVibrate(int i);
    }

    public static native void InitializeJNIGlobalRef();

    public static native void NativeAsyncTimerCallBack(int i);

    public static native void NativeDestroyClet();

    public static native void NativeGetPlayerName(String str);

    public static native void NativeInitDeviceInfo(int i, int i2);

    public static native void NativeInitWithBufferSize(int i, int i2);

    public static native void NativeIsNexusOne(boolean z);

    public static native void NativeNetTimeOut();

    public static native void NativePauseClet();

    public static native void NativeRender();

    public static native void NativeResize(int i, int i2);

    public static native void NativeResponseIAP(String str, int i);

    public static native void NativeResumeClet();

    public static native void handleCletEvent(int i, int i2, int i3, int i4);

    public static void setEventListener(EventListener _listener) {
        eventListener = _listener;
    }

    private static void OnMessage(String _msg) {
        if (eventListener != null) {
            eventListener.OnMessage(_msg);
        }
    }

    private static void GWSwapBuffers() {
        if (eventListener != null) {
            eventListener.GWSwapBuffers();
        }
    }

    public static void setUIListener(UIListener _listener) {
        uiListener = _listener;
    }

    private static void OnUIStatusChange(int _status) {
        uiListener.OnUIStatusChange(_status);
    }

    private static void OnSoundPlay(int sndID, int vol, boolean isLoop) {
        uiListener.OnSoundPlay(sndID, vol, isLoop);
    }

    private static void OnStopSound() {
        uiListener.OnStopSound();
    }

    private static void OnVibrate(int _time) {
        uiListener.OnVibrate(_time);
    }

    private static void OnEvent(int _event) {
        uiListener.OnEvent(_event);
    }

    private static void OnAsyncTimerSet(int timeOut, int timerIndex) {
        NexusGLActivity.myActivity.OnAsyncTimerSet(timeOut, timerIndex);
    }

    private static int isAssetExist(String _fileName) {
        InputStream is = null;
        try {
            is = NexusGLActivity.myActivity.getAssets().open(_fileName);
            int readLen = is.available();
            return readLen;
        } catch (Exception e) {
            if (is != null) {
                try {
                    is.close();
                } catch (Exception e2) {
                    return 0;
                }
            }
            return 0;
        }
    }

    private static byte[] readAssete(String _fileName) {
        byte[] bArr = null;
        InputStream is = null;
        ByteArrayOutputStream bo = null;
        try {
            is = NexusGLActivity.myActivity.getAssets().open(_fileName);
            byte[] buffer = new byte[is.available()];
            ByteArrayOutputStream bo2 = new ByteArrayOutputStream();
            while (true) {
                try {
                    int readLen = is.read(buffer);
                    if (readLen != -1) {
                        bo2.write(buffer, 0, readLen);
                    } else {
                        is.close();
                        byte[] rtnBytes = bo2.toByteArray();
                        bo2.close();
                        bArr = rtnBytes;
                        return bArr;
                    }
                } catch (IOException e) {
                    bo = bo2;
                    if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e2) {
                        }
                    }
                    if (bo != null) {
                        try {
                            bo.close();
                            return bArr;
                        } catch (IOException e3) {
                            return bArr;
                        }
                    }
                    return bArr;
                }
            }
        } catch (IOException e4) {
        }
    }

    private static int isFileExist(String _name) {
        InputStream is = null;
        try {
            is = NexusGLActivity.myActivity.openFileInput(_name);
            return is.available();
        } catch (FileNotFoundException e) {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e2) {
                }
            }
            return 0;
        } catch (IOException e3) {
            return 0;
        }
    }

    private static void saveFile(String _name, byte[] pData) throws Throwable {
        BufferedOutputStream bos = null;
        try {
            BufferedOutputStream bos2 = new BufferedOutputStream(NexusGLActivity.myActivity.openFileOutput(_name, 0));
            try {
                bos2.write(pData, 0, pData.length);
                bos2.flush();
                if (bos2 != null) {
                    try {
                        bos2.close();
                    } catch (Exception e) {
                    }
                }
            } catch (Exception e2) {
                bos = bos2;
                if (bos != null) {
                    try {
                        bos.close();
                    } catch (Exception e3) {
                    }
                }
            } catch (Throwable th) {
                th = th;
                bos = bos2;
                if (bos != null) {
                    try {
                        bos.close();
                    } catch (Exception e4) {
                    }
                }
                throw th;
            }
        } catch (Exception e5) {
        } catch (Throwable th2) {
            th = th2;
        }
    }

    private static byte[] loadFile(String _name) {
        InputStream is = null;
        ByteArrayOutputStream bo = null;
        try {
            is = NexusGLActivity.myActivity.openFileInput(_name);
            byte[] buffer = new byte[NexusConstants.BUFFER_SIZE];
            ByteArrayOutputStream bo2 = new ByteArrayOutputStream();
            while (true) {
                try {
                    int readLen = is.read(buffer);
                    if (readLen != -1) {
                        bo2.write(buffer, 0, readLen);
                    } else {
                        is.close();
                        byte[] data = bo2.toByteArray();
                        bo2.close();
                        return data;
                    }
                } catch (Exception e) {
                    bo = bo2;
                    if (is != null) {
                        try {
                            is.close();
                        } catch (IOException e2) {
                            return null;
                        }
                    }
                    if (bo != null) {
                        bo.close();
                    }
                    return null;
                }
            }
        } catch (Exception e3) {
        }
    }

    private static String getAbsolueFilePath() {
        String filePath = NexusGLActivity.myActivity.getFilesDir().getAbsolutePath();
        return filePath;
    }

    private static void stopAndroidSound() {
        NexusSound.stopAllSound();
    }

    private static void vibrateAndroid(int _time) {
        NexusSound.Vibrator(_time);
    }

    private static void finishApp() {
    }

    private static void SetSpeed(int _speed) {
        NexusGLThread.SetFPS(_speed);
    }

    private static void changeUIStatus(int _status) {
        NexusGLActivity.uiViewControll.changeUIStatus(_status);
    }

    private static String getPlayerName() {
        return NexusGLActivity.uiViewControll.textInputed;
    }

    private static byte[] getPlayerNameByte() {
        try {
            byte[] rtnByte = NexusGLActivity.uiViewControll.textInputed.getBytes("KSC5601");
            return rtnByte;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static void clearPlayerName() {
        NexusGLActivity.uiViewControll.textInputed = "";
    }

    private static byte[] getPhoneNumber() {
        String str = ((TelephonyManager) NexusGLActivity.myActivity.getSystemService("phone")).getLine1Number();
        if (str == null) {
            str = "01012341234";
        }
        int length = str.length();
        if (length >= 10 && !str.substring(0, 2).equals("01")) {
            str = "01" + str.substring(length - 9, length);
        }
        byte[] num = str.getBytes();
        return num;
    }

    private static byte[] getPhoneModel() {
        return Build.MODEL.getBytes();
    }

    public static int isNetAvailable() {
        boolean _reachable;
        ConnectivityManager conn_manager = (ConnectivityManager) NexusGLActivity.myActivity.getSystemService("connectivity");
        NetworkInfo network_info = conn_manager.getActiveNetworkInfo();
        if (network_info != null && network_info.isConnected()) {
            _reachable = true;
        } else {
            _reachable = false;
        }
        if (_reachable) {
            return network_info.getType();
        }
        return -1;
    }

    private static int getNetState() {
        return bCanConn ? 1 : 0;
    }

    private static int netConnect() {
        return bCanConn ? 1 : -1;
    }

    private static int netSocket() {
        if (billSock == null) {
            bCanConn = false;
        }
        return bCanConn ? 1 : 0;
    }

    private static int netBillcomSocketConnect(String _ip, int _port) {
        try {
            if (billSock == null) {
                return 0;
            }
            int rtn = billSock.connect(strAID, _ip, _port) ? 1 : 0;
            Log.d(Natives.class.getName(), String.format("netBillcomSocketConnect(IP : %s, PORT : %d)", _ip, Integer.valueOf(_port)));
            return rtn;
        } catch (RemoteException e) {
            Log.e(Natives.class.getName(), String.format("netBillcomSocketConnect(IP : %s, PORT : %d)", _ip, Integer.valueOf(_port)));
            e.printStackTrace();
            return 0;
        }
    }

    private static int netBillcomSocketWrite(byte[] sendData) throws RemoteException {
        int length;
        Log.d(Natives.class.getName(), "netBillcomSocketWrite(...) START");
        try {
            if (!billSock.writeBytes(sendData)) {
                Log.e(Natives.class.getName(), "netBillcomSocketWrite(...) billSock.writeBytes(sendData) ERROR");
                length = -1;
            } else {
                rcvData = null;
                recvLength = 0;
                rcvData = Read();
                Log.d(Natives.class.getName(), "netBillcomSocketWrite(...) END");
                length = sendData.length;
            }
            return length;
        } catch (RemoteException e) {
            Log.e(Natives.class.getName(), "netBillcomSocketWrite(...) : Exception : " + billSock.getLastErrorMsg());
            e.printStackTrace();
            return -1;
        }
    }

    public static byte[] Read() throws RemoteException {
        Log.d(Natives.class.getName(), "Read() : billSock.readBytes(readData) - START");
        byte[] readData = new byte[Network.NETSTATUS_WIFI_DISCONNECTING];
        try {
            int result = billSock.readBytes(readData);
            Log.d(Natives.class.getName(), "Read() : billSock.readBytes(readData) - result = " + result);
            if (result < 0) {
                throw new RemoteException();
            }
            Log.d(Natives.class.getName(), "Read() : billSock.writeBytes(sendData) - END");
            return readData;
        } catch (RemoteException e) {
            Log.e(Natives.class.getName(), "Read() : Error : billSock.getLastErrorMsg() : " + billSock.getLastErrorMsg());
            throw e;
        }
    }

    private static byte[] netBillcomSocketRead(int _length) {
        Log.d(Natives.class.getName(), String.format("netBillcomSocketRead(_length : %d) START", Integer.valueOf(_length)));
        byte[] readData = new byte[_length];
        System.arraycopy(rcvData, recvLength, readData, 0, _length);
        recvLength += readData.length;
        Log.d(Natives.class.getName(), String.format("netBillcomSocketRead(recvLength : %d) END", Integer.valueOf(recvLength)));
        return readData;
    }

    private static int netBillcomSocketClose() {
        Log.d(Natives.class.getName(), "netBillcomSocketClose() START");
        try {
            if (billSock != null) {
                billSock.close();
            }
            Log.d(Natives.class.getName(), "netBillcomSocketClose() END");
            return 1;
        } catch (RemoteException e) {
            Log.e(Natives.class.getName(), "netBillcomSocketClose() : " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }

    public static void showLoadingDialog() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.Natives.1
            @Override // java.lang.Runnable
            public void run() {
                ProgressBar bar = (ProgressBar) NexusGLActivity.myActivity.findViewById(C0046R.id.progress_small);
                bar.setVisibility(0);
            }
        });
    }

    public static void hideLoadingDialog() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.Natives.2
            @Override // java.lang.Runnable
            public void run() {
                ProgressBar bar = (ProgressBar) NexusGLActivity.myActivity.findViewById(C0046R.id.progress_small);
                bar.setVisibility(4);
            }
        });
    }

    private static String getVersion() {
        return NexusGLActivity.myActivity.version;
    }

    public static void trackPageViewDispatch(String str) {
        NexusGLActivity.AnalyticsTrackPageView(str);
    }

    public static void trackEventDispatch(String _action, String _lable) {
        NexusGLActivity.AnalyticsTrackEvent(_action, _lable);
    }

    private static void showTitleComponent() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.Natives.3
            @Override // java.lang.Runnable
            public void run() {
                NexusGLActivity.myActivity.showTitleComponent();
            }
        });
    }

    private static void hideTitleComponent() {
        mHandler.post(new Runnable() { // from class: com.gamevil.nexus2.Natives.4
            @Override // java.lang.Runnable
            public void run() {
                NexusGLActivity.myActivity.hideTitleComponent();
            }
        });
    }

    private static int getGLOptionLinear() {
        SharedPreferences settings = NexusGLActivity.myActivity.getSharedPreferences("glOptions", 0);
        return settings.getInt("glQuality", 1);
    }

    public static void saveGLOptionLinear(int _mode) {
        SharedPreferences settings = NexusGLActivity.myActivity.getSharedPreferences("glOptions", 0);
        SharedPreferences.Editor editor = settings.edit();
        editor.putInt("glQuality", _mode);
        editor.commit();
    }

    private static void requestIAP(int _idx, String _pID, byte[] _itemName) {
    }

    public static void openUrl(String _query) {
        try {
            NexusGLActivity.myActivity.startActivity(Intent.getIntent(_query).setAction("android.intent.action.VIEW"));
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }

    public static void openStoreWithProductId(String _pid) {
    }

    public long availableSize(String path) {
        StatFs stat = new StatFs(path);
        int blockSize = stat.getBlockSize();
        return ((long) blockSize) * (((long) stat.getAvailableBlocks()) - 4);
    }
}
