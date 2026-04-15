.class public Lcom/kaf/net/BcmSocket;
.super Ljava/lang/Object;
.source "BcmSocket.java"


# instance fields
.field private socket:Lcom/kaf/net/IBcmSocket;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getBcmSocket()Lcom/kaf/net/IBcmSocket;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 26
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 27
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)V
    .locals 9
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "appid"    # Ljava/lang/String;
    .param p4, "billKind"    # Ljava/lang/String;
    .param p5, "connectKind"    # C
    .param p6, "isTestMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 60
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/kaf/net/BcmSocket;-><init>(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)V
    .locals 10
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
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lcom/kaf/KafManager;->getBcmSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;CZ)Lcom/kaf/net/IBcmSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v0

    move-object v9, v0

    .line 72
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 168
    :cond_0
    :goto_0
    return-void

    .line 166
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->close()V

    goto :goto_0
.end method

.method public connect(Ljava/net/SocketAddress;Ljava/lang/String;Ljava/lang/String;CZ)Z
    .locals 7
    .param p1, "addr"    # Ljava/net/SocketAddress;
    .param p2, "appID"    # Ljava/lang/String;
    .param p3, "billKind"    # Ljava/lang/String;
    .param p4, "connectKind"    # C
    .param p5, "isTestMode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/ConnectException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 80
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v6

    .line 83
    :goto_0
    return v0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v6

    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/kaf/net/IBcmSocket;->connect(Ljava/net/SocketAddress;Ljava/lang/String;Ljava/lang/String;CZI)Z

    move-result v0

    goto :goto_0
.end method

.method public connect(Ljava/net/SocketAddress;Ljava/lang/String;Ljava/lang/String;CZI)Z
    .locals 7
    .param p1, "addr"    # Ljava/net/SocketAddress;
    .param p2, "appID"    # Ljava/lang/String;
    .param p3, "billKind"    # Ljava/lang/String;
    .param p4, "connectKind"    # C
    .param p5, "isTestMode"    # Z
    .param p6, "timeOut"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/ConnectException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 90
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 93
    :goto_0
    return v0

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/kaf/net/IBcmSocket;->connect(Ljava/net/SocketAddress;Ljava/lang/String;Ljava/lang/String;CZI)Z

    move-result v0

    goto :goto_0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 173
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 176
    :goto_0
    return-object v0

    .line 174
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0
.end method

.method public getKeepAlive()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 182
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 185
    :goto_0
    return v0

    .line 183
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getKeepAlive()Z

    move-result v0

    goto :goto_0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 191
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 194
    :goto_0
    return-object v0

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0
.end method

.method public getLocalPort()I
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 200
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 203
    :goto_0
    return v0

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 203
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getLocalPort()I

    move-result v0

    goto :goto_0
.end method

.method public getLocalSocketAddress()Ljava/net/SocketAddress;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 209
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 212
    :goto_0
    return-object v0

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 212
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    goto :goto_0
.end method

.method public getPort()I
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 218
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 221
    :goto_0
    return v0

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 221
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getPort()I

    move-result v0

    goto :goto_0
.end method

.method public getReceiveBufferSize()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 227
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 230
    :goto_0
    return v0

    .line 228
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 230
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getReceiveBufferSize()I

    move-result v0

    goto :goto_0
.end method

.method public getRemoteSocketAddress()Ljava/net/SocketAddress;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 236
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 239
    :goto_0
    return-object v0

    .line 237
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 239
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    goto :goto_0
.end method

.method public getReuseAddress()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 245
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 248
    :goto_0
    return v0

    .line 246
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 248
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getReuseAddress()Z

    move-result v0

    goto :goto_0
.end method

.method public getSendBufferSize()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 254
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 257
    :goto_0
    return v0

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 257
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getSendBufferSize()I

    move-result v0

    goto :goto_0
.end method

.method public getSoLinger()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 263
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 266
    :goto_0
    return v0

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 266
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getSoLinger()I

    move-result v0

    goto :goto_0
.end method

.method public getSoTimeout()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 272
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 275
    :goto_0
    return v0

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 275
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getSoTimeout()I

    move-result v0

    goto :goto_0
