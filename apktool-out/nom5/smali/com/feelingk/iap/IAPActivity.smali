.class public Lcom/feelingk/iap/IAPActivity;
.super Landroid/app/Activity;
.source "IAPActivity.java"


# static fields
.field static final TAG:Ljava/lang/String; = "IAPActivity"


# instance fields
.field private mCurTelecom:I

.field private mErrorMessage:Ljava/lang/String;

.field private final mGUIMessageHandler:Landroid/os/Handler;

.field private mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

.field private mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

.field private mMsgItemInfo:Ljava/lang/String;

.field private mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

.field private mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

.field private mPurchaseBPInfo:Ljava/lang/String;

.field private mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

.field private mPurchaseID:Ljava/lang/String;

.field private mPurchaseItemWorkFlow:I

.field private mPurchaseName:Ljava/lang/String;

.field private mRotaion:I

.field private mSetBPProtocol:Ljava/lang/Boolean;

.field private mSetTmpBPProtocol:Ljava/lang/Boolean;

.field private mSetting:Lcom/feelingk/iap/IAPLibSetting;

.field private mTabDevice:Z

.field private mUseTCash:Z

.field private m_Tid:Ljava/lang/String;

.field private m_phoneUSIMState:I

.field private m_telephonyManager:Landroid/telephony/TelephonyManager;

.field onConfirmInfoListener:Landroid/view/View$OnClickListener;

.field onInfoCancelListener:Landroid/view/View$OnClickListener;

.field public onJuminDialogPopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

.field onProgressCancelListerner:Landroid/content/DialogInterface$OnCancelListener;

.field public onPurchasePopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 51
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    .line 52
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 53
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    .line 55
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->m_telephonyManager:Landroid/telephony/TelephonyManager;

    .line 56
    iput v2, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    .line 57
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->m_Tid:Ljava/lang/String;

    .line 63
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    .line 64
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetTmpBPProtocol:Ljava/lang/Boolean;

    .line 67
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    .line 68
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    .line 69
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    .line 70
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    .line 72
    iput-boolean v2, p0, Lcom/feelingk/iap/IAPActivity;->mUseTCash:Z

    .line 73
    const/4 v0, -0x1

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->mRotaion:I

    .line 76
    iput-boolean v2, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    .line 77
    iput v2, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    .line 79
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    .line 81
    iput v2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 83
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    .line 84
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseBPInfo:Ljava/lang/String;

    .line 302
    new-instance v0, Lcom/feelingk/iap/IAPActivity$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$1;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    .line 405
    new-instance v0, Lcom/feelingk/iap/IAPActivity$2;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$2;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->onJuminDialogPopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 480
    new-instance v0, Lcom/feelingk/iap/IAPActivity$3;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$3;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->onPurchasePopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 549
    new-instance v0, Lcom/feelingk/iap/IAPActivity$4;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$4;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->onProgressCancelListerner:Landroid/content/DialogInterface$OnCancelListener;

    .line 569
    new-instance v0, Lcom/feelingk/iap/IAPActivity$5;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$5;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->onInfoCancelListener:Landroid/view/View$OnClickListener;

    .line 586
    new-instance v0, Lcom/feelingk/iap/IAPActivity$6;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$6;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->onConfirmInfoListener:Landroid/view/View$OnClickListener;

    .line 48
    return-void
.end method

.method private DismissInfoMessageDialog()V
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PopupDialog;->ClosePopupDialog()V

    .line 263
    return-void
.end method

.method private DismissJuminAuthDialog()V
    .locals 1

    .prologue
    .line 296
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->ClosePopupAuthDialog()V

    .line 298
    return-void
.end method

.method private DismissLoaingProgress()V
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/ProgressDialog;->CloseProgress()V

    .line 248
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    .line 250
    :cond_0
    return-void
.end method

.method private DismissPurchaseDialog()V
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->ClosePurchaseDialog()V

    .line 286
    return-void
