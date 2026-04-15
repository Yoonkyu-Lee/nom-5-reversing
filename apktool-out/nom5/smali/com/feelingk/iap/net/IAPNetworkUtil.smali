.class public Lcom/feelingk/iap/net/IAPNetworkUtil;
.super Ljava/lang/Object;
.source "IAPNetworkUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IAPNet"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static iapMakePacketHeader(Ljava/lang/String;I)[B
    .locals 7
    .param p0, "packet_type"    # Ljava/lang/String;
    .param p1, "datalen"    # I

    .prologue
    const/16 v4, 0xc

    const/4 v6, 0x2

    const/4 v5, 0x0

    .line 11
    new-array v0, v4, [B

    .line 13
    .local v0, "buf":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v4, :cond_0

    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 18
    .local v3, "type":[B
    invoke-static {v3, v5, v0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 22
    .local v1, "data_len":[B
    array-length v4, v1

    invoke-static {v1, v5, v0, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    return-object v0

    .line 14
    .end local v1    # "data_len":[B
    .end local v3    # "type":[B
    :cond_0
    aput-byte v5, v0, v2

    .line 13
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static packetDebug([BI)V
    .locals 0
    .param p0, "packetBytes"    # [B
    .param p1, "length"    # I

    .prologue
    .line 58
    return-void
.end method