.end method

.method public getTcpNoDelay()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 281
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 284
    :goto_0
    return v0

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 284
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->getTcpNoDelay()Z

    move-result v0

    goto :goto_0
.end method

.method public isClosed()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 290
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 293
    :goto_0
    return v0

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 293
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->isClosed()Z

    move-result v0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 299
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 302
    :goto_0
    return v0

    .line 300
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 302
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->isConnected()Z

    move-result v0

    goto :goto_0
.end method

.method public isInputShutdown()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 308
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 311
    :goto_0
    return v0

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 311
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->isInputShutdown()Z

    move-result v0

    goto :goto_0
.end method

.method public isOutputShutdown()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 317
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 320
    :goto_0
    return v0

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 320
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->isOutputShutdown()Z

    move-result v0

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 135
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 137
    :goto_0
    return v0

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 137
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->read([B)I

    move-result v0

    goto :goto_0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 153
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 155
    :goto_0
    return v0

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 155
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1, p2, p3}, Lcom/kaf/net/IBcmSocket;->read([BII)I

    move-result v0

    goto :goto_0
.end method

.method public setKeepAlive(Z)V
    .locals 1
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 327
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setKeepAlive(Z)V

    goto :goto_0
.end method

.method public setReceiveBufferSize(I)V
    .locals 1
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 335
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 339
    :cond_0
    :goto_0
    return-void

    .line 336
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setReceiveBufferSize(I)V

    goto :goto_0
.end method

.method public setReuseAddress(Z)V
    .locals 1
    .param p1, "reuse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 344
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 348
    :cond_0
    :goto_0
    return-void

    .line 345
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 347
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setReuseAddress(Z)V

    goto :goto_0
.end method

.method public setSendBufferSize(I)V
    .locals 1
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 353
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 357
    :cond_0
    :goto_0
    return-void

    .line 354
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setSendBufferSize(I)V

    goto :goto_0
.end method

.method public setSoLinger(ZI)V
    .locals 1
    .param p1, "on"    # Z
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 362
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 366
    :cond_0
    :goto_0
    return-void

    .line 363
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1, p2}, Lcom/kaf/net/IBcmSocket;->setSoLinger(ZI)V

    goto :goto_0
.end method

.method public setSoTimeout(I)V
    .locals 1
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 371
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 375
    :cond_0
    :goto_0
    return-void

    .line 372
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 374
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setSoTimeout(I)V

    goto :goto_0
.end method

.method public setTcpNoDelay(Z)V
    .locals 1
    .param p1, "on"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 380
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 384
    :cond_0
    :goto_0
    return-void

    .line 381
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 383
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->setTcpNoDelay(Z)V

    goto :goto_0
.end method

.method public shutdownInput()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 389
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 393
    :cond_0
    :goto_0
    return-void

    .line 390
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->shutdownInput()V

    goto :goto_0
.end method

.method public shutdownOutput()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 398
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_1

    .line 402
    :cond_0
    :goto_0
    return-void

    .line 399
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-eqz v0, :cond_0

    .line 401
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->shutdownOutput()V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 407
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    .line 410
    :goto_0
    return-object v0

    .line 408
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 410
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0}, Lcom/kaf/net/IBcmSocket;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public write([B)I
    .locals 2
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 99
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 101
    :goto_0
    return v0

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1}, Lcom/kaf/net/IBcmSocket;->write([B)I

    move-result v0

    goto :goto_0
.end method

.method public write([BII)I
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 106
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 108
    :goto_0
    return v0

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1, p2, p3}, Lcom/kaf/net/IBcmSocket;->write([BII)I

    move-result v0

    goto :goto_0
.end method

.method public write([BIIZ)I
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "enc"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 127
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 129
    :goto_0
    return v0

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    .line 129
    :cond_1
    iget-object v0, p0, Lcom/kaf/net/BcmSocket;->socket:Lcom/kaf/net/IBcmSocket;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/kaf/net/IBcmSocket;->write([BIIZ)I

    move-result v0

    goto :goto_0
.end method
