.class public Lcom/feelingk/iap/net/IAPBase;
.super Lcom/feelingk/iap/net/IAPNet;
.source "IAPBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/feelingk/iap/net/IAPBase$CallItemAuth;,
        Lcom/feelingk/iap/net/IAPBase$CallItemInfo;,
        Lcom/feelingk/iap/net/IAPBase$CallItemItemUse;,
        Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;,
        Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;,
        Lcom/feelingk/iap/net/IAPBase$CallItemQuery;,
        Lcom/feelingk/iap/net/IAPBase$CallItemWholeAuth;,
        Lcom/feelingk/iap/net/IAPBase$CallSendBPData;,
        Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "IAPBase"


# instance fields
.field public APPLICATION_ID:Ljava/lang/String;

.field public BP_SERVER_IP:Ljava/lang/String;

.field public BP_SERVER_PORT:I

.field public MDN:Ljava/lang/String;

.field public errMsg:Ljava/lang/String;

.field private initCfm:Lcom/feelingk/iap/net/InitConfirm;

.field public isWifi:Z

.field private itemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

.field private itemUseConfirm:Lcom/feelingk/iap/net/ItemUseConfirm;

.field private itemWholeAuthConfirm:Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

.field public mContext:Landroid/content/Context;

.field private mEncJuminNumer:Ljava/lang/String;

.field public mExecutorService:Ljava/util/concurrent/ExecutorService;

.field public mNetworkHandler:Landroid/os/Handler;

.field public mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

.field private msgConfirm:Lcom/feelingk/iap/net/MsgConfirm;

.field public subErrorCode:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/feelingk/iap/IAPLibSetting;Ljava/lang/String;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "setting"    # Lcom/feelingk/iap/IAPLibSetting;
    .param p4, "mdn"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lcom/feelingk/iap/net/IAPNet;-><init>()V

    .line 47
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkHandler:Landroid/os/Handler;

    .line 49
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    .line 50
    iput v2, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 52
    const-string v0, ""

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    .line 53
    const-string v0, ""

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 55
    iput-boolean v2, p0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    .line 58
    iput v2, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 60
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mContext:Landroid/content/Context;

    .line 61
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 65
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    .line 66
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->msgConfirm:Lcom/feelingk/iap/net/MsgConfirm;

    .line 67
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->itemWholeAuthConfirm:Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    .line 68
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->itemUseConfirm:Lcom/feelingk/iap/net/ItemUseConfirm;

    .line 69
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->itemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    .line 71
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mEncJuminNumer:Ljava/lang/String;

    .line 72
    sget-object v0, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_MAIN:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 76
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->mContext:Landroid/content/Context;

    .line 77
    iput-object p2, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkHandler:Landroid/os/Handler;

    .line 79
    iget-object v0, p3, Lcom/feelingk/iap/IAPLibSetting;->AppID:Ljava/lang/String;

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    .line 80
    iget-object v0, p3, Lcom/feelingk/iap/IAPLibSetting;->BP_IP:Ljava/lang/String;

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    .line 81
    iget v0, p3, Lcom/feelingk/iap/IAPLibSetting;->BP_Port:I

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 82
    iput-object p4, p0, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 84
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 85
    return-void
.end method

.method private SendMessageToNetwork(ILjava/lang/Object;)V
    .locals 2
    .param p1, "messageID"    # I
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 115
    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 116
    .local v0, "messageH":Landroid/os/Message;
    iget v1, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 117
    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 118
    return-void
.end method

