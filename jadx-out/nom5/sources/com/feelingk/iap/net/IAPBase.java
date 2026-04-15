package com.feelingk.iap.net;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Message;
import com.feelingk.iap.IAPLib;
import com.feelingk.iap.IAPLibSetting;
import com.feelingk.iap.util.CommonF;
import com.feelingk.iap.util.CommonString;
import com.feelingk.iap.util.Defines;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/* JADX INFO: loaded from: classes.dex */
public class IAPBase extends IAPNet {
    static final String TAG = "IAPBase";
    public String APPLICATION_ID;
    public String BP_SERVER_IP;
    public int BP_SERVER_PORT;
    public String MDN;
    public Context mContext;
    public ExecutorService mExecutorService;
    public Handler mNetworkHandler;
    public boolean isWifi = false;
    public String errMsg = "";
    public int subErrorCode = 0;
    private InitConfirm initCfm = null;
    private MsgConfirm msgConfirm = null;
    private ItemWholeAuthConfirm itemWholeAuthConfirm = null;
    private ItemUseConfirm itemUseConfirm = null;
    private ItemInfoConfirm itemInfoConfirm = null;
    private String mEncJuminNumer = null;
    public NETWORK_RESULT_TYPE mNetworkState = NETWORK_RESULT_TYPE.APP_MAIN;

    public enum NETWORK_RESULT_TYPE {
        APP_MAIN,
        APP_VALID_USER,
        APP_QUERY_ITEM,
        APP_QUERY_ITEM_OK,
        APP_CHARGE_ITEM,
        APP_CHARGE_ITEM_OK,
        APP_DATA_OK,
        APP_DOWNLOADING,
        APP_ERROR,
        APP_MAX;

        /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
        public static NETWORK_RESULT_TYPE[] valuesCustom() {
            NETWORK_RESULT_TYPE[] network_result_typeArrValuesCustom = values();
            int length = network_result_typeArrValuesCustom.length;
            NETWORK_RESULT_TYPE[] network_result_typeArr = new NETWORK_RESULT_TYPE[length];
            System.arraycopy(network_result_typeArrValuesCustom, 0, network_result_typeArr, 0, length);
            return network_result_typeArr;
        }
    }

    public IAPBase(Context ctx, Handler handler, IAPLibSetting setting, String mdn) {
        this.mNetworkHandler = null;
        this.BP_SERVER_IP = null;
        this.BP_SERVER_PORT = 0;
        this.APPLICATION_ID = "";
        this.MDN = "";
        this.mContext = null;
        this.mExecutorService = null;
        this.mContext = ctx;
        this.mNetworkHandler = handler;
        this.APPLICATION_ID = setting.AppID;
        this.BP_SERVER_IP = setting.BP_IP;
        this.BP_SERVER_PORT = setting.BP_Port;
        this.MDN = mdn;
        this.mExecutorService = Executors.newFixedThreadPool(5);
    }

    public InitConfirm getInitConfirmMessage() {
        return this.initCfm;
    }

    public ItemInfoConfirm getItemInfoConfirmMessage() {
        return this.itemInfoConfirm;
    }

    public ItemUseConfirm getItemUseConfirmMessage() {
        return this.itemUseConfirm;
    }

    public ItemWholeAuthConfirm getItemWholeAuthConfirmMessage() {
        return this.itemWholeAuthConfirm;
    }

