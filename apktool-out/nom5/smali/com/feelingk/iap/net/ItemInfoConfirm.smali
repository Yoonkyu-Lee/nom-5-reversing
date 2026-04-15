.class public Lcom/feelingk/iap/net/ItemInfoConfirm;
.super Lcom/feelingk/iap/net/MsgConfirm;
.source "ItemInfoConfirm.java"


# instance fields
.field private mItemPrice:Ljava/lang/String;

.field private mItemTitle:Ljava/lang/String;

.field private mPeriod:Ljava/lang/String;

.field private mTCash:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemPeriod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mPeriod:Ljava/lang/String;

    return-object v0
.end method

.method public getItemPrice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mItemPrice:Ljava/lang/String;

    return-object v0
.end method

.method public getItemTCash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mTCash:Ljava/lang/String;

    return-object v0
.end method

.method public getItemTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mItemTitle:Ljava/lang/String;

    return-object v0
.end method

.method protected parse([B)V
    .locals 5
    .param p1, "v"    # [B

    .prologue
    .line 23
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    .line 25
    invoke-virtual {p0}, Lcom/feelingk/iap/net/ItemInfoConfirm;->getMsgLength()I

    move-result v3

    add-int/lit8 v2, v3, 0xe

    .line 28
    .local v2, "offset":I
    const/16 v3, 0x1e

    :try_start_0
    new-array v0, v3, [B

    .line 29
    .local v0, "_byte":[B
    const/4 v3, 0x0

    const/16 v4, 0x1e

    invoke-static {p1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    new-instance v3, Ljava/lang/String;

    const-string v4, "MS949"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mItemTitle:Ljava/lang/String;

    .line 31
    add-int/lit8 v2, v2, 0x1e

    .line 33
    const/16 v3, 0xa

    new-array v0, v3, [B

    .line 34
    const/4 v3, 0x0

    const/16 v4, 0xa

    invoke-static {p1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    new-instance v3, Ljava/lang/String;

    const-string v4, "MS949"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mItemPrice:Ljava/lang/String;

    .line 36
    add-int/lit8 v2, v2, 0xa

    .line 38
    const/16 v3, 0xa

    new-array v0, v3, [B

    .line 39
    const/4 v3, 0x0

    const/16 v4, 0xa

    invoke-static {p1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    new-instance v3, Ljava/lang/String;

    const-string v4, "MS949"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mPeriod:Ljava/lang/String;

    .line 41
    add-int/lit8 v2, v2, 0xa

    .line 43
    const/16 v3, 0xa

    new-array v0, v3, [B

    .line 44
    const/4 v3, 0x0

    const/16 v4, 0xa

    invoke-static {p1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 45
    new-instance v3, Ljava/lang/String;

    const-string v4, "MS949"

    invoke-direct {v3, v0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/feelingk/iap/net/ItemInfoConfirm;->mTCash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .end local v0    # "_byte":[B
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 48
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method