.end method

.method private IAPLibAuthCheck()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 636
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    if-ne v0, v2, :cond_0

    move v0, v1

    .line 648
    :goto_0
    return v0

    .line 644
    :cond_0
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getEncJuminNumber()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    move v0, v1

    .line 645
    goto :goto_0

    :cond_1
    move v0, v2

    .line 648
    goto :goto_0
.end method

.method private IAPLibDeviceCheck()V
    .locals 3

    .prologue
    .line 621
    const-string v2, "window"

    invoke-virtual {p0, v2}, Lcom/feelingk/iap/IAPActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 622
    .local v1, "wm":Landroid/view/WindowManager;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 623
    .local v0, "disp":Landroid/view/Display;
    invoke-virtual {v0}, Landroid/view/Display;->getOrientation()I

    move-result v2

    iput v2, p0, Lcom/feelingk/iap/IAPActivity;->mRotaion:I

    .line 633
    return-void
.end method

.method private IAPLibUSIMStateCheck()V
    .locals 3

    .prologue
    .line 606
    new-instance v0, Lcom/feelingk/iap/IAPActivity$7;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/IAPActivity$7;-><init>(Lcom/feelingk/iap/IAPActivity;)V

    .line 615
    .local v0, "m_phoneStateListener":Landroid/telephony/PhoneStateListener;
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->m_telephonyManager:Landroid/telephony/TelephonyManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 617
    return-void
.end method

