.class public Lcom/feelingk/iap/net/DataPacket;
.super Lcom/feelingk/iap/net/Confirm;
.source "DataPacket.java"


# instance fields
.field private data:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/feelingk/iap/net/Confirm;-><init>()V

    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/feelingk/iap/net/DataPacket;->data:[B

    return-object v0
.end method

.method protected parse([B)V
    .locals 4
    .param p1, "v"    # [B

    .prologue
    const/16 v3, 0xc

    .line 23
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/Confirm;->parse([B)V

    .line 25
    array-length v1, p1

    sub-int v0, v1, v3

    .line 26
    .local v0, "len":I
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/feelingk/iap/net/DataPacket;->data:[B

    .line 27
    iget-object v1, p0, Lcom/feelingk/iap/net/DataPacket;->data:[B

    const/4 v2, 0x0

    invoke-static {p1, v3, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    return-void
.end method

.method public setHeader([B)V
    .locals 0
    .param p1, "v"    # [B

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/Confirm;->parse([B)V

    .line 32
    return-void
.end method
