.class public Lcom/kaf/net/Network;
.super Ljava/lang/Object;
.source "Network.java"


# static fields
.field public static final ACCESSMODE_DEFAULT:I = 0x0

.field public static final ACCESSMODE_WCDMA_ONLY:I = 0x1

.field public static final CONNECT_WCDMA:I = 0x0

.field public static final CONNECT_WIBRO:I = 0x1

.field public static final CONNECT_WIFI_NESPOT_Private_IP:I = 0x3

.field public static final CONNECT_WIFI_NESPOT_Public_IP:I = 0x2

.field public static final CONNECT_WIFI_PRIVATE_Private_IP:I = 0x5

.field public static final CONNECT_WIFI_PRIVATE_Public_IP:I = 0x4

.field public static final CONNECT_WLAN_IP:I = 0x6

.field public static final NETSTATUS_ALL:I = -0x1

.field public static final NETSTATUS_NON_EAP_AKA_CONNECT:I = 0x200000

.field public static final NETSTATUS_NON_EAP_AKA_CONNECTING:I = 0x100000

.field public static final NETSTATUS_NON_EAP_AKA_DISCONNECT:I = 0x400000

.field public static final NETSTATUS_WCDMA_CONNECT:I = 0x2

.field public static final NETSTATUS_WCDMA_CONNECTING:I = 0x1

.field public static final NETSTATUS_WCDMA_DISCONNECT:I = 0x8

.field public static final NETSTATUS_WCDMA_DISCONNECTING:I = 0x4

.field public static final NETSTATUS_WIFI_DISCONNECT:I = 0x20000

.field public static final NETSTATUS_WIFI_DISCONNECTING:I = 0x10000

.field public static final NETSTATUS_WIFI_NESPOT_CONNECTING:I = 0x10

.field public static final NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT:I = 0x80

.field public static final NETSTATUS_WIFI_NESPOT_Public_IP_CONNECT:I = 0x20

.field public static final NETSTATUS_WIFI_PRIVATE_CONNECTING:I = 0x100

.field public static final NETSTATUS_WIFI_PRIVATE_Private_IP_CONNECT:I = 0x800

.field public static final NETSTATUS_WIFI_PRIVATE_Public_IP_CONNECT:I = 0x200

.field public static final NETSTATUS_WLAN_CONNECT:I = 0x2000

.field public static final NETSTATUS_WLAN_CONNECTING:I = 0x1000

.field public static final NETSTATUS_WLAN_DISABLED:I = 0x8000

.field public static final NETSTATUS_WLAN_DISCONNECT:I = 0x4000

.field public static final NET_CONNECT_DISABLE_DUN:I = -0x4

.field public static final NET_CONNECT_ERROR:I = -0x1

.field public static final NET_CONNECT_ERROR_INTERNET:I = -0x2

.field public static final NET_CONNECT_ERROR_KAF_E_USER_CANCELLED:I = -0x5

.field public static final NET_CONNECT_ERROR_NON_EAP_AKA:I = -0xa

.field public static final NET_CONNECT_ERROR_ROAMINGINTERNET:I = -0x3

.field public static final NET_CONNECT_ERROR_WCDMA_ONLY:I = -0x7

.field public static final NET_CONNECT_ERROR_WIFI_PRIVATE:I = -0x6

.field public static final NET_CONNECT_ERROR_WLAN_DISABLED:I = -0x8

.field public static final NET_CONNECT_ERROR_WLAN_DISCONNECT:I = -0x9


# instance fields
.field private network:Lcom/kaf/net/INetwork;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    .line 139
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getNetworkInstance()Lcom/kaf/net/INetwork;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getIWLANIP()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 248
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 249
    const-string v2, "KAF Library is not loaded."

    .line 248
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    if-nez v0, :cond_1

    .line 252
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 253
    const-string v2, "Object is null"

    .line 252
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    invoke-virtual {v0}, Lcom/kaf/net/INetwork;->getIWLANIP()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatus()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 225
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 226
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 227
    const-string v2, "KAF Library is not loaded."

    .line 226
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    if-nez v0, :cond_1

    .line 230
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 231
    const-string v2, "Object is null"

    .line 230
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    invoke-virtual {v0}, Lcom/kaf/net/INetwork;->getStatus()I

    move-result v0

    return v0
.end method

.method public netClose()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 203
    const-string v2, "KAF Library is not loaded."

    .line 202
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    if-nez v0, :cond_1

    .line 206
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 207
    const-string v2, "Object is null"

    .line 206
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    invoke-virtual {v0}, Lcom/kaf/net/INetwork;->netClose()Z

    move-result v0

    return v0
.end method

.method public netConnect(II)I
    .locals 3
    .param p1, "type"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 179
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 180
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 181
    const-string v2, "KAF Library is not loaded."

    .line 180
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    if-nez v0, :cond_1

    .line 184
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 185
    const-string v2, "Object is null"

    .line 184
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/Network;->network:Lcom/kaf/net/INetwork;

    invoke-virtual {v0, p1, p2}, Lcom/kaf/net/INetwork;->netConnect(II)I

    move-result v0

    return v0
.end method
