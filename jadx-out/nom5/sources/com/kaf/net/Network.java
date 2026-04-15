package com.kaf.net;

import com.kaf.GeneralException;
import com.kaf.KafManager;
import com.kaf.NotSupportException;

/* JADX INFO: loaded from: classes.dex */
public class Network {
    public static final int ACCESSMODE_DEFAULT = 0;
    public static final int ACCESSMODE_WCDMA_ONLY = 1;
    public static final int CONNECT_WCDMA = 0;
    public static final int CONNECT_WIBRO = 1;
    public static final int CONNECT_WIFI_NESPOT_Private_IP = 3;
    public static final int CONNECT_WIFI_NESPOT_Public_IP = 2;
    public static final int CONNECT_WIFI_PRIVATE_Private_IP = 5;
    public static final int CONNECT_WIFI_PRIVATE_Public_IP = 4;
    public static final int CONNECT_WLAN_IP = 6;
    public static final int NETSTATUS_ALL = -1;
    public static final int NETSTATUS_NON_EAP_AKA_CONNECT = 2097152;
    public static final int NETSTATUS_NON_EAP_AKA_CONNECTING = 1048576;
    public static final int NETSTATUS_NON_EAP_AKA_DISCONNECT = 4194304;
    public static final int NETSTATUS_WCDMA_CONNECT = 2;
    public static final int NETSTATUS_WCDMA_CONNECTING = 1;
    public static final int NETSTATUS_WCDMA_DISCONNECT = 8;
    public static final int NETSTATUS_WCDMA_DISCONNECTING = 4;
    public static final int NETSTATUS_WIFI_DISCONNECT = 131072;
    public static final int NETSTATUS_WIFI_DISCONNECTING = 65536;
    public static final int NETSTATUS_WIFI_NESPOT_CONNECTING = 16;
    public static final int NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT = 128;
    public static final int NETSTATUS_WIFI_NESPOT_Public_IP_CONNECT = 32;
    public static final int NETSTATUS_WIFI_PRIVATE_CONNECTING = 256;
    public static final int NETSTATUS_WIFI_PRIVATE_Private_IP_CONNECT = 2048;
    public static final int NETSTATUS_WIFI_PRIVATE_Public_IP_CONNECT = 512;
    public static final int NETSTATUS_WLAN_CONNECT = 8192;
    public static final int NETSTATUS_WLAN_CONNECTING = 4096;
    public static final int NETSTATUS_WLAN_DISABLED = 32768;
    public static final int NETSTATUS_WLAN_DISCONNECT = 16384;
    public static final int NET_CONNECT_DISABLE_DUN = -4;
    public static final int NET_CONNECT_ERROR = -1;
    public static final int NET_CONNECT_ERROR_INTERNET = -2;
    public static final int NET_CONNECT_ERROR_KAF_E_USER_CANCELLED = -5;
    public static final int NET_CONNECT_ERROR_NON_EAP_AKA = -10;
    public static final int NET_CONNECT_ERROR_ROAMINGINTERNET = -3;
    public static final int NET_CONNECT_ERROR_WCDMA_ONLY = -7;
    public static final int NET_CONNECT_ERROR_WIFI_PRIVATE = -6;
    public static final int NET_CONNECT_ERROR_WLAN_DISABLED = -8;
    public static final int NET_CONNECT_ERROR_WLAN_DISCONNECT = -9;
    private INetwork network;

    public Network() {
        this.network = null;
        try {
            this.network = KafManager.getInstance().getNetworkInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int netConnect(int type, int timeout) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.network == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.network.netConnect(type, timeout);
    }

    public boolean netClose() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.network == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.network.netClose();
    }

    public int getStatus() throws IllegalAccessException, GeneralException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.network == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.network.getStatus();
    }

    public String getIWLANIP() throws IllegalAccessException, GeneralException, NotSupportException {
        if (!KafManager.getInstance().isKafLibraryInit()) {
            throw new GeneralException(KafManager.ERR_LIB_NOT_LOADED_CODE, KafManager.ERR_LIB_NOT_LOADED_MESG);
        }
        if (this.network == null) {
            throw new GeneralException(KafManager.ERR_INVALID_OBJECT_CODE, KafManager.ERR_INVALID_OBJECT_MESG);
        }
        return this.network.getIWLANIP();
    }
}