.method static synthetic access$0(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->msgConfirm:Lcom/feelingk/iap/net/MsgConfirm;

    return-void
.end method

.method static synthetic access$1(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/MsgConfirm;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->msgConfirm:Lcom/feelingk/iap/net/MsgConfirm;

    return-object v0
.end method

.method static synthetic access$2(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)Z
    .locals 1

    .prologue
    .line 155
    invoke-direct {p0, p1}, Lcom/feelingk/iap/net/IAPBase;->resultProc(Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0, p1, p2}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    return-void
.end method

.method static synthetic access$4(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/ItemInfoConfirm;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->itemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    return-void
.end method

.method static synthetic access$5(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/ItemInfoConfirm;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    return-object v0
.end method

.method static synthetic access$6(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/ItemWholeAuthConfirm;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->itemWholeAuthConfirm:Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    return-void
.end method

.method static synthetic access$7(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemWholeAuthConfirm:Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    return-object v0
.end method

.method static synthetic access$8(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/ItemUseConfirm;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->itemUseConfirm:Lcom/feelingk/iap/net/ItemUseConfirm;

    return-void
.end method

.method static synthetic access$9(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/ItemUseConfirm;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemUseConfirm:Lcom/feelingk/iap/net/ItemUseConfirm;

    return-object v0
.end method

.method public static close()V
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapClose(Z)I

    .line 139
    return-void
.end method

.method private resultProc(Lcom/feelingk/iap/net/MsgConfirm;)Z
    .locals 5
    .param p1, "result"    # Lcom/feelingk/iap/net/MsgConfirm;

    .prologue
    const/4 v4, 0x0

    .line 157
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result v1

    if-eqz v1, :cond_3

    .line 159
    const-string v1, "IAPNet"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[ DEBUG ]  Network ErrorCode :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    :try_start_0
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->getResultCode()B

    move-result v1

    iput v1, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 164
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->getMsg()[B

    move-result-object v1

    if-eqz v1, :cond_1

    .line 165
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->getMsg()[B

    move-result-object v2

    const-string v3, "MS949"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    .line 166
    const-string v1, "flybbird"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Network Message :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    :cond_0
    :goto_0
    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_ERROR:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    move v1, v4

    .line 188
    :goto_1
    return v1

    .line 169
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->GetUserMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 170
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->GetUserMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 179
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 180
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 174
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_2
    :try_start_2
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->GetDumpMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 175
    invoke-virtual {p1}, Lcom/feelingk/iap/net/MsgConfirm;->GetDumpMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 187
    :cond_3
    iput v4, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 188
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public ItemAuth(ILjava/lang/String;)V
    .locals 2
    .param p1, "telecom"    # I
    .param p2, "pID"    # Ljava/lang/String;

    .prologue
    .line 614
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;

    invoke-direct {v1, p0, p1, p2}, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;-><init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 615
    return-void
.end method

.method public ItemInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "pTelecom"    # I
    .param p2, "PID"    # Ljava/lang/String;
    .param p3, "PNAME"    # Ljava/lang/String;
    .param p4, "pTID"    # Ljava/lang/String;
    .param p5, "pBPInfo"    # Ljava/lang/String;

    .prologue
    .line 204
    iget-object v7, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;-><init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 205
    return-void
.end method

.method public ItemPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "PNAME"    # Ljava/lang/String;
    .param p3, "TCASH"    # Ljava/lang/Boolean;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 371
    return-void
.end method

.method public ItemPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 8
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "PNAME"    # Ljava/lang/String;
    .param p3, "TID"    # Ljava/lang/String;
    .param p4, "BPINFO"    # Ljava/lang/String;
    .param p5, "TCASH"    # Ljava/lang/Boolean;

    .prologue
    .line 374
    iget-object v7, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p5

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 375
    return-void
.end method

.method public ItemPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 9
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "PNAME"    # Ljava/lang/String;
    .param p3, "TID"    # Ljava/lang/String;
    .param p4, "BPINFO"    # Ljava/lang/String;
    .param p5, "TCASH"    # Ljava/lang/Boolean;
    .param p6, "useBPProtocol"    # Ljava/lang/Boolean;

    .prologue
    .line 379
    iget-object v8, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p5

    move-object v5, p3

    move-object v6, p4

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/feelingk/iap/net/IAPBase$CallItemPurchase;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-interface {v8, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 380
    return-void
.end method

.method public ItemPurchaseDanal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 11
    .param p1, "mdn"    # Ljava/lang/String;
    .param p2, "pID"    # Ljava/lang/String;
    .param p3, "pName"    # Ljava/lang/String;
    .param p4, "pCarrier"    # I
    .param p5, "TID"    # Ljava/lang/String;
    .param p6, "BPInfo"    # Ljava/lang/String;
    .param p7, "bTCash"    # Ljava/lang/Boolean;
    .param p8, "encJumin"    # Ljava/lang/String;

    .prologue
    .line 446
    iget-object v10, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;

    invoke-virtual/range {p7 .. p7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 447
    return-void
.end method

.method public ItemQuery(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "telecom"    # I
    .param p2, "PID"    # Ljava/lang/String;
    .param p3, "PName"    # Ljava/lang/String;
    .param p4, "PTID"    # Ljava/lang/String;
    .param p5, "pBPInfo"    # Ljava/lang/String;

    .prologue
    .line 299
    iget-object v7, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/feelingk/iap/net/IAPBase$CallItemQuery;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/feelingk/iap/net/IAPBase$CallItemQuery;-><init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 300
    return-void
.end method

.method public ItemQuery(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "PID"    # Ljava/lang/String;
    .param p2, "PName"    # Ljava/lang/String;

    .prologue
    .line 296
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/feelingk/iap/net/IAPBase$CallItemQuery;

    invoke-direct {v1, p0, p1, p2}, Lcom/feelingk/iap/net/IAPBase$CallItemQuery;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 297
    return-void
.end method

.method public ItemUse(ILjava/lang/String;)V
    .locals 2
    .param p1, "telecom"    # I
    .param p2, "PID"    # Ljava/lang/String;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/feelingk/iap/net/IAPBase$CallItemItemUse;

    invoke-direct {v1, p0, p1, p2}, Lcom/feelingk/iap/net/IAPBase$CallItemItemUse;-><init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 561
    return-void
.end method

.method public ItemWholeAuth(I)V
    .locals 2
    .param p1, "telecom"    # I

    .prologue
    .line 513
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/feelingk/iap/net/IAPBase$CallItemWholeAuth;

    invoke-direct {v1, p0, p1}, Lcom/feelingk/iap/net/IAPBase$CallItemWholeAuth;-><init>(Lcom/feelingk/iap/net/IAPBase;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 514
    return-void
.end method

.method public Reset()V
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 128
    :cond_0
    return-void
.end method

.method public StopService()V
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 134
    :cond_0
    return-void
.end method

.method connect(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p1, "pTelecom"    # I
    .param p2, "pID"    # Ljava/lang/String;
    .param p3, "pTID"    # Ljava/lang/String;

    .prologue
    .line 781
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/ConnectivityManager;

    .line 782
    .local v10, "connectivityManager":Landroid/net/ConnectivityManager;
    const/4 v0, 0x0

    invoke-virtual {v10, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v11

    .line 783
    .local v11, "mobile":Landroid/net/NetworkInfo;
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v12

    .line 786
    .local v12, "wifi":Landroid/net/NetworkInfo;
    invoke-virtual {v12}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 787
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    .line 804
    :goto_0
    const-string v0, "IAPBase"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "(IAPBase) IAPNet Wifi = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  /  Connect= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/feelingk/iap/net/IAPNet;->isConnect()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 806
    invoke-static {}, Lcom/feelingk/iap/net/IAPNet;->isConnect()Z

    move-result v0

    if-nez v0, :cond_4

    .line 807
    const-string v0, "IAPBase"

    const-string v1, "G/W Connect and Success !!! "

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    iget-boolean v0, p0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    if-eqz v0, :cond_3

    .line 810
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->setWifi(Z)V

    .line 811
    new-instance v0, Lcom/feelingk/iap/net/ServerInfo;

    const-string v1, "iap.tstore.co.kr"

    const/16 v2, 0x1d56

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/ServerInfo;-><init>(Ljava/lang/String;I)V

    .line 813
    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 814
    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    iget v5, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 817
    iget-object v8, p0, Lcom/feelingk/iap/net/IAPBase;->mEncJuminNumer:Ljava/lang/String;

    .line 818
    const/4 v9, 0x0

    move v1, p1

    move-object v6, p2

    move-object/from16 v7, p3

    .line 811
    invoke-static/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPNet;->iapConnect(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    .line 838
    :goto_1
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    if-nez v0, :cond_5

    .line 839
    const/4 v0, 0x0

    .line 861
    :goto_2
    return v0

    .line 789
    :cond_0
    invoke-virtual {v11}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 790
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    goto :goto_0

    .line 793
    :cond_1
    if-nez p2, :cond_2

    .line 794
    const/4 v0, -0x1

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 795
    const/16 v0, 0x7d0

    const-string v1, "\ub124\ud2b8\uc6cc\ud06c\uac00 \uc5f0\uacb0\ub418\uc5b4 \uc788\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4."

    invoke-direct {p0, v0, v1}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    .line 800
    :goto_3
    const/4 v0, 0x0

    goto :goto_2

    .line 798
    :cond_2
    const/16 v0, 0x7d7

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    goto :goto_3

    .line 821
    :cond_3
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->setWifi(Z)V

    .line 822
    new-instance v0, Lcom/feelingk/iap/net/ServerInfo;

    const-string v1, "iap.tstore.co.kr"

    const/16 v2, 0x1cf2

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/ServerInfo;-><init>(Ljava/lang/String;I)V

    .line 824
    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 825
    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    iget v5, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 828
    iget-object v8, p0, Lcom/feelingk/iap/net/IAPBase;->mEncJuminNumer:Ljava/lang/String;

    .line 829
    const/4 v9, 0x0

    move v1, p1

    move-object v6, p2

    move-object/from16 v7, p3

    .line 822
    invoke-static/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPNet;->iapConnect(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    goto :goto_1

    .line 834
    :cond_4
    const-string v0, "IAPBase"

    const-string v1, "G/W Re Connect + Auth"

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 835
    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase;->mEncJuminNumer:Ljava/lang/String;

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    iget v5, p0, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    move v0, p1

    move-object v6, p2

    move-object/from16 v7, p3

    invoke-static/range {v0 .. v7}, Lcom/feelingk/iap/net/IAPNet;->iapReAuth(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    goto :goto_1

    .line 841
    :cond_5
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    invoke-direct {p0, v0}, Lcom/feelingk/iap/net/IAPBase;->resultProc(Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 843
    iget v0, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xb

    if-eq v0, v1, :cond_6

    .line 844
    iget v0, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xc

    if-eq v0, v1, :cond_6

    .line 845
    iget v0, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xd

    if-ne v0, v1, :cond_7

    .line 848
    :cond_6
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 849
    const/16 v0, 0x7d8

    const-string v1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-direct {p0, v0, v1}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    .line 858
    :goto_4
    const/4 v0, 0x0

    goto/16 :goto_2

    .line 852
    :cond_7
    if-nez p2, :cond_8

    .line 853
    const/16 v0, 0x7d0

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    goto :goto_4

    .line 856
    :cond_8
    const/16 v0, 0x7d7

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    goto :goto_4

    .line 861
    :cond_9
    const/4 v0, 0x1

    goto/16 :goto_2
.end method

.method public getInitConfirmMessage()Lcom/feelingk/iap/net/InitConfirm;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->initCfm:Lcom/feelingk/iap/net/InitConfirm;

    return-object v0
.end method

.method public getItemInfoConfirmMessage()Lcom/feelingk/iap/net/ItemInfoConfirm;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemInfoConfirm:Lcom/feelingk/iap/net/ItemInfoConfirm;

    return-object v0
.end method

.method public getItemUseConfirmMessage()Lcom/feelingk/iap/net/ItemUseConfirm;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemUseConfirm:Lcom/feelingk/iap/net/ItemUseConfirm;

    return-object v0
.end method

.method public getItemWholeAuthConfirmMessage()Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase;->itemWholeAuthConfirm:Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    return-object v0
.end method

.method public sendBPData([BI)[B
    .locals 8
    .param p1, "data"    # [B
    .param p2, "telecom"    # I

    .prologue
    const/16 v7, 0x7d5

    const/4 v4, 0x0

    .line 652
    move-object v0, v4

    check-cast v0, [B

    move-object v2, v0

    .line 654
    .local v2, "returnData":[B
    iget-object v5, p0, Lcom/feelingk/iap/net/IAPBase;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v6, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;

    invoke-direct {v6, p0, p1, p2}, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;-><init>(Lcom/feelingk/iap/net/IAPBase;[BI)V

    invoke-interface {v5, v6}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v3

    .line 657
    .local v3, "service":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<[B>;"
    :try_start_0
    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, [B

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1

    .line 666
    :goto_0
    return-object v2

    .line 658
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 659
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-direct {p0, v7, v4}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    .line 660
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 661
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v5

    move-object v1, v5

    .line 662
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    invoke-direct {p0, v7, v4}, Lcom/feelingk/iap/net/IAPBase;->SendMessageToNetwork(ILjava/lang/Object;)V

    .line 663
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0
.end method

.method public setBaseEncodeJuminNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "jumin"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase;->mEncJuminNumer:Ljava/lang/String;

    .line 106
    return-void
.end method
