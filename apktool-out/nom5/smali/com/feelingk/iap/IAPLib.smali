.class public final Lcom/feelingk/iap/IAPLib;
.super Ljava/lang/Object;
.source "IAPLib.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/feelingk/iap/IAPLib$OnClientListener;
    }
.end annotation


# static fields
.field public static final HND_ERR_AUTH:I = 0x7d0

.field public static final HND_ERR_DATA:I = 0x7d5

.field public static final HND_ERR_INIT:I = 0x7cf

.field public static final HND_ERR_ITEMAUTH:I = 0x7d7

.field public static final HND_ERR_ITEMINFO:I = 0x7d1

.field public static final HND_ERR_ITEMPURCHASE:I = 0x7d3

.field public static final HND_ERR_ITEMQUERY:I = 0x7d2

.field public static final HND_ERR_NORMALTIMEOUT:I = 0x7d8

.field public static final HND_ERR_PAYMENTTIMEOUT:I = 0x7d9

.field public static final HND_ERR_SERVERTIMEOUT:I = 0x7da

.field public static final HND_ERR_USEQUERY:I = 0x7d6

.field public static final HND_ERR_WHOLEQUERY:I = 0x7d4

.field static final TAG:Ljava/lang/String; = "IAPLib"

.field protected static mBPInfo:Ljava/lang/String;

.field protected static mBase:Lcom/feelingk/iap/net/IAPBase;

.field protected static mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

.field private static mContext:Landroid/content/Context;

.field private static mDialogType:I

.field protected static mEncJuminNumber:Ljava/lang/String;

.field private static mHndUI:Landroid/os/Handler;

.field protected static mKorTelecom:I

.field protected static mMdn:Ljava/lang/String;

.field protected static final mNetworkMessageHandler:Landroid/os/Handler;

.field protected static mProductID:Ljava/lang/String;

.field protected static mProductName:Ljava/lang/String;

.field protected static mTID:Ljava/lang/String;

.field protected static mUseBPProtol:Ljava/lang/Boolean;

.field protected static mUseTCash:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 43
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mHndUI:Landroid/os/Handler;

    .line 44
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mContext:Landroid/content/Context;

    .line 46
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    .line 47
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 49
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mProductID:Ljava/lang/String;

    .line 50
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mProductName:Ljava/lang/String;

    .line 51
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mTID:Ljava/lang/String;

    .line 52
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mBPInfo:Ljava/lang/String;

    .line 55
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mUseTCash:Ljava/lang/Boolean;

    .line 56
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mUseBPProtol:Ljava/lang/Boolean;

    .line 58
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mMdn:Ljava/lang/String;

    .line 59
    sput v2, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    .line 60
    sput-object v1, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    .line 62
    const/16 v0, 0x64

    sput v0, Lcom/feelingk/iap/IAPLib;->mDialogType:I

    .line 228
    new-instance v0, Lcom/feelingk/iap/IAPLib$1;

    invoke-direct {v0}, Lcom/feelingk/iap/IAPLib$1;-><init>()V

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mNetworkMessageHandler:Landroid/os/Handler;

    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mHndUI:Landroid/os/Handler;

    return-object v0
.end method

.method protected static close()V
    .locals 1

    .prologue
    .line 214
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->StopService()V

    .line 215
    invoke-static {}, Lcom/feelingk/iap/net/IAPBase;->close()V

    .line 216
    return-void
.end method

.method protected static getDialogType()I
    .locals 1

    .prologue
    .line 173
    sget v0, Lcom/feelingk/iap/IAPLib;->mDialogType:I

    return v0
.end method

.method public static getEncJuminNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    return-object v0
.end method

.method protected static getNetHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 190
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mNetworkMessageHandler:Landroid/os/Handler;

    return-object v0
.end method

.method protected static getUIHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 199
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mHndUI:Landroid/os/Handler;

    return-object v0
.end method

.method protected static init(Landroid/content/Context;Landroid/os/Handler;Lcom/feelingk/iap/IAPLibSetting;Ljava/lang/String;I)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "hnd"    # Landroid/os/Handler;
    .param p2, "setting"    # Lcom/feelingk/iap/IAPLibSetting;
    .param p3, "mdn"    # Ljava/lang/String;
    .param p4, "telecomCarrier"    # I

    .prologue
    .line 66
    sput-object p0, Lcom/feelingk/iap/IAPLib;->mContext:Landroid/content/Context;

    .line 67
    sput-object p1, Lcom/feelingk/iap/IAPLib;->mHndUI:Landroid/os/Handler;

    .line 68
    sput-object p3, Lcom/feelingk/iap/IAPLib;->mMdn:Ljava/lang/String;

    .line 69
    sput p4, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    .line 71
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mUseBPProtol:Ljava/lang/Boolean;

    .line 72
    iget-object v0, p2, Lcom/feelingk/iap/IAPLibSetting;->ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 73
    new-instance v0, Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/IAPLib;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/feelingk/iap/IAPLib;->mNetworkMessageHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, v2, p2, p3}, Lcom/feelingk/iap/net/IAPBase;-><init>(Landroid/content/Context;Landroid/os/Handler;Lcom/feelingk/iap/IAPLibSetting;Ljava/lang/String;)V

    sput-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    .line 75
    return-void
.end method

