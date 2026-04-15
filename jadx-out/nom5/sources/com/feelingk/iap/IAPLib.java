package com.feelingk.iap;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import com.feelingk.iap.net.IAPBase;
import com.feelingk.iap.net.InitConfirm;
import com.feelingk.iap.net.ItemAuth;
import com.feelingk.iap.net.ItemAuthInfo;
import com.feelingk.iap.net.ItemUse;
import com.feelingk.iap.net.ItemUseConfirm;
import com.feelingk.iap.net.ItemWholeAuthConfirm;
import com.feelingk.iap.util.CommonF;
import com.feelingk.iap.util.CommonString;
import com.feelingk.iap.util.Defines;

/* JADX INFO: loaded from: classes.dex */
public final class IAPLib {
    public static final int HND_ERR_AUTH = 2000;
    public static final int HND_ERR_DATA = 2005;
    public static final int HND_ERR_INIT = 1999;
    public static final int HND_ERR_ITEMAUTH = 2007;
    public static final int HND_ERR_ITEMINFO = 2001;
    public static final int HND_ERR_ITEMPURCHASE = 2003;
    public static final int HND_ERR_ITEMQUERY = 2002;
    public static final int HND_ERR_NORMALTIMEOUT = 2008;
    public static final int HND_ERR_PAYMENTTIMEOUT = 2009;
    public static final int HND_ERR_SERVERTIMEOUT = 2010;
    public static final int HND_ERR_USEQUERY = 2006;
    public static final int HND_ERR_WHOLEQUERY = 2004;
    static final String TAG = "IAPLib";
    private static Handler mHndUI = null;
    private static Context mContext = null;
    protected static IAPBase mBase = null;
    protected static OnClientListener mClientListener = null;
    protected static String mProductID = null;
    protected static String mProductName = null;
    protected static String mTID = null;
    protected static String mBPInfo = null;
    protected static Boolean mUseTCash = false;
    protected static Boolean mUseBPProtol = false;
    protected static String mMdn = null;
    protected static int mKorTelecom = 0;
    protected static String mEncJuminNumber = null;
    private static int mDialogType = 100;
    protected static final Handler mNetworkMessageHandler = new Handler() { // from class: com.feelingk.iap.IAPLib.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            CommonF.LOGGER.m2i(IAPLib.TAG, "[NET-Handler] Network Message Receive Msg.what = " + msg.what);
            switch (msg.what) {
                case Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM /* 1100 */:
                    IAPLib.mUseTCash = Boolean.valueOf(msg.arg1 == 1);
                    IAPLib.mUseBPProtol = Boolean.valueOf(msg.arg2 == 1);
                    IAPLib.sendItemQuery();
                    break;
                case Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM_DANAL /* 1101 */:
                    IAPLib.sendItemQuery();
                    break;
                case Defines.ACTION_EVENT.HND_PURCHASE_CANCEL /* 1102 */:
                    IAPLib.close();
                    break;
                case Defines.ACTION_EVENT.HND_PURCHASE_FINISH_OK /* 1103 */:
                    if (IAPLib.mClientListener != null) {
                        IAPLib.mClientListener.onItemPurchaseComplete();
                    }
                    break;
                case Defines.ACTION_EVENT.HND_ITEMINFO_FINISH /* 1104 */:
                    IAPLib.close();
                    if (IAPLib.mHndUI != null) {
                        Message msgUI = IAPLib.mHndUI.obtainMessage(Defines.ACTION_EVENT.HND_ITEMINFO_FINISH, msg.obj);
                        msgUI.sendToTarget();
                    }
                    break;
                case Defines.ACTION_EVENT.HND_ITEMQUERY_FINISH /* 1105 */:
                    if (IAPLib.mClientListener != null) {
                        if (!IAPLib.mClientListener.onItemQueryComplete().booleanValue()) {
                            if (IAPLib.mHndUI != null) {
                                Message messageUI = IAPLib.mHndUI.obtainMessage(IAPLib.HND_ERR_ITEMPURCHASE, CommonString.ERROR_PURCHASE_STRING);
                                messageUI.sendToTarget();
                            }
                        } else if (IAPLib.mKorTelecom == 1) {
                            IAPLib.sendItemPurchse(IAPLib.mUseTCash);
                        } else {
                            IAPLib.sendItemPurchseByDanal(IAPLib.mMdn, IAPLib.mKorTelecom, IAPLib.mUseTCash, IAPLib.mEncJuminNumber);
                        }
                    }
                    break;
                case Defines.ACTION_EVENT.HND_PURCHASE_FINISH /* 1106 */:
                    IAPLib.close();
                    if (IAPLib.mHndUI != null && msg.obj != null) {
                        Message msgUI2 = IAPLib.mHndUI.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_FINISH, msg.obj);
                        msgUI2.sendToTarget();
                        break;
                    }
                    break;
                case Defines.ACTION_EVENT.HND_WHOLEQUERY_FINISH /* 1107 */:
                    IAPLib.close();
                    ItemWholeAuthConfirm whole = IAPLib.mBase.getItemWholeAuthConfirmMessage();
                    if (IAPLib.mClientListener != null) {
                        IAPLib.mClientListener.onWholeQuery(whole.getItems());
                    }
                    break;
                case Defines.ACTION_EVENT.HND_ITEMUSE_FINISH /* 1108 */:
                    IAPLib.close();
                    ItemUseConfirm itemUse = IAPLib.mBase.getItemUseConfirmMessage();
                    ItemUse item = new ItemUse();
                    item.pId = itemUse.getItemID();
                    item.pName = itemUse.getItemName();
                    item.pCount = itemUse.getCount();
                    if (IAPLib.mClientListener != null) {
                        IAPLib.mClientListener.onItemUseQuery(item);
                    }
                    break;
                case Defines.ACTION_EVENT.HND_ITEMAUTH_FINISH /* 1109 */:
                    IAPLib.close();
                    InitConfirm init = IAPLib.mBase.getInitConfirmMessage();
                    ItemAuthInfo item2 = new ItemAuthInfo();
                    item2.pCount = init.getCount();
                    item2.pExpireDate = init.getExpireDate();
                    item2.pToken = init.getToken();
                    if (IAPLib.mClientListener != null) {
                        IAPLib.mClientListener.onItemAuthInfo(item2);
                    }
                    break;
                case Defines.ACTION_EVENT.HND_AUTH_JUMINNUMBER /* 1110 */:
                    IAPLib.mEncJuminNumber = msg.obj.toString();
                    IAPLib.mBase.setBaseEncodeJuminNumber(IAPLib.mEncJuminNumber);
                    break;
                default:
                    IAPLib.close();
                    if (msg.obj == null) {
                        msg.obj = CommonString.ERROR_NONE_PARAMETER_STRING;
                    }
                    if (msg.what == 2003 && msg.arg1 == 15) {
                        IAPLib.updateEncJuminNumber(null);
                    }
                    if (IAPLib.mHndUI != null) {
                        Message msgUI3 = IAPLib.mHndUI.obtainMessage(msg.what, msg.obj);
                        IAPLib.mHndUI.sendMessage(msgUI3);
                    }
                    if (IAPLib.mClientListener != null) {
                        IAPLib.mClientListener.onError(msg.what, msg.arg1);
                    }
                    break;
            }
        }
    };

    public interface OnClientListener {
        void onDlgError();

        void onDlgPurchaseCancel();

        void onError(int i, int i2);

        void onItemAuthInfo(ItemAuthInfo itemAuthInfo);

        void onItemPurchaseComplete();

        Boolean onItemQueryComplete();

        void onItemUseQuery(ItemUse itemUse);

        void onJuminNumberDlgCancel();

        void onWholeQuery(ItemAuth[] itemAuthArr);
    }

    protected static void init(Context ctx, Handler hnd, IAPLibSetting setting, String mdn, int telecomCarrier) {
        mContext = ctx;
        mHndUI = hnd;
        mMdn = mdn;
        mKorTelecom = telecomCarrier;
        mUseBPProtol = false;
        mClientListener = setting.ClientListener;
        mBase = new IAPBase(mContext, mNetworkMessageHandler, setting, mdn);
    }

    protected static void sendItemInfo(String pID, String pName) {
        sendItemInfo(pID, pName, null, null);
    }

    protected static void sendItemInfo(String pID, String pName, String pTid) {
        sendItemInfo(pID, pName, pTid, null);
    }

    protected static void sendItemInfo(String pID, String pName, String pTid, String pBPInfo) {
        mProductID = pID;
        mProductName = pName;
        mTID = pTid;
        mBPInfo = pBPInfo;
        mBase.Reset();
        mBase.ItemInfo(mKorTelecom, pID, pName, pTid, pBPInfo);
    }

    protected static void sendItemQuery() {
        mBase.Reset();
        mBase.ItemQuery(mKorTelecom, mProductID, mProductName, mTID, mBPInfo);
    }

    protected static void sendItemPurchse(Boolean bTCash) {
        mBase.Reset();
        mBase.ItemPurchase(mProductID, mProductName, mTID, mBPInfo, bTCash, mUseBPProtol);
    }

    protected static void sendItemPurchseByDanal(String mdn, int carrier, Boolean bTCash, String jumin) {
        mBase.Reset();
        mBase.ItemPurchaseDanal(mdn, mProductID, mProductName, carrier, mTID, mBPInfo, bTCash, jumin);
    }

    protected static void sendItemWholeAuth() {
        mBase.Reset();
        mBase.ItemWholeAuth(mKorTelecom);
    }

    protected static void sendItemAuth(String pID) {
        mBase.Reset();
        mBase.ItemAuth(mKorTelecom, pID);
    }

    protected static void sendItemUse(String pID) {
        mBase.Reset();
        mBase.ItemUse(mKorTelecom, pID);
    }

    protected static byte[] sendBPData(byte[] data) {
        mBase.Reset();
        return mBase.sendBPData(data, mKorTelecom);
    }

    protected static int getDialogType() {
        return mDialogType;
    }

    protected static void setDialogType(int mDialogType2) {
        mDialogType = mDialogType2;
    }

    protected static Handler getNetHandler() {
        return mNetworkMessageHandler;
    }

    protected static Handler getUIHandler() {
        return mHndUI;
    }

    protected static void setUIHandler(Handler handler) {
        mHndUI = handler;
    }

    protected static void close() {
        mBase.StopService();
        IAPBase.close();
    }

    public static String getEncJuminNumber() {
        return mEncJuminNumber;
    }

    public static void updateEncJuminNumber(String number) {
        mEncJuminNumber = number;
        mBase.setBaseEncodeJuminNumber(number);
    }
}