    public void setBaseEncodeJuminNumber(String jumin) {
        this.mEncJuminNumer = jumin;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void SendMessageToNetwork(int messageID, Object obj) {
        Message messageH = this.mNetworkHandler.obtainMessage(messageID, obj);
        messageH.arg1 = this.subErrorCode;
        this.mNetworkHandler.sendMessage(messageH);
    }

    public void Reset() {
        if (this.mExecutorService.isShutdown()) {
            this.mExecutorService = Executors.newFixedThreadPool(5);
        }
    }

    public void StopService() {
        if (this.mExecutorService != null) {
            this.mExecutorService.shutdown();
        }
    }

    public static void close() {
        IAPNet.iapClose(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean resultProc(MsgConfirm result) {
        if (result.getResultCode() != 0) {
            CommonF.LOGGER.m0e("IAPNet", "[ DEBUG ]  Network ErrorCode :" + ((int) result.getResultCode()));
            try {
                this.subErrorCode = result.getResultCode();
                if (result.getMsg() != null) {
                    this.errMsg = new String(result.getMsg(), "MS949");
                    CommonF.LOGGER.m2i("flybbird", "Network Message :" + this.errMsg);
                } else if (result.GetUserMessage() != null) {
                    this.errMsg = result.GetUserMessage();
                } else if (result.GetDumpMessage() != null) {
                    this.errMsg = result.GetDumpMessage();
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            this.mNetworkState = NETWORK_RESULT_TYPE.APP_ERROR;
            return false;
        }
        this.subErrorCode = 0;
        return true;
    }

    public void ItemInfo(int pTelecom, String PID, String PNAME, String pTID, String pBPInfo) {
        this.mExecutorService.submit(new CallItemInfo(this, pTelecom, PID, PNAME, pTID, pBPInfo));
    }

    private class CallItemInfo implements Callable<Boolean> {
        private String pBPInfo;
        private String pID;
        private String pName;
        private String pTID;
        private int pTelecom;

        public CallItemInfo(IAPBase iAPBase, int telecom, String productID, String productName, String pTID, String pBPInfo) {
            this(productID, productName);
            this.pTelecom = telecom;
            this.pTID = pTID;
            this.pBPInfo = pBPInfo;
        }

        public CallItemInfo(String productID, String productName) {
            this.pTelecom = 0;
            this.pID = null;
            this.pName = null;
            this.pTID = null;
            this.pBPInfo = null;
            this.pID = productID;
            this.pName = productName;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID != null && IAPBase.this.connect(this.pTelecom, null, this.pTID)) {
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_VALID_USER;
                IAPBase.this.msgConfirm = IAPNet.iapSendItemQuery(this.pID, this.pName, this.pTID, this.pBPInfo);
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_QUERY_ITEM;
                if (!IAPBase.this.resultProc(IAPBase.this.msgConfirm)) {
                    if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_ITEMQUERY, IAPBase.this.errMsg);
                    } else {
                        IAPBase.this.subErrorCode = 0;
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                    }
                    return false;
                }
                IAPBase.this.itemInfoConfirm = IAPNet.iapSendItemInfoQuery(this.pID);
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_QUERY_ITEM;
                if (!IAPBase.this.resultProc(IAPBase.this.itemInfoConfirm)) {
                    if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_ITEMINFO, null);
                    } else {
                        IAPBase.this.subErrorCode = 0;
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                    }
                    return false;
                }
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_QUERY_ITEM_OK;
                IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_ITEMINFO_FINISH, IAPBase.this.itemInfoConfirm);
                return true;
            }
            return false;
        }
    }

    public void ItemQuery(String PID, String PName) {
        this.mExecutorService.submit(new CallItemQuery(PID, PName));
    }

    public void ItemQuery(int telecom, String PID, String PName, String PTID, String pBPInfo) {
        this.mExecutorService.submit(new CallItemQuery(this, telecom, PID, PName, PTID, pBPInfo));
    }

    private class CallItemQuery implements Callable<Boolean> {
        private String pBPInfo;
        private String pID;
        private String pName;
        private String pTID;
        private int pTelecom;

        public CallItemQuery(String productID, String productName) {
            this.pTelecom = 0;
            this.pID = null;
            this.pName = null;
            this.pTID = null;
            this.pBPInfo = null;
            this.pID = productID;
            this.pName = productName;
        }

        public CallItemQuery(IAPBase iAPBase, int telecom, String productID, String productName, String pTID, String pBPInfo) {
            this(productID, productName);
            this.pTelecom = telecom;
            this.pTID = pTID;
            this.pBPInfo = pBPInfo;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID != null && IAPBase.this.connect(this.pTelecom, null, this.pTID)) {
                IAPBase.this.msgConfirm = IAPNet.iapSendItemQuery(this.pID, this.pName, this.pTID, this.pBPInfo);
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_QUERY_ITEM;
                if (!IAPBase.this.resultProc(IAPBase.this.msgConfirm)) {
                    if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_ITEMQUERY, IAPBase.this.errMsg);
                    } else {
                        IAPBase.this.subErrorCode = 0;
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                    }
                    return false;
                }
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_QUERY_ITEM_OK;
                IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_ITEMQUERY_FINISH, null);
                return true;
            }
            return false;
        }
    }

    public void ItemPurchase(String PID, String PNAME, Boolean TCASH) {
        this.mExecutorService.submit(new CallItemPurchase(PID, PNAME, TCASH));
    }

    public void ItemPurchase(String PID, String PNAME, String TID, String BPINFO, Boolean TCASH) {
        this.mExecutorService.submit(new CallItemPurchase(this, PID, PNAME, TCASH, TID, BPINFO));
    }

    public void ItemPurchase(String PID, String PNAME, String TID, String BPINFO, Boolean TCASH, Boolean useBPProtocol) {
        this.mExecutorService.submit(new CallItemPurchase(this, PID, PNAME, TCASH, TID, BPINFO, useBPProtocol));
    }

    private class CallItemPurchase implements Callable<Boolean> {
        private String TID;
        private Boolean bTCash;
        private Boolean bUseBPProtocl;
        private String pBPInfo;
        private String pID;
        private String pName;

        public CallItemPurchase(String productID, String productName, Boolean TCash) {
            this.pID = null;
            this.pName = null;
            this.bTCash = false;
            this.TID = null;
            this.pBPInfo = null;
            this.bUseBPProtocl = false;
            this.pID = productID;
            this.pName = productName;
            this.bTCash = TCash;
        }

        public CallItemPurchase(IAPBase iAPBase, String productID, String productName, Boolean TCash, String TID, String BPINFO) {
            this(productID, productName, TCash);
            this.TID = TID;
            this.pBPInfo = BPINFO;
        }

        public CallItemPurchase(IAPBase iAPBase, String productID, String productName, Boolean TCash, String TID, String BPINFO, Boolean useProtocol) {
            this(productID, productName, TCash);
            this.TID = TID;
            this.pBPInfo = BPINFO;
            this.bUseBPProtocl = useProtocol;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID == null) {
                return false;
            }
            IAPBase.this.msgConfirm = IAPNet.iapSendItemPurchase(this.pID, this.pName, this.bTCash, this.TID, this.pBPInfo, this.bUseBPProtocl);
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM;
            if (!IAPBase.this.resultProc(IAPBase.this.msgConfirm)) {
                if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_ITEMPURCHASE, IAPBase.this.errMsg);
                } else {
                    IAPBase.this.subErrorCode = 0;
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_PAYMENTTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                }
                return false;
            }
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM_OK;
            IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_PURCHASE_FINISH, IAPBase.this.msgConfirm);
            return true;
        }
    }

    public void ItemPurchaseDanal(String mdn, String pID, String pName, int pCarrier, String TID, String BPInfo, Boolean bTCash, String encJumin) {
        this.mExecutorService.submit(new CallItemPurchaseDanal(mdn, pID, pName, pCarrier, TID, BPInfo, bTCash.booleanValue(), encJumin));
    }

    private class CallItemPurchaseDanal implements Callable<Boolean> {
        private boolean bUseTcash;
        private String pBPInfo;
        private int pCarrier;
        private String pEncJumin;
        private String pID;
        private String pMdn;
        private String pName;
        private String pTID;

        public CallItemPurchaseDanal(String mdn, String id, String name, int carrier, String tid, String bpInfo, boolean TCash, String encJumin) {
            this.pMdn = null;
            this.pID = null;
            this.pName = null;
            this.pCarrier = -1;
            this.pTID = null;
            this.pBPInfo = null;
            this.bUseTcash = false;
            this.pEncJumin = null;
            this.pMdn = mdn;
            this.pID = id;
            this.pName = name;
            this.pCarrier = carrier;
            this.pTID = tid;
            this.pBPInfo = bpInfo;
            this.bUseTcash = TCash;
            this.pEncJumin = encJumin;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID == null) {
                return false;
            }
            IAPBase.this.msgConfirm = IAPNet.iapSendItemPurchaseByDanal(this.pMdn, this.pID, this.pName, this.pCarrier, this.pTID, this.pBPInfo, this.bUseTcash, this.pEncJumin);
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM;
            if (!IAPBase.this.resultProc(IAPBase.this.msgConfirm)) {
                if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_ITEMPURCHASE, IAPBase.this.errMsg);
                } else {
                    IAPBase.this.subErrorCode = 0;
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_PAYMENTTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                }
                return false;
            }
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM_OK;
            IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_PURCHASE_FINISH, IAPBase.this.msgConfirm);
            return true;
        }
    }

    public void ItemWholeAuth(int telecom) {
        this.mExecutorService.submit(new CallItemWholeAuth(telecom));
    }

    private class CallItemWholeAuth implements Callable<Boolean> {
        private int pTelecom;

        public CallItemWholeAuth(int telecom) {
            this.pTelecom = 0;
            this.pTelecom = telecom;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (!IAPBase.this.connect(this.pTelecom, null, null)) {
                return false;
            }
            IAPBase.this.itemWholeAuthConfirm = IAPNet.iapSendItemWholeAuth();
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM;
            if (!IAPBase.this.resultProc(IAPBase.this.itemWholeAuthConfirm)) {
                if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_WHOLEQUERY, IAPBase.this.errMsg);
                } else {
                    IAPBase.this.subErrorCode = 0;
                    IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                }
                return false;
            }
            IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM_OK;
            IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_WHOLEQUERY_FINISH, null);
            return true;
        }
    }

    public void ItemUse(int telecom, String PID) {
        this.mExecutorService.submit(new CallItemItemUse(telecom, PID));
    }

    private class CallItemItemUse implements Callable<Boolean> {
        private String pID;
        private int pTelecom;

        public CallItemItemUse(int telecom, String productID) {
            this.pID = null;
            this.pTelecom = 0;
            this.pTelecom = telecom;
            this.pID = productID;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID != null && IAPBase.this.connect(this.pTelecom, null, null)) {
                IAPBase.this.itemUseConfirm = IAPNet.iapSendItemUse(this.pID);
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM;
                CommonF.LOGGER.m2i(IAPBase.TAG, "CallItemItemUse Function ");
                if (!IAPBase.this.resultProc(IAPBase.this.itemUseConfirm)) {
                    if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_USEQUERY, IAPBase.this.errMsg);
                    } else {
                        IAPBase.this.subErrorCode = 0;
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                    }
                    return false;
                }
                IAPBase.this.mNetworkState = NETWORK_RESULT_TYPE.APP_CHARGE_ITEM_OK;
                IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_ITEMUSE_FINISH, null);
                return true;
            }
            return false;
        }
    }

    public void ItemAuth(int telecom, String pID) {
        this.mExecutorService.submit(new CallItemAuth(telecom, pID));
    }

    private class CallItemAuth implements Callable<Boolean> {
        private String pID;
        private int pTelecom;

        public CallItemAuth(int telecom, String productID) {
            this.pID = null;
            this.pTelecom = 0;
            this.pTelecom = telecom;
            this.pID = productID;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.concurrent.Callable
        public Boolean call() throws Exception {
            if (this.pID != null && IAPBase.this.connect(this.pTelecom, this.pID, null)) {
                IAPBase.this.SendMessageToNetwork(Defines.ACTION_EVENT.HND_ITEMAUTH_FINISH, null);
                return true;
            }
            return false;
        }
    }

    public byte[] sendBPData(byte[] data, int telecom) {
        byte[] returnData = (byte[]) null;
        Future<byte[]> service = this.mExecutorService.submit(new CallSendBPData(data, telecom));
        try {
            return service.get();
        } catch (InterruptedException e) {
            SendMessageToNetwork(IAPLib.HND_ERR_DATA, null);
            e.printStackTrace();
            return returnData;
        } catch (ExecutionException e2) {
            SendMessageToNetwork(IAPLib.HND_ERR_DATA, null);
            e2.printStackTrace();
            return returnData;
        }
    }

    private class CallSendBPData implements Callable<byte[]> {
        private byte[] mData;
        private int mTelecom;

        public CallSendBPData(byte[] data, int telecom) {
            this.mData = null;
            this.mTelecom = 0;
            this.mData = data;
            this.mTelecom = telecom;
        }

        @Override // java.util.concurrent.Callable
        public byte[] call() throws Exception {
            InitConfirm init;
            byte[] returnData;
            ConnectivityManager connectivityManager = (ConnectivityManager) IAPBase.this.mContext.getSystemService("connectivity");
            NetworkInfo mobile = connectivityManager.getNetworkInfo(0);
            NetworkInfo wifi = connectivityManager.getNetworkInfo(1);
            if (wifi.isConnected()) {
                IAPBase.this.isWifi = true;
            } else if (mobile.isConnected()) {
                IAPBase.this.isWifi = false;
            } else {
                IAPBase.this.subErrorCode = -1;
                IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_AUTH, CommonString.ERROR_INTERNET_ACCESS_STRING);
                return null;
            }
            CommonF.LOGGER.m2i(IAPBase.TAG, "CallSendBPData Start!!  WifiEnable = " + IAPBase.this.isWifi);
            if (IAPBase.this.isWifi) {
                IAPNet.setWifi(true);
                init = IAPNet.iapConnect(new ServerInfo(Defines.IAP_GW_IP, Defines.IAP_WIFI_PORT), this.mTelecom, IAPBase.this.APPLICATION_ID, IAPBase.this.MDN, IAPBase.this.BP_SERVER_IP, IAPBase.this.BP_SERVER_PORT, null, null, null, true);
            } else {
                IAPNet.setWifi(false);
                init = IAPNet.iapConnectBP(new ServerInfo(Defines.IAP_GW_IP, Defines.IAP_BPDATA_PORT), this.mTelecom, IAPBase.this.APPLICATION_ID, IAPBase.this.MDN, IAPBase.this.BP_SERVER_IP, IAPBase.this.BP_SERVER_PORT);
            }
            if (init == null) {
                return null;
            }
            if (!IAPBase.this.isWifi) {
                if (!IAPBase.this.resultProc(init)) {
                    if (IAPBase.this.subErrorCode != -11 && IAPBase.this.subErrorCode != -12 && IAPBase.this.subErrorCode != -13) {
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_AUTH, IAPBase.this.errMsg);
                    } else {
                        IAPBase.this.subErrorCode = 0;
                        IAPBase.this.SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
                    }
                    return null;
                }
                returnData = IAPNet.iapSendDataBP(this.mData);
                IAPNet.iapCloseBP(true);
            } else {
                returnData = IAPNet.iapSendData(this.mData);
            }
            return returnData;
        }
    }

    boolean connect(int pTelecom, String pID, String pTID) {
        ConnectivityManager connectivityManager = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        NetworkInfo mobile = connectivityManager.getNetworkInfo(0);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(1);
        if (wifi.isConnected()) {
            this.isWifi = true;
        } else if (mobile.isConnected()) {
            this.isWifi = false;
        } else {
            if (pID == null) {
                this.subErrorCode = -1;
                SendMessageToNetwork(IAPLib.HND_ERR_AUTH, CommonString.ERROR_INTERNET_ACCESS_STRING);
            } else {
                SendMessageToNetwork(IAPLib.HND_ERR_ITEMAUTH, null);
            }
            return false;
        }
        CommonF.LOGGER.m2i(TAG, "(IAPBase) IAPNet Wifi = " + this.isWifi + "  /  Connect= " + IAPNet.isConnect());
        if (!IAPNet.isConnect()) {
            CommonF.LOGGER.m2i(TAG, "G/W Connect and Success !!! ");
            if (this.isWifi) {
                IAPNet.setWifi(true);
                this.initCfm = IAPNet.iapConnect(new ServerInfo(Defines.IAP_GW_IP, Defines.IAP_WIFI_PORT), pTelecom, this.APPLICATION_ID, this.MDN, this.BP_SERVER_IP, this.BP_SERVER_PORT, pID, pTID, this.mEncJuminNumer, false);
            } else {
                IAPNet.setWifi(false);
                this.initCfm = IAPNet.iapConnect(new ServerInfo(Defines.IAP_GW_IP, Defines.IAP_GW_PORT), pTelecom, this.APPLICATION_ID, this.MDN, this.BP_SERVER_IP, this.BP_SERVER_PORT, pID, pTID, this.mEncJuminNumer, false);
            }
        } else {
            CommonF.LOGGER.m2i(TAG, "G/W Re Connect + Auth");
            this.initCfm = IAPNet.iapReAuth(pTelecom, this.APPLICATION_ID, this.mEncJuminNumer, this.MDN, this.BP_SERVER_IP, this.BP_SERVER_PORT, pID, pTID);
        }
        if (this.initCfm == null) {
            return false;
        }
        if (!resultProc(this.initCfm)) {
            if (this.subErrorCode == -11 || this.subErrorCode == -12 || this.subErrorCode == -13) {
                this.subErrorCode = 0;
                SendMessageToNetwork(IAPLib.HND_ERR_NORMALTIMEOUT, CommonString.ERROR_NETWORK_CONNECT_CHECK_STRING);
            } else if (pID == null) {
                SendMessageToNetwork(IAPLib.HND_ERR_AUTH, this.errMsg);
            } else {
                SendMessageToNetwork(IAPLib.HND_ERR_ITEMAUTH, this.errMsg);
            }
            return false;
        }
        return true;
    }
}
