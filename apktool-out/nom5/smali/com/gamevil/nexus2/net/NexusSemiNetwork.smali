.class public Lcom/gamevil/nexus2/net/NexusSemiNetwork;
.super Lcom/gamevil/nexus2/net/NexusNetwork;
.source "NexusSemiNetwork.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    }
.end annotation


# static fields
.field private static doRecvPacket:Z

.field private static doSendPacket:Z

.field private static isRequestPurchase:Z

.field private static isUseServerPayCode:Z

.field private static mHandler:Landroid/os/Handler;

.field private static pItemBuySeq:I

.field private static pItemName:Ljava/lang/String;

.field private static pItemPaycode:Ljava/lang/String;

.field private static recvPayCodeOffset:I

.field private static self:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

.field private static sendPayCode:Ljava/lang/String;

.field private static sendPayCodeOffset:I


# instance fields
.field private purchaseItemQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;",
            ">;"
        }
    .end annotation
.end field

.field private purchaseSequenceQueue:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 64
    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doSendPacket:Z

    .line 65
    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doRecvPacket:Z

    .line 70
    const/4 v0, 0x5

    sput v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvPayCodeOffset:I

    .line 71
    const/4 v0, 0x4

    sput v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCodeOffset:I

    .line 78
    const/4 v0, 0x1

    sput-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isUseServerPayCode:Z

    .line 83
    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isRequestPurchase:Z

    .line 84
    sput-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCode:Ljava/lang/String;

    .line 526
    sput-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->pItemPaycode:Ljava/lang/String;

    .line 527
    sput-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->pItemName:Ljava/lang/String;

    .line 528
    sput v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->pItemBuySeq:I

    .line 529
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->mHandler:Landroid/os/Handler;

    .line 982
    sput-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->self:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

    .line 62
    return-void
.end method

.method public constructor <init>(Lcom/gamevil/nexus2/NexusGLActivity;Ljava/lang/String;)V
    .locals 3
    .param p1, "activity"    # Lcom/gamevil/nexus2/NexusGLActivity;
    .param p2, "appID"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 107
    invoke-direct {p0, p1, p2}, Lcom/gamevil/nexus2/net/NexusNetwork;-><init>(Lcom/gamevil/nexus2/NexusGLActivity;Ljava/lang/String;)V

    .line 85
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseSequenceQueue:Ljava/util/Vector;

    .line 103
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseItemQueue:Ljava/util/Vector;

    .line 109
    sput-object p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->self:Lcom/gamevil/nexus2/net/NexusSemiNetwork;

    .line 110
    sput-byte v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->errorCounter:B

    .line 111
    sput-short v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    .line 112
    sput-object p2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->myAppId:Ljava/lang/String;

    .line 120
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 121
    .local v0, "thread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 122
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 123
    return-void
.end method

.method public static NexusNetConnect()Z
    .locals 1

    .prologue
    .line 565
    const/4 v0, 0x0

    return v0
.end method

.method public static NexusNetworkConnect()Z
    .locals 2

    .prologue
    .line 570
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->NexusNetConnect()Z

    move-result v0

    .line 571
    .local v0, "netConnect":Z
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 575
    :goto_0
    return v1

    :cond_0
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->openTCPConnection()Z

    move-result v1

    goto :goto_0
.end method

.method public static NexusNetworkDisconnect()Z
    .locals 1

    .prologue
    .line 583
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->closeTCPConnection()Z

    move-result v0

    return v0
.end method

