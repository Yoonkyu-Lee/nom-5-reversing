.class public Lcom/feelingk/iap/IAPLibSetting;
.super Ljava/lang/Object;
.source "IAPLibSetting.java"


# instance fields
.field public AppID:Ljava/lang/String;

.field public BP_IP:Ljava/lang/String;

.field public BP_Port:I

.field public ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-object v1, p0, Lcom/feelingk/iap/IAPLibSetting;->AppID:Ljava/lang/String;

    .line 8
    iput-object v1, p0, Lcom/feelingk/iap/IAPLibSetting;->BP_IP:Ljava/lang/String;

    .line 9
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/IAPLibSetting;->BP_Port:I

    .line 10
    iput-object v1, p0, Lcom/feelingk/iap/IAPLibSetting;->ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 6
    return-void
.end method