.method protected static sendBPData([B)[B
    .locals 2
    .param p0, "data"    # [B

    .prologue
    .line 156
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 157
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    invoke-virtual {v0, p0, v1}, Lcom/feelingk/iap/net/IAPBase;->sendBPData([BI)[B

    move-result-object v0

    return-object v0
.end method

.method protected static sendItemAuth(Ljava/lang/String;)V
    .locals 2
    .param p0, "pID"    # Ljava/lang/String;

    .prologue
    .line 136
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 137
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    invoke-virtual {v0, v1, p0}, Lcom/feelingk/iap/net/IAPBase;->ItemAuth(ILjava/lang/String;)V

    .line 138
    return-void
.end method

.method protected static sendItemInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "pID"    # Ljava/lang/String;
    .param p1, "pName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-static {p0, p1, v0, v0}, Lcom/feelingk/iap/IAPLib;->sendItemInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method protected static sendItemInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "pID"    # Ljava/lang/String;
    .param p1, "pName"    # Ljava/lang/String;
    .param p2, "pTid"    # Ljava/lang/String;

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/feelingk/iap/IAPLib;->sendItemInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method protected static sendItemInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "pID"    # Ljava/lang/String;
    .param p1, "pName"    # Ljava/lang/String;
    .param p2, "pTid"    # Ljava/lang/String;
    .param p3, "pBPInfo"    # Ljava/lang/String;

    .prologue
    .line 91
    sput-object p0, Lcom/feelingk/iap/IAPLib;->mProductID:Ljava/lang/String;

    .line 92
    sput-object p1, Lcom/feelingk/iap/IAPLib;->mProductName:Ljava/lang/String;

    .line 93
    sput-object p2, Lcom/feelingk/iap/IAPLib;->mTID:Ljava/lang/String;

    .line 94
    sput-object p3, Lcom/feelingk/iap/IAPLib;->mBPInfo:Ljava/lang/String;

    .line 96
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 97
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/feelingk/iap/net/IAPBase;->ItemInfo(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method protected static sendItemPurchse(Ljava/lang/Boolean;)V
    .locals 7
    .param p0, "bTCash"    # Ljava/lang/Boolean;

    .prologue
    .line 113
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 114
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/IAPLib;->mProductID:Ljava/lang/String;

    sget-object v2, Lcom/feelingk/iap/IAPLib;->mProductName:Ljava/lang/String;

    sget-object v3, Lcom/feelingk/iap/IAPLib;->mTID:Ljava/lang/String;

    sget-object v4, Lcom/feelingk/iap/IAPLib;->mBPInfo:Ljava/lang/String;

    sget-object v6, Lcom/feelingk/iap/IAPLib;->mUseBPProtol:Ljava/lang/Boolean;

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Lcom/feelingk/iap/net/IAPBase;->ItemPurchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 115
    return-void
.end method

.method protected static sendItemPurchseByDanal(Ljava/lang/String;ILjava/lang/Boolean;Ljava/lang/String;)V
    .locals 9
    .param p0, "mdn"    # Ljava/lang/String;
    .param p1, "carrier"    # I
    .param p2, "bTCash"    # Ljava/lang/Boolean;
    .param p3, "jumin"    # Ljava/lang/String;

    .prologue
    .line 119
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 120
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget-object v2, Lcom/feelingk/iap/IAPLib;->mProductID:Ljava/lang/String;

    sget-object v3, Lcom/feelingk/iap/IAPLib;->mProductName:Ljava/lang/String;

    sget-object v5, Lcom/feelingk/iap/IAPLib;->mTID:Ljava/lang/String;

    sget-object v6, Lcom/feelingk/iap/IAPLib;->mBPInfo:Ljava/lang/String;

    move-object v1, p0

    move v4, p1

    move-object v7, p2

    move-object v8, p3

    invoke-virtual/range {v0 .. v8}, Lcom/feelingk/iap/net/IAPBase;->ItemPurchaseDanal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method protected static sendItemQuery()V
    .locals 6

    .prologue
    .line 104
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 105
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    sget-object v2, Lcom/feelingk/iap/IAPLib;->mProductID:Ljava/lang/String;

    sget-object v3, Lcom/feelingk/iap/IAPLib;->mProductName:Ljava/lang/String;

    sget-object v4, Lcom/feelingk/iap/IAPLib;->mTID:Ljava/lang/String;

    sget-object v5, Lcom/feelingk/iap/IAPLib;->mBPInfo:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/feelingk/iap/net/IAPBase;->ItemQuery(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method protected static sendItemUse(Ljava/lang/String;)V
    .locals 2
    .param p0, "pID"    # Ljava/lang/String;

    .prologue
    .line 145
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 146
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    invoke-virtual {v0, v1, p0}, Lcom/feelingk/iap/net/IAPBase;->ItemUse(ILjava/lang/String;)V

    .line 147
    return-void
.end method

.method protected static sendItemWholeAuth()V
    .locals 2

    .prologue
    .line 127
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/IAPBase;->Reset()V

    .line 128
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget v1, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    invoke-virtual {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->ItemWholeAuth(I)V

    .line 129
    return-void
.end method

.method protected static setDialogType(I)V
    .locals 0
    .param p0, "mDialogType"    # I

    .prologue
    .line 181
    sput p0, Lcom/feelingk/iap/IAPLib;->mDialogType:I

    .line 182
    return-void
.end method

.method protected static setUIHandler(Landroid/os/Handler;)V
    .locals 0
    .param p0, "handler"    # Landroid/os/Handler;

    .prologue
    .line 207
    sput-object p0, Lcom/feelingk/iap/IAPLib;->mHndUI:Landroid/os/Handler;

    .line 208
    return-void
.end method

.method public static updateEncJuminNumber(Ljava/lang/String;)V
    .locals 1
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 223
    sput-object p0, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    .line 224
    sget-object v0, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v0, p0}, Lcom/feelingk/iap/net/IAPBase;->setBaseEncodeJuminNumber(Ljava/lang/String;)V

    .line 225
    return-void
.end method
