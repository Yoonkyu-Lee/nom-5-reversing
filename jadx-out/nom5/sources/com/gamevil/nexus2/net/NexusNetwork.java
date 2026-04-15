package com.gamevil.nexus2.net;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.gamevil.nexus2.NexusGLActivity;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.Vector;

/* JADX INFO: loaded from: classes.dex */
public class NexusNetwork implements NexusConstants {
    private static boolean isBigEndian = false;
    private static boolean isFullNetwork = false;
    protected static NexusGLActivity myActivity = null;
    protected static String myAppId = null;
    protected static short recvLength = 0;
    protected static short sendLength = 0;
    protected static short recvCmd = 0;
    protected static short sendCmd = 0;
    protected static boolean isRunning = true;
    protected static byte errorCounter = 0;
    protected static long nextSyncTime = 0;
    protected static String ServerIP = "218.146.3.18";
    protected static int ServerPort = 23204;
    protected static Socket socketConnection = null;
    protected static DataInputStream inputStream = null;
    protected static DataOutputStream outputStream = null;
    private static NexusNetwork self = null;
    protected Vector<byte[]> result = new Vector<>();
    protected Vector<byte[]> requestQueue = new Vector<>();

    public NexusNetwork(NexusGLActivity activity, String appID) {
        self = this;
        errorCounter = (byte) 0;
        myActivity = activity;
        myAppId = appID;
    }

    public static void setRunning(boolean b) {
        isRunning = b;
    }

    public static void setServerEndian(boolean b) {
        isBigEndian = b;
    }

    public static void setFullNetwork(boolean b) {
        isFullNetwork = b;
    }

    public static void serverInfo(String sIP, int nPort) {
        ServerIP = sIP;
        ServerPort = nPort;
    }

    public static int getRecvLength() {
        return recvLength;
    }

    public void doSendTCP(byte[] send) {
        this.requestQueue.addElement(send);
    }

    public byte[] getResponse() {
        byte[] barray = (byte[]) null;
        if (!this.result.isEmpty()) {
            Object obj = this.result.firstElement();
            this.result.removeElementAt(0);
            return obj instanceof byte[] ? (byte[]) obj : barray;
        }
        return barray;
    }

    public boolean isBusy() {
        return (this.requestQueue.isEmpty() && this.result.isEmpty()) ? false : true;
    }

    public static boolean commonNetAvailable() {
        ConnectivityManager connManager = (ConnectivityManager) myActivity.getSystemService("connectivity");
        NetworkInfo netInfo = connManager.getActiveNetworkInfo();
        return netInfo != null && netInfo.isConnected();
    }

    public static boolean openTCPConnection() {
        if (socketConnection != null) {
            return true;
        }
        try {
            InetAddress serverAddr = InetAddress.getByName(ServerIP);
            socketConnection = new Socket(serverAddr, ServerPort);
            if (isFullNetwork) {
                socketConnection.setSoTimeout(20000);
            } else {
                socketConnection.setKeepAlive(true);
            }
            return socketConnection != null ? true : true;
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
            closeTCPConnection();
            return false;
        } catch (Exception e2) {
            e2.printStackTrace();
            closeTCPConnection();
            return false;
        }
    }

    public static boolean closeTCPConnection() {
        try {
            if (outputStream != null) {
                outputStream.close();
                outputStream = null;
            }
            if (inputStream != null) {
                inputStream.close();
                inputStream = null;
            }
            if (socketConnection != null) {
                socketConnection.close();
                socketConnection = null;
            }
            Thread.sleep(500L);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            outputStream = null;
            inputStream = null;
            socketConnection = null;
            return false;
        }
    }

    public static final byte[] int2byte(int i) {
        byte[] dest = new byte[4];
        if (isBigEndian) {
            dest[3] = (byte) (i & 255);
            dest[2] = (byte) ((i >>> 8) & 255);
            dest[1] = (byte) ((i >>> 16) & 255);
            dest[0] = (byte) ((i >>> 24) & 255);
        } else {
            dest[0] = (byte) (i & 255);
            dest[1] = (byte) ((i >>> 8) & 255);
            dest[2] = (byte) ((i >>> 16) & 255);
            dest[3] = (byte) ((i >>> 24) & 255);
        }
        return dest;
    }

    public static final int byte2int(byte[] b, int offset) {
        if (isBigEndian) {
            int i = ((b[offset] & 255) << 24) | ((b[offset + 1] & 255) << 16) | ((b[offset + 2] & 255) << 8) | (b[offset + 3] & 255);
            return i;
        }
        int i2 = ((b[offset + 3] & 255) << 24) | ((b[offset + 2] & 255) << 16) | ((b[offset + 1] & 255) << 8) | (b[offset] & 255);
        return i2;
    }

    public static final byte[] short2byte(short s) {
        byte[] dest = new byte[2];
        if (isBigEndian) {
            dest[1] = (byte) (s & 255);
            dest[0] = (byte) ((s >>> 8) & 255);
        } else {
            dest[0] = (byte) (s & 255);
            dest[1] = (byte) ((s >>> 8) & 255);
        }
        return dest;
    }

    public static final short byte2short(byte[] b, int offset) {
        if (isBigEndian) {
            short s = (short) (((b[offset] & 255) << 8) | (b[offset + 1] & 255));
            return s;
        }
        short s2 = (short) (((b[offset + 1] & 255) << 8) | (b[offset] & 255));
        return s2;
    }
}
