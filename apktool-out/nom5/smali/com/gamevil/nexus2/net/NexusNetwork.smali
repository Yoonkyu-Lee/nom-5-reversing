.class public Lcom/gamevil/nexus2/net/NexusNetwork;
.super Ljava/lang/Object;
.source "NexusNetwork.java"

# interfaces
.implements Lcom/gamevil/nexus2/net/NexusConstants;


# static fields
.field protected static ServerIP:Ljava/lang/String;

.field protected static ServerPort:I

.field protected static errorCounter:B

.field protected static inputStream:Ljava/io/DataInputStream;

.field private static isBigEndian:Z

.field private static isFullNetwork:Z

.field protected static isRunning:Z

.field protected static myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

.field protected static myAppId:Ljava/lang/String;

.field protected static nextSyncTime:J

.field protected static outputStream:Ljava/io/DataOutputStream;

.field protected static recvCmd:S

.field protected static recvLength:S

.field private static self:Lcom/gamevil/nexus2/net/NexusNetwork;

.field protected static sendCmd:S

.field protected static sendLength:S

.field protected static socketConnection:Ljava/net/Socket;


# instance fields
.field protected requestQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<[B>;"
        }
    .end annotation
.end field

.field protected result:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<[B>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 51
    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    .line 53
    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isFullNetwork:Z

    .line 59
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 60
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->myAppId:Ljava/lang/String;

    .line 62
    sput-short v1, Lcom/gamevil/nexus2/net/NexusNetwork;->recvLength:S

    .line 63
    sput-short v1, Lcom/gamevil/nexus2/net/NexusNetwork;->sendLength:S

    .line 65
    sput-short v1, Lcom/gamevil/nexus2/net/NexusNetwork;->recvCmd:S

    .line 66
    sput-short v1, Lcom/gamevil/nexus2/net/NexusNetwork;->sendCmd:S

    .line 71
    const/4 v0, 0x1

    sput-boolean v0, Lcom/gamevil/nexus2/net/NexusNetwork;->isRunning:Z

    .line 76
    sput-byte v1, Lcom/gamevil/nexus2/net/NexusNetwork;->errorCounter:B

    .line 81
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/gamevil/nexus2/net/NexusNetwork;->nextSyncTime:J

    .line 97
    const-string v0, "218.146.3.18"

    sput-object v0, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerIP:Ljava/lang/String;

    .line 98
    const/16 v0, 0x5aa4

    sput v0, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerPort:I

    .line 100
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    .line 102
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->inputStream:Ljava/io/DataInputStream;

    .line 103
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->outputStream:Ljava/io/DataOutputStream;

    .line 321
    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->self:Lcom/gamevil/nexus2/net/NexusNetwork;

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/gamevil/nexus2/NexusGLActivity;Ljava/lang/String;)V
    .locals 1
    .param p1, "activity"    # Lcom/gamevil/nexus2/NexusGLActivity;
    .param p2, "appID"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->result:Ljava/util/Vector;

    .line 92
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->requestQueue:Ljava/util/Vector;

    .line 106
    sput-object p0, Lcom/gamevil/nexus2/net/NexusNetwork;->self:Lcom/gamevil/nexus2/net/NexusNetwork;

    .line 108
    const/4 v0, 0x0

    sput-byte v0, Lcom/gamevil/nexus2/net/NexusNetwork;->errorCounter:B

    .line 109
    sput-object p1, Lcom/gamevil/nexus2/net/NexusNetwork;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 110
    sput-object p2, Lcom/gamevil/nexus2/net/NexusNetwork;->myAppId:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public static final byte2int([BI)I
    .locals 3
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 273
    const/4 v0, 0x0

    .line 274
    .local v0, "i":I
    sget-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    if-eqz v1, :cond_0

    .line 276
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    .line 277
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    .line 276
    or-int/2addr v1, v2

    .line 278
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    .line 276
    or-int/2addr v1, v2

    .line 279
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    .line 275
    or-int v0, v1, v2

    .line 291
    :goto_0
    return v0

    .line 284
    :cond_0
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    .line 285
    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    .line 284
    or-int/2addr v1, v2

    .line 286
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    .line 284
    or-int/2addr v1, v2

    .line 287
    aget-byte v2, p0, p1

    and-int/lit16 v2, v2, 0xff

    .line 283
    or-int v0, v1, v2

    goto :goto_0
.end method

.method public static final byte2short([BI)S
    .locals 3
    .param p0, "b"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 310
    const/4 v0, 0x0

    .line 311
    .local v0, "s":S
    sget-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    if-eqz v1, :cond_0

    .line 312
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    int-to-short v0, v1

    .line 318
    :goto_0
    return v0

    .line 315
    :cond_0
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    aget-byte v2, p0, p1

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    int-to-short v0, v1

    goto :goto_0
.end method

.method public static closeTCPConnection()Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 224
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->outputStream:Ljava/io/DataOutputStream;

    if-eqz v1, :cond_0

    .line 225
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->outputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 226
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->outputStream:Ljava/io/DataOutputStream;

    .line 228
    :cond_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->inputStream:Ljava/io/DataInputStream;

    if-eqz v1, :cond_1

    .line 229
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->inputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    .line 230
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->inputStream:Ljava/io/DataInputStream;

    .line 232
    :cond_1
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    if-eqz v1, :cond_2

    .line 233
    sget-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 234
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    .line 237
    :cond_2
    const-wide/16 v1, 0x1f4

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    const/4 v1, 0x1

    .line 244
    :goto_0
    return v1

    .line 239
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 240
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 241
    sput-object v3, Lcom/gamevil/nexus2/net/NexusNetwork;->outputStream:Ljava/io/DataOutputStream;

    .line 242
    sput-object v3, Lcom/gamevil/nexus2/net/NexusNetwork;->inputStream:Ljava/io/DataInputStream;

    .line 243
    sput-object v3, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    .line 244
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static commonNetAvailable()Z
    .locals 4

    .prologue
    .line 176
    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 178
    .local v0, "connManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 179
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 180
    const/4 v2, 0x1

    .line 183
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getRecvLength()I
    .locals 1

    .prologue
    .line 131
    sget-short v0, Lcom/gamevil/nexus2/net/NexusNetwork;->recvLength:S

    return v0
.end method

.method public static final int2byte(I)[B
    .locals 6
    .param p0, "i"    # I

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 254
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 255
    .local v0, "dest":[B
    sget-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    if-eqz v1, :cond_0

    .line 256
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    .line 257
    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 258
    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 259
    ushr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 267
    :goto_0
    return-object v0

    .line 262
    :cond_0
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 263
    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 264
    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    .line 265
    ushr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    goto :goto_0
.end method

.method public static openTCPConnection()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 191
    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    if-eqz v2, :cond_0

    move v2, v4

    .line 215
    :goto_0
    return v2

    .line 195
    :cond_0
    :try_start_0
    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerIP:Ljava/lang/String;

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    .line 196
    .local v1, "serverAddr":Ljava/net/InetAddress;
    new-instance v2, Ljava/net/Socket;

    sget v3, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerPort:I

    invoke-direct {v2, v1, v3}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    sput-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    .line 197
    sget-boolean v2, Lcom/gamevil/nexus2/net/NexusNetwork;->isFullNetwork:Z

    if-eqz v2, :cond_1

    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    const/16 v3, 0x4e20

    invoke-virtual {v2, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 199
    :goto_1
    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    if-eqz v2, :cond_2

    move v2, v4

    .line 201
    goto :goto_0

    .line 198
    :cond_1
    sget-object v2, Lcom/gamevil/nexus2/net/NexusNetwork;->socketConnection:Ljava/net/Socket;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/net/Socket;->setKeepAlive(Z)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 203
    .end local v1    # "serverAddr":Ljava/net/InetAddress;
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 205
    .local v0, "e":Ljava/net/SocketTimeoutException;
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    .line 206
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusNetwork;->closeTCPConnection()Z

    move v2, v5

    .line 207
    goto :goto_0

    .line 208
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :catch_1
    move-exception v2

    move-object v0, v2

    .line 209
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 210
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusNetwork;->closeTCPConnection()Z

    move v2, v5

    .line 211
    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "serverAddr":Ljava/net/InetAddress;
    :cond_2
    move v2, v4

    .line 215
    goto :goto_0
.end method

.method public static serverInfo(Ljava/lang/String;I)V
    .locals 0
    .param p0, "sIP"    # Ljava/lang/String;
    .param p1, "nPort"    # I

    .prologue
    .line 126
    sput-object p0, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerIP:Ljava/lang/String;

    .line 127
    sput p1, Lcom/gamevil/nexus2/net/NexusNetwork;->ServerPort:I

    .line 128
    return-void
.end method

.method public static setFullNetwork(Z)V
    .locals 0
    .param p0, "b"    # Z

    .prologue
    .line 122
    sput-boolean p0, Lcom/gamevil/nexus2/net/NexusNetwork;->isFullNetwork:Z

    .line 123
    return-void
.end method

.method public static setRunning(Z)V
    .locals 0
    .param p0, "b"    # Z

    .prologue
    .line 114
    sput-boolean p0, Lcom/gamevil/nexus2/net/NexusNetwork;->isRunning:Z

    .line 115
    return-void
.end method

.method public static setServerEndian(Z)V
    .locals 0
    .param p0, "b"    # Z

    .prologue
    .line 118
    sput-boolean p0, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    .line 119
    return-void
.end method

.method public static final short2byte(S)[B
    .locals 4
    .param p0, "s"    # S

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 296
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 297
    .local v0, "dest":[B
    sget-boolean v1, Lcom/gamevil/nexus2/net/NexusNetwork;->isBigEndian:Z

    if-eqz v1, :cond_0

    .line 298
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 299
    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 305
    :goto_0
    return-object v0

    .line 302
    :cond_0
    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 303
    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    goto :goto_0
.end method


# virtual methods
.method public doSendTCP([B)V
    .locals 1
    .param p1, "send"    # [B

    .prologue
    .line 138
    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 139
    return-void
.end method

.method public getResponse()[B
    .locals 5

    .prologue
    .line 149
    const/4 v1, 0x0

    check-cast v1, [B

    .line 151
    .local v1, "barray":[B
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 152
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    move-result-object v2

    .line 153
    .local v2, "obj":Ljava/lang/Object;
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->result:Ljava/util/Vector;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/Vector;->removeElementAt(I)V

    .line 154
    instance-of v3, v2, [B

    if-eqz v3, :cond_0

    move-object v0, v2

    check-cast v0, [B

    move-object v1, v0

    .line 157
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_0
    return-object v1
.end method

.method public isBusy()Z
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