.method private RestoreData()V
    .locals 5

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/feelingk/iap/IAPActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v2

    .line 225
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 226
    move-object v0, v2

    check-cast v0, Ljava/util/HashMap;

    move-object v1, v0

    .line 228
    .local v1, "dataBackupMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "NET_MESSAGE"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    .line 229
    const-string v3, "ERR_MESSAGE"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    .line 230
    const-string v3, "USE_BPPROTOCOL"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    .line 232
    const-string v3, "PRODUCT_NAME"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 233
    const-string v3, "PRODUCT_INFO"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/feelingk/iap/net/ItemInfoConfirm;

    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    .line 235
    const-string v3, "IAPActivity"

    const-string v4, "## Restore Data ......"

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .end local v1    # "dataBackupMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method private ShowInfoMessageDialog(ILjava/lang/String;)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "info_message"    # Ljava/lang/String;

    .prologue
    .line 252
    const/16 v0, 0x69

    if-ne p1, v0, :cond_0

    .line 253
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->onConfirmInfoListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, p1, p2, v1}, Lcom/feelingk/iap/gui/view/PopupDialog;->InflateView(ILjava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 259
    :goto_0
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PopupDialog;->ShowPopupDialog()V

    .line 260
    return-void

    .line 256
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->onInfoCancelListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, p1, p2, v1}, Lcom/feelingk/iap/gui/view/PopupDialog;->InflateView(ILjava/lang/String;Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private ShowJuminAuthDialog()V
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->InflateView()V

    .line 291
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->ShowPopupAuthDialog()V

    .line 292
    const/16 v0, 0x6a

    invoke-static {v0}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 294
    return-void
.end method

.method private ShowLoadingProgress()V
    .locals 3

    .prologue
    .line 242
    new-instance v0, Lcom/feelingk/iap/gui/view/ProgressDialog;

    const-string v1, "\ucc98\ub9ac\uc911\uc785\ub2c8\ub2e4."

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->onProgressCancelListerner:Landroid/content/DialogInterface$OnCancelListener;

    invoke-direct {v0, p0, v1, v2}, Lcom/feelingk/iap/gui/view/ProgressDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    .line 243
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mProgressDlg:Lcom/feelingk/iap/gui/view/ProgressDialog;

    invoke-virtual {v0}, Lcom/feelingk/iap/gui/view/ProgressDialog;->ShowProgress()V

    .line 244
    return-void
.end method

.method private ShowPurchaseDialog(Ljava/lang/Object;)V
    .locals 7
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 266
    check-cast p1, Lcom/feelingk/iap/net/ItemInfoConfirm;

    .end local p1    # "item":Ljava/lang/Object;
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    .line 269
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-virtual {v1}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getItemPrice()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    const-string v5, ""

    invoke-virtual {v1, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 270
    .local v3, "nPrice":I
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-virtual {v1}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getItemTCash()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    const-string v5, ""

    invoke-virtual {v1, v2, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 272
    .local v4, "nTCash":I
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibDeviceCheck()V

    .line 274
    new-instance v0, Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 275
    :goto_0
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-virtual {v2}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getItemPeriod()Ljava/lang/String;

    move-result-object v2

    .line 279
    iget-boolean v6, p0, Lcom/feelingk/iap/IAPActivity;->mUseTCash:Z

    move v5, v3

    .line 274
    invoke-direct/range {v0 .. v6}, Lcom/feelingk/iap/gui/data/PurchaseItem;-><init>(Ljava/lang/String;Ljava/lang/String;IIIZ)V

    .line 280
    .local v0, "pItemInfo":Lcom/feelingk/iap/gui/data/PurchaseItem;
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    iget v2, p0, Lcom/feelingk/iap/IAPActivity;->mRotaion:I

    invoke-virtual {v1, v2, v0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->InflateParserDialog(ILcom/feelingk/iap/gui/data/PurchaseItem;)V

    .line 281
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    invoke-virtual {v1}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->ShowPurchaseDialog()V

    .line 282
    return-void

    .line 274
    .end local v0    # "pItemInfo":Lcom/feelingk/iap/gui/data/PurchaseItem;
    :cond_0
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-virtual {v1}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getItemTitle()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 245
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissLoaingProgress()V

    return-void
.end method

.method static synthetic access$1(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 265
    invoke-direct {p0, p1}, Lcom/feelingk/iap/IAPActivity;->ShowPurchaseDialog(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$10(Lcom/feelingk/iap/IAPActivity;)I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    return v0
.end method

.method static synthetic access$11(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$12(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$13(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->m_Tid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$14(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseBPInfo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$15(Lcom/feelingk/iap/IAPActivity;I)V
    .locals 0

    .prologue
    .line 81
    iput p1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    return-void
.end method

.method static synthetic access$16(Lcom/feelingk/iap/IAPActivity;)Lcom/feelingk/iap/IAPLibSetting;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    return-object v0
.end method

.method static synthetic access$17(Lcom/feelingk/iap/IAPActivity;Z)V
    .locals 0

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/feelingk/iap/IAPActivity;->mUseTCash:Z

    return-void
.end method

.method static synthetic access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mSetTmpBPProtocol:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$19(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$2(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 284
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissPurchaseDialog()V

    return-void
.end method

.method static synthetic access$20(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetTmpBPProtocol:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$21(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 63
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic access$22(Lcom/feelingk/iap/IAPActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$23(Lcom/feelingk/iap/IAPActivity;)I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    return v0
.end method

.method static synthetic access$24(Lcom/feelingk/iap/IAPActivity;)Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/feelingk/iap/IAPActivity;->mUseTCash:Z

    return v0
.end method

.method static synthetic access$25(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 261
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissInfoMessageDialog()V

    return-void
.end method

.method static synthetic access$26(Lcom/feelingk/iap/IAPActivity;I)V
    .locals 0

    .prologue
    .line 56
    iput p1, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    return-void
.end method

.method static synthetic access$27(Lcom/feelingk/iap/IAPActivity;)Landroid/telephony/TelephonyManager;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->m_telephonyManager:Landroid/telephony/TelephonyManager;

    return-object v0
.end method

.method static synthetic access$3(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowLoadingProgress()V

    return-void
.end method

.method static synthetic access$4(Lcom/feelingk/iap/IAPActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$5(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$6(Lcom/feelingk/iap/IAPActivity;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 251
    invoke-direct {p0, p1, p2}, Lcom/feelingk/iap/IAPActivity;->ShowInfoMessageDialog(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$7(Lcom/feelingk/iap/IAPActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 57
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$8(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$9(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 295
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissJuminAuthDialog()V

    return-void
.end method


# virtual methods
.method public IAPLibInit(Lcom/feelingk/iap/IAPLibSetting;)V
    .locals 4
    .param p1, "setting"    # Lcom/feelingk/iap/IAPLibSetting;

    .prologue
    .line 897
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    .line 898
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    iget v2, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    invoke-static {p0, v2}, Lcom/feelingk/iap/util/CommonF;->getMDN(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    invoke-static {p0, v0, v1, v2, v3}, Lcom/feelingk/iap/IAPLib;->init(Landroid/content/Context;Landroid/os/Handler;Lcom/feelingk/iap/IAPLibSetting;Ljava/lang/String;I)V

    .line 899
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 88
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 90
    const-string v0, "IAPActivity"

    const-string v1, "IAPActivity onCreate "

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibDeviceCheck()V

    .line 93
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/IAPActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->m_telephonyManager:Landroid/telephony/TelephonyManager;

    .line 94
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    .line 96
    invoke-static {p0}, Lcom/feelingk/iap/util/CommonF;->getCarrier(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    .line 99
    invoke-virtual {p0}, Lcom/feelingk/iap/IAPActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    .line 100
    .local v6, "params":Landroid/view/WindowManager$LayoutParams;
    iget v0, v6, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x400

    if-lez v0, :cond_0

    .line 102
    const v2, 0x1030011

    .line 103
    .local v2, "theme":I
    new-instance v0, Lcom/feelingk/iap/gui/view/PurchaseDialog;

    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->onPurchasePopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    iget v4, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    iget-boolean v5, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/feelingk/iap/gui/view/PurchaseDialog;-><init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZ)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    .line 104
    new-instance v0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->onJuminDialogPopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    iget-boolean v3, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    invoke-direct {v0, p0, v2, v1, v3}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;-><init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;Z)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    .line 105
    new-instance v0, Lcom/feelingk/iap/gui/view/PopupDialog;

    iget-boolean v1, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    invoke-direct {v0, p0, v2, v1}, Lcom/feelingk/iap/gui/view/PopupDialog;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    .line 115
    :goto_0
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->RestoreData()V

    .line 116
    return-void

    .line 109
    .end local v2    # "theme":I
    :cond_0
    const v2, 0x1030010

    .line 110
    .restart local v2    # "theme":I
    new-instance v0, Lcom/feelingk/iap/gui/view/PurchaseDialog;

    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->onPurchasePopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    iget v4, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    iget-boolean v5, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/feelingk/iap/gui/view/PurchaseDialog;-><init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZ)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseDlg:Lcom/feelingk/iap/gui/view/PurchaseDialog;

    .line 111
    new-instance v0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity;->onJuminDialogPopupCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    iget-boolean v3, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    invoke-direct {v0, p0, v2, v1, v3}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;-><init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;Z)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mJuminAuth:Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;

    .line 112
    new-instance v0, Lcom/feelingk/iap/gui/view/PopupDialog;

    iget-boolean v1, p0, Lcom/feelingk/iap/IAPActivity;->mTabDevice:Z

    invoke-direct {v0, p0, v2, v1}, Lcom/feelingk/iap/gui/view/PopupDialog;-><init>(Landroid/content/Context;IZ)V

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mPopupDlg:Lcom/feelingk/iap/gui/view/PopupDialog;

    goto :goto_0
.end method

.method protected onPause()V
    .locals 7

    .prologue
    const/16 v6, 0x64

    .line 161
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 163
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getDialogType()I

    move-result v2

    .line 164
    .local v2, "nDlgType":I
    const-string v3, "IAPActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "IAPActivity onPause ["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 168
    .local v0, "hnd":Landroid/os/Handler;
    const/16 v3, 0x44e

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 169
    .local v1, "msgNetwork":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 171
    const/16 v3, 0x66

    if-ne v2, v3, :cond_1

    .line 174
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissLoaingProgress()V

    .line 175
    invoke-static {v6}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 194
    :cond_0
    :goto_0
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/feelingk/iap/IAPLib;->setUIHandler(Landroid/os/Handler;)V

    .line 195
    return-void

    .line 177
    :cond_1
    const/16 v3, 0x67

    if-ne v2, v3, :cond_2

    .line 178
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissPurchaseDialog()V

    goto :goto_0

    .line 180
    :cond_2
    const/16 v3, 0x69

    if-ne v2, v3, :cond_3

    .line 181
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissInfoMessageDialog()V

    goto :goto_0

    .line 183
    :cond_3
    const/16 v3, 0x65

    if-ne v2, v3, :cond_4

    .line 184
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissInfoMessageDialog()V

    goto :goto_0

    .line 186
    :cond_4
    const/16 v3, 0x6a

    if-ne v2, v3, :cond_5

    .line 187
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissJuminAuthDialog()V

    goto :goto_0

    .line 189
    :cond_5
    const/16 v3, 0x68

    if-ne v2, v3, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->DismissLoaingProgress()V

    .line 191
    invoke-static {v6}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 120
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 122
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibDeviceCheck()V

    .line 123
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibUSIMStateCheck()V

    .line 125
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getDialogType()I

    move-result v1

    .line 127
    .local v1, "nDlgType":I
    const-string v2, "IAPActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "IAPActivity onResume ["

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    invoke-static {v2}, Lcom/feelingk/iap/IAPLib;->setUIHandler(Landroid/os/Handler;)V

    .line 130
    iget v2, p0, Lcom/feelingk/iap/IAPActivity;->mCurTelecom:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    .line 132
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getEncJuminNumber()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "encJumin":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 138
    invoke-static {v0}, Lcom/feelingk/iap/IAPLib;->updateEncJuminNumber(Ljava/lang/String;)V

    .line 142
    .end local v0    # "encJumin":Ljava/lang/String;
    :cond_0
    const/16 v2, 0x67

    if-ne v1, v2, :cond_2

    .line 143
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-direct {p0, v2}, Lcom/feelingk/iap/IAPActivity;->ShowPurchaseDialog(Ljava/lang/Object;)V

    .line 157
    :cond_1
    :goto_0
    return-void

    .line 144
    :cond_2
    const/16 v2, 0x69

    if-ne v1, v2, :cond_3

    .line 145
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/feelingk/iap/IAPActivity;->ShowInfoMessageDialog(ILjava/lang/String;)V

    goto :goto_0

    .line 146
    :cond_3
    const/16 v2, 0x6a

    if-ne v1, v2, :cond_4

    .line 147
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 148
    :cond_4
    const/16 v2, 0x65

    if-ne v1, v2, :cond_1

    .line 149
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lcom/feelingk/iap/IAPActivity;->ShowInfoMessageDialog(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 211
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 212
    .local v0, "dataBackupMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "NET_MESSAGE"

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mMsgItemInfo:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    const-string v1, "ERR_MESSAGE"

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mErrorMessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    const-string v1, "USE_BPPROTOCOL"

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    const-string v1, "PRODUCT_NAME"

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    const-string v1, "PRODUCT_INFO"

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mItemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    return-object v0
.end method

.method public popPurchaseDlg(Ljava/lang/String;)V
    .locals 2
    .param p1, "pID"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 661
    iput-object v1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 662
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetTmpBPProtocol:Ljava/lang/Boolean;

    .line 663
    invoke-virtual {p0, p1, v1}, Lcom/feelingk/iap/IAPActivity;->popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;)V

    .line 664
    return-void
.end method

.method protected popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "pID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 673
    const-string v2, "IAPActivity"

    const-string v3, "##  TStore Library Version = V 11.03.22"

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    iget v2, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v2, :cond_0

    .line 676
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v3, 0x45c

    .line 677
    const-string v4, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    .line 676
    invoke-virtual {v2, v3, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 677
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 716
    :goto_0
    return-void

    .line 681
    :cond_0
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    .line 683
    if-eqz p2, :cond_3

    .line 685
    const-string v2, ""

    invoke-virtual {p2, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 686
    iput-object v4, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 693
    :goto_1
    const/4 v1, 0x0

    .line 694
    .local v1, "enc":Ljava/lang/String;
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 697
    :try_start_0
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    const-string v3, "utf-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 705
    :cond_1
    :goto_2
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibAuthCheck()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 706
    const/4 v2, 0x1

    iput v2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 707
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 688
    .end local v1    # "enc":Ljava/lang/String;
    :cond_2
    iput-object p2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    goto :goto_1

    .line 691
    :cond_3
    iput-object v4, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    goto :goto_1

    .line 699
    .restart local v1    # "enc":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 700
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const/4 v1, 0x0

    .line 701
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_2

    .line 711
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_4
    const-string v2, "IAPActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "# popPurchaseDlg PID= "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " / UseBPProtocol="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity;->mSetBPProtocol:Ljava/lang/Boolean;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowLoadingProgress()V

    .line 714
    const/16 v2, 0x66

    invoke-static {v2}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 715
    invoke-static {p1, v1}, Lcom/feelingk/iap/IAPLib;->sendItemInfo(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;
    .param p3, "pTID"    # Ljava/lang/String;

    .prologue
    .line 722
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/feelingk/iap/IAPActivity;->popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    return-void
.end method

.method protected popPurchaseDlg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "pID"    # Ljava/lang/String;
    .param p2, "pName"    # Ljava/lang/String;
    .param p3, "pTID"    # Ljava/lang/String;
    .param p4, "pBPInfo"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 727
    const/4 v2, 0x0

    .line 728
    .local v2, "pEncName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 730
    .local v1, "pEncBPInfo":Ljava/lang/String;
    const-string v3, "IAPActivity"

    const-string v4, "##  TStore Library Version = V 11.03.22"

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    iget v3, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v3, :cond_0

    .line 733
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v4, 0x45c

    const-string v5, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v3, v4, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 793
    :goto_0
    return-void

    .line 746
    :cond_0
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    .line 747
    iput-object p4, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseBPInfo:Ljava/lang/String;

    .line 749
    if-eqz p2, :cond_4

    .line 751
    const-string v3, ""

    invoke-virtual {p2, v3}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 752
    iput-object v5, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    .line 759
    :goto_1
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 762
    :try_start_0
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    const-string v4, "utf-8"

    invoke-static {v3, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 770
    :cond_1
    :goto_2
    if-eqz p3, :cond_5

    move-object v3, p3

    :goto_3
    iput-object v3, p0, Lcom/feelingk/iap/IAPActivity;->m_Tid:Ljava/lang/String;

    .line 773
    if-eqz p4, :cond_2

    .line 775
    :try_start_1
    const-string v3, "utf-8"

    invoke-static {p4, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 783
    :cond_2
    :goto_4
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibAuthCheck()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 784
    const/4 v3, 0x2

    iput v3, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 785
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 754
    :cond_3
    iput-object p2, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    goto :goto_1

    .line 757
    :cond_4
    iput-object v5, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseName:Ljava/lang/String;

    goto :goto_1

    .line 764
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 765
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_2

    .line 770
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_5
    invoke-static {p0, p1}, Lcom/feelingk/iap/util/CommonF;->getTID(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 777
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 778
    .restart local v0    # "e":Ljava/io/UnsupportedEncodingException;
    const/4 v1, 0x0

    .line 779
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_4

    .line 789
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_6
    const-string v3, "IAPActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "# popPurchaseDlg TID= "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowLoadingProgress()V

    .line 791
    const/16 v3, 0x66

    invoke-static {v3}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 792
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity;->m_Tid:Ljava/lang/String;

    invoke-static {p1, v2, v3, v1}, Lcom/feelingk/iap/IAPLib;->sendItemInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected sendBPData([B)[B
    .locals 4
    .param p1, "data"    # [B

    .prologue
    const/4 v3, 0x0

    .line 865
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v0, :cond_0

    .line 866
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v1, 0x45c

    const-string v2, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    move-object v0, v3

    .line 877
    :goto_0
    return-object v0

    .line 870
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    iget-object v0, v0, Lcom/feelingk/iap/IAPLibSetting;->BP_IP:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mSetting:Lcom/feelingk/iap/IAPLibSetting;

    iget v0, v0, Lcom/feelingk/iap/IAPLibSetting;->BP_Port:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_2

    .line 872
    :cond_1
    const-string v0, "IAPActivity"

    const-string v1, "sendBPData - BP Server IP is null or invalid Port Number"

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v3

    .line 873
    goto :goto_0

    .line 876
    :cond_2
    const-string v0, "IAPActivity"

    const-string v1, "# sendBPData"

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 877
    invoke-static {p1}, Lcom/feelingk/iap/IAPLib;->sendBPData([B)[B

    move-result-object v0

    goto :goto_0
.end method

.method protected sendItemAuth(Ljava/lang/String;)V
    .locals 3
    .param p1, "pID"    # Ljava/lang/String;

    .prologue
    .line 842
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v0, :cond_0

    .line 843
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v1, 0x45c

    const-string v2, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 856
    :goto_0
    return-void

    .line 847
    :cond_0
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    .line 848
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibAuthCheck()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 849
    const/4 v0, 0x4

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 850
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 854
    :cond_1
    const-string v0, "IAPActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "# sendItemAuth PID="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    invoke-static {p1}, Lcom/feelingk/iap/IAPLib;->sendItemAuth(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected sendItemUse(Ljava/lang/String;)V
    .locals 3
    .param p1, "pID"    # Ljava/lang/String;

    .prologue
    .line 821
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v0, :cond_0

    .line 822
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v1, 0x45c

    const-string v2, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 835
    :goto_0
    return-void

    .line 826
    :cond_0
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseID:Ljava/lang/String;

    .line 827
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibAuthCheck()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 828
    const/4 v0, 0x5

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 829
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 833
    :cond_1
    const-string v0, "IAPActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "# sendItemUse PID="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    invoke-static {p1}, Lcom/feelingk/iap/IAPLib;->sendItemUse(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected sendItemWholeAuth()V
    .locals 3

    .prologue
    .line 801
    iget v0, p0, Lcom/feelingk/iap/IAPActivity;->m_phoneUSIMState:I

    if-eqz v0, :cond_0

    .line 802
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity;->mGUIMessageHandler:Landroid/os/Handler;

    const/16 v1, 0x45c

    const-string v2, "USIM \uc0c1\ud0dc\ub97c \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 814
    :goto_0
    return-void

    .line 806
    :cond_0
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->IAPLibAuthCheck()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 807
    const/4 v0, 0x3

    iput v0, p0, Lcom/feelingk/iap/IAPActivity;->mPurchaseItemWorkFlow:I

    .line 808
    invoke-direct {p0}, Lcom/feelingk/iap/IAPActivity;->ShowJuminAuthDialog()V

    goto :goto_0

    .line 812
    :cond_1
    const-string v0, "IAPActivity"

    const-string v1, "# sendItemWholeAuth"

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->sendItemWholeAuth()V

    goto :goto_0
.end method
