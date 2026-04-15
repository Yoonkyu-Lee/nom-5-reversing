.class public Lcom/gamevil/nexus2/net/NexusFullNetwork;
.super Lcom/gamevil/nexus2/net/NexusNetwork;
.source "NexusFullNetwork.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final SEND_PACKET_HEADER_SIZE:I

.field private static self:Lcom/gamevil/nexus2/net/NexusFullNetwork;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 272
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->self:Lcom/gamevil/nexus2/net/NexusFullNetwork;

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/gamevil/nexus2/NexusGLActivity;Ljava/lang/String;)V
    .locals 2
    .param p1, "activity"    # Lcom/gamevil/nexus2/NexusGLActivity;
    .param p2, "appID"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/gamevil/nexus2/net/NexusNetwork;-><init>(Lcom/gamevil/nexus2/NexusGLActivity;Ljava/lang/String;)V

    .line 51
    sput-object p0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->self:Lcom/gamevil/nexus2/net/NexusFullNetwork;

    .line 52
    const/4 v1, 0x0

    sput-byte v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->errorCounter:B

    .line 53
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 54
    .local v0, "thread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 55
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 56
    return-void
.end method

.method public static NexusNetworkConnect()Z
    .locals 1

    .prologue
    .line 101
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->openTCPConnection()Z

    move-result v0

    return v0
.end method

.method public static NexusNetworkDisconnect()Z
    .locals 1

    .prologue
    .line 105
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->closeTCPConnection()Z

    move-result v0

    return v0
.end method