.method public static NexusServer(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "sIP"    # Ljava/lang/String;
    .param p1, "nPort"    # I

    .prologue
    const/4 v0, 0x0

    .line 130
    sput-byte v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->errorCounter:B

    .line 131
    sput-short v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    .line 133
    invoke-static {p0, p1}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->serverInfo(Ljava/lang/String;I)V

    .line 134
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->NexusNetworkConnect()Z

    move-result v0

    return v0
.end method

.method private checkInputPurchaseSequence([B)Z
    .locals 7
    .param p1, "recvPacket"    # [B

    .prologue
    const/4 v6, 0x1

    .line 188
    sget-short v4, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvCmd:S

    invoke-direct {p0, v4}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isPurchaseSequence(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 189
    const/4 v4, 0x4

    aget-byte v0, p1, v4

    .line 192
    .local v0, "ackCode":I
    if-ne v0, v6, :cond_1

    .line 193
    const/4 v3, 0x0

    .line 194
    .local v3, "payCode":Ljava/lang/String;
    const/4 v4, 0x5

    invoke-static {p1, v4}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->byte2int([BI)I

    move-result v1

    .line 195
    .local v1, "buySeq":I
    sget-boolean v4, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isUseServerPayCode:Z

    if-eqz v4, :cond_0

    .line 196
    new-instance v3, Ljava/lang/String;

    .end local v3    # "payCode":Ljava/lang/String;
    sget v4, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvPayCodeOffset:I

    const/16 v5, 0xa

    invoke-direct {v3, p1, v4, v5}, Ljava/lang/String;-><init>([BII)V

    .line 199
    .restart local v3    # "payCode":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, v3}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->getPurchaseItemQueue(Ljava/lang/String;)Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;

    move-result-object v2

    .line 200
    .local v2, "pItem":Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    if-eqz v2, :cond_1

    .line 201
    iget-object v4, v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->payCode:Ljava/lang/String;

    iget-object v5, v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->itemName:Ljava/lang/String;

    invoke-static {v1, v4, v5}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestPurchase(ILjava/lang/String;Ljava/lang/String;)V

    move v4, v6

    .line 208
    .end local v0    # "ackCode":I
    .end local v1    # "buySeq":I
    .end local v2    # "pItem":Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    .end local v3    # "payCode":Ljava/lang/String;
    :goto_1
    return v4

    .line 198
    .restart local v0    # "ackCode":I
    .restart local v1    # "buySeq":I
    .restart local v3    # "payCode":Ljava/lang/String;
    :cond_0
    sget-object v3, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCode:Ljava/lang/String;

    goto :goto_0

    .line 208
    .end local v0    # "ackCode":I
    .end local v1    # "buySeq":I
    .end local v3    # "payCode":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private checkOutputPurchaseSequence([B)V
    .locals 3
    .param p1, "sendPacket"    # [B

    .prologue
    .line 176
    sget-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isUseServerPayCode:Z

    if-nez v0, :cond_0

    .line 177
    sget-short v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendCmd:S

    invoke-direct {p0, v0}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isPurchaseSequence(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    new-instance v0, Ljava/lang/String;

    sget v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCodeOffset:I

    const/16 v2, 0xa

    invoke-direct {v0, p1, v1, v2}, Ljava/lang/String;-><init>([BII)V

    sput-object v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCode:Ljava/lang/String;

    .line 181
    :cond_0
    return-void
.end method

.method private getPurchaseItemQueue(Ljava/lang/String;)Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    .locals 3
    .param p1, "payCode"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-object v2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseItemQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 240
    iget-object v2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseItemQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_2

    .line 247
    .end local v0    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;>;"
    :cond_1
    const/4 v2, 0x0

    :goto_0
    return-object v2

    .line 241
    .restart local v0    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;>;"
    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;

    .line 242
    .local v1, "pItem":Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    iget-object v2, v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;->payCode:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v2, v1

    .line 243
    goto :goto_0
.end method

.method private static getTCPData([B)[B
    .locals 4
    .param p0, "msg"    # [B

    .prologue
    const/4 v3, 0x0

    .line 457
    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->outputStream:Ljava/io/DataOutputStream;

    if-nez v1, :cond_0

    .line 458
    new-instance v1, Ljava/io/DataOutputStream;

    sget-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->socketConnection:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    sput-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->outputStream:Ljava/io/DataOutputStream;

    .line 459
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "[NexusSemiNetwork][DEBUG] outputStream Create!!!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 462
    :cond_0
    sget-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->outputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v1, p0}, Ljava/io/DataOutputStream;->write([B)V

    .line 463
    sget-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->outputStream:Ljava/io/DataOutputStream;

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 465
    const/4 v1, 0x1

    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doSendPacket:Z

    .line 466
    const/4 v1, 0x0

    sput-boolean v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doRecvPacket:Z

    .line 468
    sget-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->inputStream:Ljava/io/DataInputStream;

    if-nez v1, :cond_1

    .line 469
    new-instance v1, Ljava/io/DataInputStream;

    sget-object v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->socketConnection:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    sput-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->inputStream:Ljava/io/DataInputStream;

    .line 470
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "[NexusSemiNetwork][DEBUG] inputStream Create!!!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 473
    :cond_1
    sget-object v1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->inputStream:Ljava/io/DataInputStream;

    invoke-static {v1}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->readTCPInput(Ljava/io/DataInputStream;)[B
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    .line 485
    :goto_0
    return-object v1

    .line 476
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 477
    .local v0, "e":Ljava/net/SocketTimeoutException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "[NexusSemiNetwork][DEBUG] getTCPData Socket Time Out!!!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 478
    invoke-virtual {v0}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    move-object v1, v3

    .line 479
    goto :goto_0

    .line 480
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    :catch_1
    move-exception v1

    move-object v0, v1

    .line 481
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v1, v3

    .line 482
    goto :goto_0

    .line 483
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    move-object v0, v1

    .line 484
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v1, v3

    .line 485
    goto :goto_0
.end method

.method private isPurchaseSequence(I)Z
    .locals 3
    .param p1, "seqNum"    # I

    .prologue
    .line 149
    iget-object v2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseSequenceQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 150
    iget-object v2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseSequenceQueue:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/Integer;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_2

    .line 158
    .end local v0    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/Integer;>;"
    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 151
    .restart local v0    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/Integer;>;"
    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 152
    .local v1, "obj":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne p1, v2, :cond_0

    .line 153
    const/4 v2, 0x1

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
    const/4 v2, 0x4

    .line 352
    new-array v1, v2, [B

    .line 354
    .local v1, "header":[B
    const/4 v2, 0x0

    const/4 v3, 0x4

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Ljava/io/DataInputStream;->read([BII)I

    .line 355
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->byte2short([BI)S

    move-result v2

    sput-short v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    .line 356
    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->byte2short([BI)S

    move-result v2

    sput-short v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvCmd:S
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    sget-short v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    :goto_0
    return v2

    .line 357
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 358
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 359
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private static readTCPInput(Ljava/io/DataInputStream;)[B
    .locals 13
    .param p0, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 380
    const/4 v4, 0x1

    .line 381
    .local v4, "readFirst":Z
    const/4 v3, 0x0

    .line 382
    .local v3, "isEnd":Z
    const/4 v6, 0x0

    :try_start_0
    check-cast v6, [B

    .line 383
    .local v6, "result":[B
    const/4 v1, -0x1

    .line 384
    .local v1, "datalen":I
    const/4 v0, 0x0

    .line 389
    .local v0, "blockIdx":I
    invoke-virtual {p0}, Ljava/io/DataInputStream;->available()I

    move-result v1

    .line 395
    if-gtz v1, :cond_0

    .line 397
    const/4 v8, 0x0

    new-array v8, v8, [B

    invoke-virtual {p0, v8}, Ljava/io/DataInputStream;->read([B)I

    .line 398
    const-wide/16 v8, 0x1f4

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    move-object v8, v12

    .line 447
    .end local v0    # "blockIdx":I
    .end local v1    # "datalen":I
    .end local v6    # "result":[B
    :goto_0
    return-object v8

    .line 403
    .restart local v0    # "blockIdx":I
    .restart local v1    # "datalen":I
    .restart local v6    # "result":[B
    :cond_0
    invoke-static {p0}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->parseHeader(Ljava/io/DataInputStream;)S

    move-result v1

    .line 405
    if-eqz v4, :cond_3

    .line 406
    if-gez v1, :cond_1

    move-object v8, v12

    .line 407
    goto :goto_0

    .line 408
    :cond_1
    if-nez v1, :cond_2

    .line 409
    const/4 v8, 0x0

    new-array v8, v8, [B

    goto :goto_0

    .line 412
    :cond_2
    new-array v6, v1, [B

    .line 413
    const/4 v4, 0x0

    .line 416
    :cond_3
    sget-short v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    invoke-static {v8}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->short2byte(S)[B

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x2

    invoke-static {v8, v9, v6, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 417
    sget-short v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvCmd:S

    invoke-static {v8}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->short2byte(S)[B

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x2

    invoke-static {v8, v9, v6, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 419
    const/4 v8, 0x4

    sput-short v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    .line 421
    :goto_1
    if-eqz v3, :cond_4

    .line 439
    const/4 v8, 0x1

    sput-boolean v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doRecvPacket:Z

    move-object v8, v6

    .line 440
    goto :goto_0

    .line 423
    :cond_4
    mul-int/lit16 v8, v0, 0x400

    add-int/lit8 v7, v8, 0x4

    .line 424
    .local v7, "startIdx":I
    const/16 v5, 0x400

    .line 426
    .local v5, "readSize":I
    add-int v8, v7, v5

    if-lt v8, v1, :cond_5

    .line 427
    sub-int v5, v1, v7

    .line 428
    const/4 v3, 0x1

    .line 433
    :goto_2
    sget-short v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    add-int/2addr v8, v5

    int-to-short v8, v8

    sput-short v8, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvLength:S

    .line 434
    invoke-virtual {p0, v6, v7, v5}, Ljava/io/DataInputStream;->read([BII)I

    .line 435
    invoke-static {}, Ljava/lang/Thread;->yield()V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 441
    .end local v0    # "blockIdx":I
    .end local v1    # "datalen":I
    .end local v5    # "readSize":I
    .end local v6    # "result":[B
    .end local v7    # "startIdx":I
    :catch_0
    move-exception v8

    move-object v2, v8

    .line 443
    .local v2, "e":Ljava/net/SocketTimeoutException;
    invoke-virtual {v2}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    move-object v8, v12

    .line 444
    goto :goto_0

    .line 430
    .end local v2    # "e":Ljava/net/SocketTimeoutException;
    .restart local v0    # "blockIdx":I
    .restart local v1    # "datalen":I
    .restart local v5    # "readSize":I
    .restart local v6    # "result":[B
    .restart local v7    # "startIdx":I
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 445
    .end local v0    # "blockIdx":I
    .end local v1    # "datalen":I
    .end local v5    # "readSize":I
    .end local v6    # "result":[B
    .end local v7    # "startIdx":I
    :catch_1
    move-exception v8

    move-object v2, v8

    .line 446
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v8, v12

    .line 447
    goto :goto_0
.end method

.method private static requestPurchase(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "itemBuySeq"    # I
    .param p1, "itemPaycode"    # Ljava/lang/String;
    .param p2, "itemName"    # Ljava/lang/String;

    .prologue
    .line 533
    const/4 v0, 0x1

    sput-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isRequestPurchase:Z

    .line 553
    return-void
.end method

.method private static sendTCPRequest([B)[B
    .locals 5
    .param p0, "sendData"    # [B

    .prologue
    const/4 v4, 0x0

    .line 500
    move-object v0, v4

    check-cast v0, [B

    move-object v1, v0

    .line 501
    .local v1, "array":[B
    move-object v0, v4

    check-cast v0, [B

    move-object v3, v0

    .line 503
    .local v3, "msg":[B
    move-object v3, p0

    .line 506
    :try_start_0
    invoke-static {}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->openTCPConnection()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 520
    :goto_0
    return-object v1

    .line 513
    :catch_0
    move-exception v2

    .line 514
    .local v2, "e":Ljava/lang/Exception;
    sget-byte v4, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->errorCounter:B

    add-int/lit8 v4, v4, 0x1

    int-to-byte v4, v4

    sput-byte v4, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->errorCounter:B

    .line 515
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public doSendTCP([B)V
    .locals 1
    .param p1, "send"    # [B

    .prologue
    .line 257
    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 258
    return-void
.end method

.method public getResponse()[B
    .locals 5

    .prologue
    .line 268
    const/4 v1, 0x0

    check-cast v1, [B

    .line 270
    .local v1, "barray":[B
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 271
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    move-result-object v2

    .line 272
    .local v2, "obj":Ljava/lang/Object;
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/Vector;->removeElementAt(I)V

    .line 273
    instance-of v3, v2, [B

    if-eqz v3, :cond_0

    move-object v0, v2

    check-cast v0, [B

    move-object v1, v0

    .line 276
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_0
    return-object v1
.end method

.method public initPurchaseItemQueue([I[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "arrSeq"    # [I
    .param p2, "arrCode"    # [Ljava/lang/String;
    .param p3, "arrName"    # [Ljava/lang/String;

    .prologue
    .line 218
    array-length v1, p1

    .line 219
    .local v1, "itemNum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 223
    return-void

    .line 220
    :cond_0
    new-instance v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;

    aget v3, p1, v0

    aget-object v4, p2, v0

    aget-object v5, p3, v0

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;-><init>(Lcom/gamevil/nexus2/net/NexusSemiNetwork;ILjava/lang/String;Ljava/lang/String;)V

    .line 221
    .local v2, "pItem":Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseItemQueue:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public initPurchaseItemQueue([Ljava/lang/String;[Ljava/lang/String;)V
    .locals 5
    .param p1, "arrCode"    # [Ljava/lang/String;
    .param p2, "arrName"    # [Ljava/lang/String;

    .prologue
    .line 226
    array-length v1, p1

    .line 227
    .local v1, "itemNum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 231
    return-void

    .line 228
    :cond_0
    new-instance v2, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;

    aget-object v3, p1, v0

    aget-object v4, p2, v0

    invoke-direct {v2, p0, v3, v4}, Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;-><init>(Lcom/gamevil/nexus2/net/NexusSemiNetwork;Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .local v2, "pItem":Lcom/gamevil/nexus2/net/NexusSemiNetwork$cPurchaseItem;
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseItemQueue:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public initPurchaseSequenceQueue([I)V
    .locals 4
    .param p1, "arrSeq"    # [I

    .prologue
    .line 142
    array-length v1, p1

    .line 143
    .local v1, "sequenceNum":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 146
    return-void

    .line 144
    :cond_0
    iget-object v2, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->purchaseSequenceQueue:Ljava/util/Vector;

    aget v3, p1, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 143
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public isBusy()Z
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

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

.method public isNotRecvYet()Z
    .locals 1

    .prologue
    .line 295
    sget-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doSendPacket:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->doRecvPacket:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRequestPurchase()Z
    .locals 1

    .prologue
    .line 250
    sget-boolean v0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isRequestPurchase:Z

    return v0
.end method

.method public run()V
    .locals 5

    .prologue
    .line 303
    const/4 v2, 0x0

    :try_start_0
    check-cast v2, [B

    .line 304
    .local v2, "send":[B
    const/4 v0, 0x0

    check-cast v0, [B

    .line 306
    .local v0, "data":[B
    :cond_0
    :goto_0
    sget-boolean v3, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isRunning:Z

    if-nez v3, :cond_2

    .line 345
    .end local v0    # "data":[B
    .end local v2    # "send":[B
    :cond_1
    :goto_1
    return-void

    .line 307
    .restart local v0    # "data":[B
    .restart local v2    # "send":[B
    :cond_2
    const/4 v2, 0x0

    check-cast v2, [B

    .line 309
    sget-boolean v3, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isRunning:Z

    if-eqz v3, :cond_1

    .line 313
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestQueue:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 314
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestQueue:Ljava/util/Vector;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "send":[B
    check-cast v2, [B

    .line 315
    .restart local v2    # "send":[B
    invoke-static {v2}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendTCPRequest([B)[B

    move-result-object v0

    .line 316
    invoke-direct {p0, v2}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->checkOutputPurchaseSequence([B)V

    .line 317
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->requestQueue:Ljava/util/Vector;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/Vector;->removeElementAt(I)V

    .line 318
    if-eqz v0, :cond_0

    .line 319
    invoke-direct {p0, v0}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->checkInputPurchaseSequence([B)Z

    .line 320
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 323
    :cond_3
    invoke-virtual {p0}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isNotRecvYet()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v3

    if-eqz v3, :cond_0

    .line 329
    :try_start_1
    sget-object v3, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->inputStream:Ljava/io/DataInputStream;

    invoke-static {v3}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->readTCPInput(Ljava/io/DataInputStream;)[B

    move-result-object v0

    .line 331
    if-eqz v0, :cond_0

    .line 332
    invoke-direct {p0, v0}, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->checkInputPurchaseSequence([B)Z

    .line 333
    iget-object v3, p0, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->result:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 334
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 336
    .local v1, "e":Ljava/net/SocketTimeoutException;
    :try_start_2
    invoke-virtual {v1}, Ljava/net/SocketTimeoutException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 342
    .end local v0    # "data":[B
    .end local v1    # "e":Ljava/net/SocketTimeoutException;
    .end local v2    # "send":[B
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 343
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 337
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "data":[B
    .restart local v2    # "send":[B
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 338
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method public setPayCodeOffsetInPacket(II)V
    .locals 0
    .param p1, "sendOffset"    # I
    .param p2, "recvOffset"    # I

    .prologue
    .line 167
    sput p1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->sendPayCodeOffset:I

    .line 168
    sput p2, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->recvPayCodeOffset:I

    .line 169
    return-void
.end method

.method public setUseServerPayCode(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 251
    sput-boolean p1, Lcom/gamevil/nexus2/net/NexusSemiNetwork;->isUseServerPayCode:Z

    return-void
.end method
