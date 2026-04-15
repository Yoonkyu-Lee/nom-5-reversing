package com.feelingk.iap;

import android.R;
import android.app.Activity;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.telephony.PhoneStateListener;
import android.telephony.ServiceState;
import android.telephony.TelephonyManager;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import com.feelingk.iap.IAPLib;
import com.feelingk.iap.encryption.CryptoManager;
import com.feelingk.iap.gui.data.PurchaseItem;
import com.feelingk.iap.gui.parser.ParserXML;
import com.feelingk.iap.gui.view.PopJuminNumberAuth;
import com.feelingk.iap.gui.view.PopupDialog;
import com.feelingk.iap.gui.view.ProgressDialog;
import com.feelingk.iap.gui.view.PurchaseDialog;
import com.feelingk.iap.net.ItemInfoConfirm;
import com.feelingk.iap.net.MsgConfirm;
import com.feelingk.iap.util.CommonF;
import com.feelingk.iap.util.CommonString;
import com.feelingk.iap.util.Defines;
import com.gamevil.nexus2.net.NexusConstants;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class IAPActivity extends Activity {
    static final String TAG = "IAPActivity";
    private IAPLibSetting mSetting = null;
    private String mPurchaseName = null;
    private String mMsgItemInfo = null;
    private TelephonyManager m_telephonyManager = null;
    private int m_phoneUSIMState = 0;
    private String mErrorMessage = null;
    private String m_Tid = null;
    private Boolean mSetBPProtocol = false;
    private Boolean mSetTmpBPProtocol = false;
    private PurchaseDialog mPurchaseDlg = null;
    private PopupDialog mPopupDlg = null;
    private ProgressDialog mProgressDlg = null;
    private PopJuminNumberAuth mJuminAuth = null;
    private boolean mUseTCash = false;
    private int mRotaion = -1;
    private boolean mTabDevice = false;
    private int mCurTelecom = 0;
    private ItemInfoConfirm mItemInfoConfirm = null;
    private int mPurchaseItemWorkFlow = 0;
    private String mPurchaseID = null;
    private String mPurchaseBPInfo = null;
    private final Handler mGUIMessageHandler = new Handler() { // from class: com.feelingk.iap.IAPActivity.1
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int dlgType = IAPLib.getDialogType();
            CommonF.LOGGER.m2i(IAPActivity.TAG, "[GUI-Handler] mGUIMessageHandler msg.what= " + msg.what);
            switch (msg.what) {
                case Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM /* 1100 */:
                    if (dlgType == 103) {
                        IAPActivity.this.DismissPurchaseDialog();
                        IAPActivity.this.ShowLoadingProgress();
                        IAPLib.setDialogType(104);
                    }
                    break;
                case Defines.ACTION_EVENT.HND_ITEMINFO_FINISH /* 1104 */:
                    if (dlgType == 102) {
                        IAPActivity.this.DismissLoaingProgress();
                        IAPActivity.this.ShowPurchaseDialog(msg.obj);
                        IAPLib.setDialogType(103);
                    }
                    break;
                case Defines.ACTION_EVENT.HND_PURCHASE_FINISH /* 1106 */:
                    if (dlgType == 104) {
                        IAPActivity.this.DismissLoaingProgress();
                        MsgConfirm confirm = (MsgConfirm) msg.obj;
                        try {
                            IAPActivity.this.mMsgItemInfo = new String(confirm.getMsg(), "MS949");
                            IAPActivity iAPActivity = IAPActivity.this;
                            iAPActivity.mMsgItemInfo = String.valueOf(iAPActivity.mMsgItemInfo) + "\n";
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                        IAPLib.setDialogType(105);
                        IAPActivity.this.ShowInfoMessageDialog(105, IAPActivity.this.mMsgItemInfo);
                    }
                    break;
                default:
                    CommonF.LOGGER.m2i(IAPActivity.TAG, "[GUI Handler] OnError " + msg.what);
                    if (dlgType != 100) {
                        IAPLib.setDialogType(100);
                        IAPActivity.this.DismissLoaingProgress();
                        IAPActivity.this.DismissPurchaseDialog();
                    }
                    if (msg.what < 2004 || msg.what > 2007) {
                        IAPActivity.this.mErrorMessage = msg.obj.toString();
                        IAPLib.setDialogType(101);
                        IAPActivity.this.ShowInfoMessageDialog(101, IAPActivity.this.mErrorMessage);
                    }
                    break;
            }
        }
    };
    public ParserXML.ParserAuthResultCallback onJuminDialogPopupCallback = new ParserXML.ParserAuthResultCallback() { // from class: com.feelingk.iap.IAPActivity.2
        @Override // com.feelingk.iap.gui.parser.ParserXML.ParserAuthResultCallback
        public void onAuthDialogOKButtonClick(String juminText1, String juminText2) {
            String tmpJuminNumber;
            String JuminNumber = String.valueOf(juminText1) + juminText2;
            try {
                tmpJuminNumber = CryptoManager.encrypt(JuminNumber);
            } catch (Exception e) {
                tmpJuminNumber = null;
                e.printStackTrace();
            }
            if (tmpJuminNumber != null) {
                Handler hnd = IAPLib.getNetHandler();
                Message msgNET = hnd.obtainMessage(Defines.ACTION_EVENT.HND_AUTH_JUMINNUMBER, 0, 0, tmpJuminNumber);
                msgNET.sendToTarget();
            }
            IAPLib.setDialogType(100);
            IAPActivity.this.DismissJuminAuthDialog();
            if (tmpJuminNumber != null) {
                new Handler().postDelayed(new Runnable() { // from class: com.feelingk.iap.IAPActivity.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        CommonF.LOGGER.m0e(IAPActivity.TAG, " # Auto Runnale Mode = " + IAPActivity.this.mPurchaseItemWorkFlow);
                        if (IAPActivity.this.mPurchaseItemWorkFlow == 1) {
                            IAPActivity.this.popPurchaseDlg(IAPActivity.this.mPurchaseID, IAPActivity.this.mPurchaseName);
                        } else if (IAPActivity.this.mPurchaseItemWorkFlow != 2) {
                            if (IAPActivity.this.mPurchaseItemWorkFlow != 4) {
                                if (IAPActivity.this.mPurchaseItemWorkFlow != 5) {
                                    if (IAPActivity.this.mPurchaseItemWorkFlow == 3) {
                                        IAPActivity.this.sendItemWholeAuth();
                                    } else {
                                        CommonF.LOGGER.m0e(IAPActivity.TAG, "# Auto Runnable Purchase Fail ");
                                    }
                                } else {
                                    IAPActivity.this.sendItemUse(IAPActivity.this.mPurchaseID);
                                }
                            } else {
                                IAPActivity.this.sendItemAuth(IAPActivity.this.mPurchaseID);
                            }
                        } else {
                            IAPActivity.this.popPurchaseDlg(IAPActivity.this.mPurchaseID, IAPActivity.this.mPurchaseName, IAPActivity.this.m_Tid, IAPActivity.this.mPurchaseBPInfo);
                        }
                        IAPActivity.this.mPurchaseItemWorkFlow = 0;
                    }
                }, 300L);
            }
        }

        @Override // com.feelingk.iap.gui.parser.ParserXML.ParserAuthResultCallback
        public void onAuthDialogCancelButtonClick() {
            IAPLib.setDialogType(100);
            IAPActivity.this.DismissJuminAuthDialog();
            IAPActivity.this.mPurchaseItemWorkFlow = 0;
            IAPLib.OnClientListener onAppCallbackFn = IAPActivity.this.mSetting.ClientListener;
            onAppCallbackFn.onJuminNumberDlgCancel();
        }
    };
    public ParserXML.ParserResultCallback onPurchasePopupCallback = new ParserXML.ParserResultCallback() { // from class: com.feelingk.iap.IAPActivity.3
        @Override // com.feelingk.iap.gui.parser.ParserXML.ParserResultCallback
        public void onUseTCashCheckChanged(boolean isChecked) {
            IAPActivity.this.mUseTCash = isChecked;
            if (!isChecked && IAPActivity.this.mSetBPProtocol.booleanValue()) {
                IAPActivity.this.mSetTmpBPProtocol = true;
            } else {
                IAPActivity.this.mSetTmpBPProtocol = false;
            }
            CommonF.LOGGER.m2i(IAPActivity.TAG, "PopupCheck!!  UseTCash =" + isChecked + " / BPProtocol = " + IAPActivity.this.mSetTmpBPProtocol);
        }

        @Override // com.feelingk.iap.gui.parser.ParserXML.ParserResultCallback
        public void onPurchaseCancelButtonClick() {
            Handler hnd = IAPLib.getNetHandler();
            Message msg = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CANCEL);
            msg.sendToTarget();
            IAPActivity.this.DismissPurchaseDialog();
            IAPLib.setDialogType(100);
            IAPActivity iAPActivity = IAPActivity.this;
            IAPActivity.this.mSetBPProtocol = false;
            iAPActivity.mSetTmpBPProtocol = false;
            IAPActivity.this.mUseTCash = false;
            IAPLib.OnClientListener onAppCallbackFn = IAPActivity.this.mSetting.ClientListener;
            onAppCallbackFn.onDlgPurchaseCancel();
        }

        @Override // com.feelingk.iap.gui.parser.ParserXML.ParserResultCallback
        public void onPurchaseButtonClick() {
            Message msgUI = IAPActivity.this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM);
            IAPActivity.this.mGUIMessageHandler.sendMessage(msgUI);
            if (IAPActivity.this.mCurTelecom == 1) {
                Handler hnd = IAPLib.getNetHandler();
                CommonF.LOGGER.m2i(IAPActivity.TAG, "# Purchase SK!!  mUseTCash =" + IAPActivity.this.mUseTCash + " / BPProtocol = " + IAPActivity.this.mSetTmpBPProtocol);
                Message msgNET = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM, IAPActivity.this.mUseTCash ? 1 : 0, IAPActivity.this.mSetTmpBPProtocol.booleanValue() ? 1 : 0);
                msgNET.sendToTarget();
                return;
            }
            Handler hnd2 = IAPLib.getNetHandler();
            CommonF.LOGGER.m2i(IAPActivity.TAG, "# Purchase KT_LG!!  ");
            Message msgNET2 = hnd2.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CONFIRM_DANAL);
            msgNET2.sendToTarget();
        }
    };
    DialogInterface.OnCancelListener onProgressCancelListerner = new DialogInterface.OnCancelListener() { // from class: com.feelingk.iap.IAPActivity.4
        @Override // android.content.DialogInterface.OnCancelListener
        public void onCancel(DialogInterface dialog) {
            Handler hnd = IAPLib.getNetHandler();
            Message msg = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CANCEL);
            msg.sendToTarget();
            IAPActivity.this.DismissLoaingProgress();
            IAPLib.setDialogType(100);
            IAPActivity.this.mUseTCash = false;
            IAPActivity iAPActivity = IAPActivity.this;
            IAPActivity.this.mSetBPProtocol = false;
            iAPActivity.mSetTmpBPProtocol = false;
            IAPLib.OnClientListener onAppCallbackFn = IAPActivity.this.mSetting.ClientListener;
            onAppCallbackFn.onDlgPurchaseCancel();
        }
    };
    View.OnClickListener onInfoCancelListener = new View.OnClickListener() { // from class: com.feelingk.iap.IAPActivity.5
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            Handler hnd = IAPLib.getNetHandler();
            Message msg = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CANCEL);
            msg.sendToTarget();
            IAPActivity.this.DismissInfoMessageDialog();
            IAPLib.setDialogType(100);
            IAPActivity iAPActivity = IAPActivity.this;
            IAPActivity.this.mSetBPProtocol = false;
            iAPActivity.mSetTmpBPProtocol = false;
            IAPActivity.this.mUseTCash = false;
            IAPLib.OnClientListener onAppCallbackFn = IAPActivity.this.mSetting.ClientListener;
            onAppCallbackFn.onDlgError();
        }
    };
    View.OnClickListener onConfirmInfoListener = new View.OnClickListener() { // from class: com.feelingk.iap.IAPActivity.6
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            Handler hnd = IAPLib.getNetHandler();
            Message msg = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_FINISH_OK);
            msg.sendToTarget();
            IAPActivity iAPActivity = IAPActivity.this;
            IAPActivity.this.mSetBPProtocol = false;
            iAPActivity.mSetTmpBPProtocol = false;
            IAPActivity.this.mUseTCash = false;
            IAPActivity.this.DismissInfoMessageDialog();
            IAPLib.setDialogType(100);
        }
    };

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        CommonF.LOGGER.m2i(TAG, "IAPActivity onCreate ");
        IAPLibDeviceCheck();
        this.m_telephonyManager = (TelephonyManager) getSystemService("phone");
        this.m_phoneUSIMState = 0;
        this.mCurTelecom = CommonF.getCarrier(this);
        WindowManager.LayoutParams params = getWindow().getAttributes();
        if ((params.flags & NexusConstants.BUFFER_SIZE) > 0) {
            this.mPurchaseDlg = new PurchaseDialog(this, R.style.Theme.Translucent.NoTitleBar.Fullscreen, this.onPurchasePopupCallback, this.mCurTelecom, this.mTabDevice);
            this.mJuminAuth = new PopJuminNumberAuth(this, R.style.Theme.Translucent.NoTitleBar.Fullscreen, this.onJuminDialogPopupCallback, this.mTabDevice);
            this.mPopupDlg = new PopupDialog(this, R.style.Theme.Translucent.NoTitleBar.Fullscreen, this.mTabDevice);
        } else {
            this.mPurchaseDlg = new PurchaseDialog(this, R.style.Theme.Translucent.NoTitleBar, this.onPurchasePopupCallback, this.mCurTelecom, this.mTabDevice);
            this.mJuminAuth = new PopJuminNumberAuth(this, R.style.Theme.Translucent.NoTitleBar, this.onJuminDialogPopupCallback, this.mTabDevice);
            this.mPopupDlg = new PopupDialog(this, R.style.Theme.Translucent.NoTitleBar, this.mTabDevice);
        }
        RestoreData();
    }

    @Override // android.app.Activity
    protected void onResume() {
        String encJumin;
        super.onResume();
        IAPLibDeviceCheck();
        IAPLibUSIMStateCheck();
        int nDlgType = IAPLib.getDialogType();
        CommonF.LOGGER.m2i(TAG, "IAPActivity onResume [" + nDlgType + "]");
        IAPLib.setUIHandler(this.mGUIMessageHandler);
        if (this.mCurTelecom != 1 && (encJumin = IAPLib.getEncJuminNumber()) != null) {
            IAPLib.updateEncJuminNumber(encJumin);
        }
        if (nDlgType == 103) {
            ShowPurchaseDialog(this.mItemInfoConfirm);
            return;
        }
        if (nDlgType == 105) {
            ShowInfoMessageDialog(nDlgType, this.mMsgItemInfo);
        } else if (nDlgType == 106) {
            ShowJuminAuthDialog();
        } else if (nDlgType == 101) {
            ShowInfoMessageDialog(nDlgType, this.mErrorMessage);
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        int nDlgType = IAPLib.getDialogType();
        CommonF.LOGGER.m0e(TAG, "IAPActivity onPause [" + nDlgType + "]");
        Handler hnd = IAPLib.getNetHandler();
        Message msgNetwork = hnd.obtainMessage(Defines.ACTION_EVENT.HND_PURCHASE_CANCEL);
        msgNetwork.sendToTarget();
        if (nDlgType == 102) {
            DismissLoaingProgress();
            IAPLib.setDialogType(100);
        } else if (nDlgType == 103) {
            DismissPurchaseDialog();
        } else if (nDlgType == 105 || nDlgType == 101) {
            DismissInfoMessageDialog();
        } else if (nDlgType == 106) {
            DismissJuminAuthDialog();
        } else if (nDlgType == 104) {
            DismissLoaingProgress();
            IAPLib.setDialogType(100);
        }
        IAPLib.setUIHandler(null);
    }

    @Override // android.app.Activity
    public Object onRetainNonConfigurationInstance() {
        HashMap<String, Object> dataBackupMap = new HashMap<>();
        dataBackupMap.put("NET_MESSAGE", this.mMsgItemInfo);
        dataBackupMap.put("ERR_MESSAGE", this.mErrorMessage);
        dataBackupMap.put("USE_BPPROTOCOL", this.mSetBPProtocol);
        dataBackupMap.put("PRODUCT_NAME", this.mPurchaseName);
        dataBackupMap.put("PRODUCT_INFO", this.mItemInfoConfirm);
        return dataBackupMap;
    }

    private void RestoreData() {
        Object obj = getLastNonConfigurationInstance();
        if (obj != null) {
            HashMap<String, Object> dataBackupMap = (HashMap) obj;
            this.mMsgItemInfo = (String) dataBackupMap.get("NET_MESSAGE");
            this.mErrorMessage = (String) dataBackupMap.get("ERR_MESSAGE");
            this.mSetBPProtocol = (Boolean) dataBackupMap.get("USE_BPPROTOCOL");
            this.mPurchaseName = (String) dataBackupMap.get("PRODUCT_NAME");
            this.mItemInfoConfirm = (ItemInfoConfirm) dataBackupMap.get("PRODUCT_INFO");
            CommonF.LOGGER.m2i(TAG, "## Restore Data ......");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowLoadingProgress() {
        this.mProgressDlg = new ProgressDialog(this, CommonString.WORK_PROCESSING_STRING, this.onProgressCancelListerner);
        this.mProgressDlg.ShowProgress();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void DismissLoaingProgress() {
        if (this.mProgressDlg != null) {
            this.mProgressDlg.CloseProgress();
            this.mProgressDlg = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowInfoMessageDialog(int state, String info_message) {
        if (state == 105) {
            this.mPopupDlg.InflateView(state, info_message, this.onConfirmInfoListener);
        } else {
            this.mPopupDlg.InflateView(state, info_message, this.onInfoCancelListener);
        }
        this.mPopupDlg.ShowPopupDialog();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void DismissInfoMessageDialog() {
        this.mPopupDlg.ClosePopupDialog();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowPurchaseDialog(Object item) {
        this.mItemInfoConfirm = (ItemInfoConfirm) item;
        int nPrice = Integer.parseInt(this.mItemInfoConfirm.getItemPrice().replace(",", ""));
        int nTCash = Integer.parseInt(this.mItemInfoConfirm.getItemTCash().replace(",", ""));
        IAPLibDeviceCheck();
        PurchaseItem pItemInfo = new PurchaseItem(this.mPurchaseName != null ? this.mPurchaseName : this.mItemInfoConfirm.getItemTitle(), this.mItemInfoConfirm.getItemPeriod(), nPrice, nTCash, nPrice, this.mUseTCash);
        this.mPurchaseDlg.InflateParserDialog(this.mRotaion, pItemInfo);
        this.mPurchaseDlg.ShowPurchaseDialog();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void DismissPurchaseDialog() {
        this.mPurchaseDlg.ClosePurchaseDialog();
    }

    private void ShowJuminAuthDialog() {
        this.mJuminAuth.InflateView();
        this.mJuminAuth.ShowPopupAuthDialog();
        IAPLib.setDialogType(106);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void DismissJuminAuthDialog() {
        this.mJuminAuth.ClosePopupAuthDialog();
    }

    private void IAPLibUSIMStateCheck() {
        PhoneStateListener m_phoneStateListener = new PhoneStateListener() { // from class: com.feelingk.iap.IAPActivity.7
            @Override // android.telephony.PhoneStateListener
            public void onServiceStateChanged(ServiceState serviceState) {
                IAPActivity.this.m_phoneUSIMState = serviceState.getState();
                if (IAPActivity.this.m_telephonyManager != null) {
                    IAPActivity.this.m_telephonyManager.listen(this, 0);
                }
            }
        };
        this.m_telephonyManager.listen(m_phoneStateListener, 1);
    }

    private void IAPLibDeviceCheck() {
        WindowManager wm = (WindowManager) getSystemService("window");
        Display disp = wm.getDefaultDisplay();
        this.mRotaion = disp.getOrientation();
    }

    private boolean IAPLibAuthCheck() {
        if (this.mCurTelecom != 1 && IAPLib.getEncJuminNumber() == null) {
            return true;
        }
        return false;
    }

    public void popPurchaseDlg(String pID) {
        this.mPurchaseName = null;
        this.mSetBPProtocol = true;
        this.mSetTmpBPProtocol = true;
        popPurchaseDlg(pID, null);
    }

    protected void popPurchaseDlg(String pID, String pName) {
        CommonF.LOGGER.m2i(TAG, "##  TStore Library Version = V 11.03.22");
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
            return;
        }
        this.mPurchaseID = pID;
        if (pName == null || pName.contentEquals("")) {
            this.mPurchaseName = null;
        } else {
            this.mPurchaseName = pName;
        }
        String enc = null;
        if (this.mPurchaseName != null) {
            try {
                enc = URLEncoder.encode(this.mPurchaseName, "utf-8");
            } catch (UnsupportedEncodingException e) {
                enc = null;
                e.printStackTrace();
            }
        }
        if (IAPLibAuthCheck()) {
            this.mPurchaseItemWorkFlow = 1;
            ShowJuminAuthDialog();
        } else {
            CommonF.LOGGER.m2i(TAG, "# popPurchaseDlg PID= " + pID + " / UseBPProtocol=" + this.mSetBPProtocol);
            ShowLoadingProgress();
            IAPLib.setDialogType(102);
            IAPLib.sendItemInfo(pID, enc);
        }
    }

    protected void popPurchaseDlg(String pID, String pName, String pTID) {
        popPurchaseDlg(pID, pName, pTID, null);
    }

    protected void popPurchaseDlg(String pID, String pName, String pTID, String pBPInfo) {
        String pEncName = null;
        String pEncBPInfo = null;
        CommonF.LOGGER.m2i(TAG, "##  TStore Library Version = V 11.03.22");
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
            return;
        }
        this.mPurchaseID = pID;
        this.mPurchaseBPInfo = pBPInfo;
        if (pName == null || pName.contentEquals("")) {
            this.mPurchaseName = null;
        } else {
            this.mPurchaseName = pName;
        }
        if (this.mPurchaseName != null) {
            try {
                pEncName = URLEncoder.encode(this.mPurchaseName, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        this.m_Tid = pTID != null ? pTID : CommonF.getTID(this, pID);
        if (pBPInfo != null) {
            try {
                pEncBPInfo = URLEncoder.encode(pBPInfo, "utf-8");
            } catch (UnsupportedEncodingException e2) {
                pEncBPInfo = null;
                e2.printStackTrace();
            }
        }
        if (IAPLibAuthCheck()) {
            this.mPurchaseItemWorkFlow = 2;
            ShowJuminAuthDialog();
        } else {
            CommonF.LOGGER.m2i(TAG, "# popPurchaseDlg TID= " + pTID);
            ShowLoadingProgress();
            IAPLib.setDialogType(102);
            IAPLib.sendItemInfo(pID, pEncName, this.m_Tid, pEncBPInfo);
        }
    }

    protected void sendItemWholeAuth() {
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
        } else if (IAPLibAuthCheck()) {
            this.mPurchaseItemWorkFlow = 3;
            ShowJuminAuthDialog();
        } else {
            CommonF.LOGGER.m2i(TAG, "# sendItemWholeAuth");
            IAPLib.sendItemWholeAuth();
        }
    }

    protected void sendItemUse(String pID) {
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
            return;
        }
        this.mPurchaseID = pID;
        if (IAPLibAuthCheck()) {
            this.mPurchaseItemWorkFlow = 5;
            ShowJuminAuthDialog();
        } else {
            CommonF.LOGGER.m2i(TAG, "# sendItemUse PID=" + pID);
            IAPLib.sendItemUse(pID);
        }
    }

    protected void sendItemAuth(String pID) {
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
            return;
        }
        this.mPurchaseID = pID;
        if (IAPLibAuthCheck()) {
            this.mPurchaseItemWorkFlow = 4;
            ShowJuminAuthDialog();
        } else {
            CommonF.LOGGER.m2i(TAG, "# sendItemAuth PID=" + pID);
            IAPLib.sendItemAuth(pID);
        }
    }

    protected byte[] sendBPData(byte[] data) {
        if (this.m_phoneUSIMState != 0) {
            this.mGUIMessageHandler.obtainMessage(Defines.ACTION_EVENT.HND_USIM_ACTIVATE_ERROR, CommonString.ERROR_USIM_ACTIVATE_STRING).sendToTarget();
            return null;
        }
        if (this.mSetting.BP_IP == null || this.mSetting.BP_Port <= 1) {
            CommonF.LOGGER.m2i(TAG, "sendBPData - BP Server IP is null or invalid Port Number");
            return null;
        }
        CommonF.LOGGER.m2i(TAG, "# sendBPData");
        return IAPLib.sendBPData(data);
    }

    public void IAPLibInit(IAPLibSetting setting) {
        this.mSetting = setting;
        IAPLib.init(this, this.mGUIMessageHandler, this.mSetting, CommonF.getMDN(this, this.mCurTelecom), this.mCurTelecom);
    }
}