.method private static getTCPData([B)[B
    .locals 4
    .param p0, "msg"    # [B

    .prologue
    const/4 v3, 0x0

    .line 198
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->outputStream:Ljava/io/DataOutputStream;

    if-nez v1, :cond_0

    .line 199
    new-instance v1, Ljava/io/DataOutputStream;

    sget-object v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->socketConnection:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    sput-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->outputStream:Ljava/io/DataOutputStream;

    .line 203
    :cond_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->outputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v1, p0}, Ljava/io/DataOutputStream;->write([B)V

    .line 204
    sget-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->outputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 206
    sget-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->inputStream:Ljava/io/DataInputStream;

    if-nez v1, :cond_1

    .line 207
    new-instance v1, Ljava/io/DataInputStream;

    sget-object v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->socketConnection:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    sput-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->inputStream:Ljava/io/DataInputStream;

    .line 211
    :cond_1
    sget-object v1, Lcom/gamevil/nexus2/net/NexusFullNetwork;->inputStream:Ljava/io/DataInputStream;

    invoke-static {v1}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->readTCPInput(Ljava/io/DataInputStream;)[B
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    .line 222
    :goto_0
    return-object v1

    .line 213
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 215
    .local v0, "e":Ljava/net/SocketTimeoutException;
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    move-object v1, v3

    .line 216
    goto :goto_0

    .line 217
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :catch_1
    move-exception v1

    move-object v0, v1

    .line 218
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v1, v3

    .line 219
    goto :goto_0

    .line 220
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    move-object v0, v1

    .line 221
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v1, v3

    .line 222
    goto :goto_0
.end method

.method private static insertPacketHeader([B)[B
    .locals 3
    .param p0, "request"    # [B

    .prologue
    const/4 v2, 0x0

    .line 262
    if-nez p0, :cond_0

    .line 263
    const/4 v1, 0x0

    .line 269
    :goto_0
    return-object v1

    .line 265
    :cond_0
    array-length v1, p0

    add-int/lit8 v1, v1, 0x0

    new-array v0, v1, [B

    .line 267
    .local v0, "writeBytes":[B
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v0

    .line 269
    goto :goto_0
.end method

.method private static parseHeader(Ljava/io/DataInputStream;)S
    .locals 4
    .param p0, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 109
    new-array v1, v3, [B

    .line 110
    .local v1, "header":[B
    sput-short v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvLength:S

    .line 112
    const/4 v2, 0x0

    const/4 v3, 0x4

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Ljava/io/DataInputStream;->read([BII)I

    .line 113
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->byte2short([BI)S

    move-result v2

    sput-short v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvLength:S

    .line 114
    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->byte2short([BI)S

    move-result v2

    sput-short v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvCmd:S
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    sget-short v2, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvLength:S

    :goto_0
    return v2

    .line 115
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 117
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private static readTCPInput(Ljava/io/DataInputStream;)[B
    .locals 15
    .param p0, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x0

    .line 134
    const/4 v5, 0x1

    .line 135
    .local v5, "readFirst":Z
    const/4 v4, 0x0

    .line 136
    .local v4, "isEnd":Z
    const/4 v8, 0x0

    :try_start_0
    check-cast v8, [B

    .line 137
    .local v8, "result":[B
    const/4 v2, -0x1

    .line 138
    .local v2, "datalen":I
    const/4 v1, 0x0

    .line 140
    .local v1, "blockIdx":I
    invoke-virtual {p0}, Ljava/io/DataInputStream;->available()I

    move-result v0

    .line 141
    .local v0, "available":I
    if-gtz v0, :cond_0

    .line 142
    const/4 v10, 0x0

    new-array v10, v10, [B

    invoke-virtual {p0, v10}, Ljava/io/DataInputStream;->read([B)I

    .line 143
    const-wide/16 v10, 0x1f4

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    move-object v10, v14

    .line 191
    .end local v0    # "available":I
    .end local v1    # "blockIdx":I
    .end local v2    # "datalen":I
    .end local v8    # "result":[B
    :goto_0
    return-object v10

    .line 148
    .restart local v0    # "available":I
    .restart local v1    # "blockIdx":I
    .restart local v2    # "datalen":I
    .restart local v8    # "result":[B
    :cond_0
    invoke-static {p0}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->parseHeader(Ljava/io/DataInputStream;)S

    move-result v2

    .line 150
    if-eqz v5, :cond_3

    .line 151
    if-gez v2, :cond_1

    move-object v10, v14

    .line 152
    goto :goto_0

    .line 153
    :cond_1
    if-nez v2, :cond_2

    .line 154
    const/4 v10, 0x0

    new-array v10, v10, [B

    goto :goto_0

    .line 157
    :cond_2
    new-array v8, v2, [B

    .line 158
    const/4 v5, 0x0

    .line 161
    :cond_3
    sget-short v10, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvLength:S

    invoke-static {v10}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->short2byte(S)[B

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x2

    invoke-static {v10, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 162
    sget-short v10, Lcom/gamevil/nexus2/net/NexusFullNetwork;->recvCmd:S

    invoke-static {v10}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->short2byte(S)[B

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x2

    const/4 v13, 0x2

    invoke-static {v10, v11, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    const/4 v7, 0x4

    .line 166
    .local v7, "recvLength":I
    :goto_1
    if-eqz v4, :cond_4

    move-object v10, v8

    .line 184
    goto :goto_0

    .line 168
    :cond_4
    mul-int/lit16 v10, v1, 0x400

    add-int/lit8 v9, v10, 0x4

    .line 169
    .local v9, "startIdx":I
    const/16 v6, 0x400

    .line 171
    .local v6, "readSize":I
    add-int v10, v9, v6

    if-lt v10, v2, :cond_5

    .line 172
    sub-int v6, v2, v9

    .line 173
    const/4 v4, 0x1

    .line 178
    :goto_2
    add-int/2addr v7, v6

    .line 179
    invoke-virtual {p0, v8, v9, v6}, Ljava/io/DataInputStream;->read([BII)I

    .line 180
    invoke-static {}, Ljava/lang/Thread;->yield()V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 185
    .end local v0    # "available":I
    .end local v1    # "blockIdx":I
    .end local v2    # "datalen":I
    .end local v6    # "readSize":I
    .end local v7    # "recvLength":I
    .end local v8    # "result":[B
    .end local v9    # "startIdx":I
    :catch_0
    move-exception v10

    move-object v3, v10

    .line 187
    .local v3, "e":Ljava/net/SocketTimeoutException;
    invoke-virtual {v3}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    move-object v10, v14

    .line 188
    goto :goto_0

    .line 175
    .end local v3    # "e":Ljava/net/SocketTimeoutException;
    .restart local v0    # "available":I
    .restart local v1    # "blockIdx":I
    .restart local v2    # "datalen":I
    .restart local v6    # "readSize":I
    .restart local v7    # "recvLength":I
    .restart local v8    # "result":[B
    .restart local v9    # "startIdx":I
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 189
    .end local v0    # "available":I
    .end local v1    # "blockIdx":I
    .end local v2    # "datalen":I
    .end local v6    # "readSize":I
    .end local v7    # "recvLength":I
    .end local v8    # "result":[B
    .end local v9    # "startIdx":I
    :catch_1
    move-exception v10

    move-object v3, v10

    .line 190
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    move-object v10, v14

    .line 191
    goto :goto_0
.end method

.method private static sendTCPRequest([B)[B
    .locals 5
    .param p0, "sendData"    # [B

    .prologue
    const/4 v4, 0x0

    .line 237
    move-object v0, v4

    check-cast v0, [B

    move-object v1, v0

    .line 238
    .local v1, "array":[B
    move-object v0, v4

    check-cast v0, [B

    move-object v3, v0

    .line 240
    .local v3, "msg":[B
    invoke-static {p0}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->insertPacketHeader([B)[B

    move-result-object v3

    .line 243
    :try_start_0
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->openTCPConnection()Z

    .line 244
    invoke-static {v3}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->getTCPData([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 253
    :goto_0
    return-object v1

    .line 246
    :catch_0
    move-exception v4

    move-object v2, v4

    .line 247
    .local v2, "e":Ljava/lang/Exception;
    sget-byte v4, Lcom/gamevil/nexus2/net/NexusFullNetwork;->errorCounter:B

    add-int/lit8 v4, v4, 0x1

    int-to-byte v4, v4

    sput-byte v4, Lcom/gamevil/nexus2/net/NexusFullNetwork;->errorCounter:B

    .line 248
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 63
    const/4 v4, 0x0

    :try_start_0
    check-cast v4, [B

    .line 64
    .local v4, "send":[B
    const/4 v2, 0x0

    check-cast v2, [B

    .line 66
    .local v2, "data":[B
    :cond_0
    :goto_0
    sget-boolean v5, Lcom/gamevil/nexus2/net/NexusFullNetwork;->isRunning:Z

    if-nez v5, :cond_2

    .line 98
    .end local v2    # "data":[B
    .end local v4    # "send":[B
    :cond_1
    :goto_1
    return-void

    .line 67
    .restart local v2    # "data":[B
    .restart local v4    # "send":[B
    :cond_2
    const/4 v4, 0x0

    check-cast v4, [B

    .line 69
    sget-boolean v5, Lcom/gamevil/nexus2/net/NexusFullNetwork;->isRunning:Z

    if-eqz v5, :cond_1

    .line 72
    iget-object v5, p0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-nez v5, :cond_3

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 74
    .local v0, "currentTime":J
    sget-wide v5, Lcom/gamevil/nexus2/net/NexusFullNetwork;->nextSyncTime:J

    cmp-long v5, v0, v5

    if-lez v5, :cond_0

    invoke-virtual {p0}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->isBusy()Z

    move-result v5

    if-nez v5, :cond_0

    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x1388

    add-long/2addr v5, v7

    sput-wide v5, Lcom/gamevil/nexus2/net/NexusFullNetwork;->nextSyncTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 95
    .end local v0    # "currentTime":J
    .end local v2    # "data":[B
    .end local v4    # "send":[B
    :catch_0
    move-exception v5

    move-object v3, v5

    .line 96
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 83
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "data":[B
    .restart local v4    # "send":[B
    :cond_3
    :try_start_1
    iget-object v5, p0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->requestQueue:Ljava/util/Vector;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "send":[B
    check-cast v4, [B

    .line 85
    .restart local v4    # "send":[B
    invoke-static {v4}, Lcom/gamevil/nexus2/net/NexusFullNetwork;->sendTCPRequest([B)[B

    move-result-object v2

    .line 86
    iget-object v5, p0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 87
    iget-object v5, p0, Lcom/gamevil/nexus2/net/NexusFullNetwork;->requestQueue:Ljava/util/Vector;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/util/Vector;->removeElementAt(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 90
    const/16 v5, 0x1f4

    :try_start_2
    sget-byte v6, Lcom/gamevil/nexus2/net/NexusFullNetwork;->errorCounter:B

    shl-int/2addr v5, v6

    int-to-long v5, v5

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 91
    :catch_1
    move-exception v5

    move-object v3, v5

    .line 92
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0
.end method
