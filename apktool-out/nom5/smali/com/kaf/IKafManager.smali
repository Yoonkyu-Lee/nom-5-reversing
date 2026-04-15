.class public abstract Lcom/kaf/IKafManager;
.super Ljava/lang/Object;
.source "IKafManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/kaf/IKafManager;
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public Initialize(Landroid/content/Context;I)I
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "copyright"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public checkInit(I)V
    .locals 0
    .param p1, "apiLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 27
    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBcmSocket()Lcom/kaf/net/IBcmSocket;
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBcmSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)Lcom/kaf/net/IBcmSocket;
    .locals 1
    .param p1, "dstAddress"    # Ljava/net/InetAddress;
    .param p2, "dstPort"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .param p5, "appid"    # Ljava/lang/String;
    .param p6, "billKind"    # Ljava/lang/String;
    .param p7, "connectKind"    # C
    .param p8, "isTestMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 60
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDebug()Lcom/kaf/log/IDebug;
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDeviceControl()Lcom/kaf/device/IDeviceControl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDisplayManager()Lcom/kaf/display/IDisplayManager;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 39
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMediaManager()Lcom/kaf/media/IMediaManager;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNetwork()Lcom/kaf/net/INetwork;
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNetworkInstance()Lcom/kaf/net/INetwork;
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    return-object v0
.end method

.method public getProperty()Lcom/kaf/sys/IProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 42
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSound()Lcom/kaf/sound/ISound;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 48
    const/4 v0, 0x0

    return-object v0
.end method
