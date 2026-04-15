.class public Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
.super Lcom/feelingk/iap/net/MsgConfirm;
.source "ItemWholeAuthConfirm.java"


# instance fields
.field private itemAuthCount:I

.field private items:[Lcom/feelingk/iap/net/ItemAuth;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->itemAuthCount:I

    .line 13
    return-void
.end method


# virtual methods
.method public getItemAuthCount()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->itemAuthCount:I

    return v0
.end method

.method public getItems()[Lcom/feelingk/iap/net/ItemAuth;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    return-object v0
.end method

.method protected parse([B)V
    .locals 11
    .param p1, "v"    # [B

    .prologue
    const/16 v10, 0x1e

    const/16 v9, 0xa

    const/4 v8, 0x0

    .line 27
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    .line 29
    invoke-virtual {p0}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->getMsgLength()I

    move-result v5

    add-int/lit8 v4, v5, 0xe

    .line 31
    .local v4, "offset":I
    aget-byte v5, p1, v4

    iput v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->itemAuthCount:I

    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 34
    iget v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->itemAuthCount:I

    new-array v5, v5, [Lcom/feelingk/iap/net/ItemAuth;

    iput-object v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    .line 36
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->itemAuthCount:I

    if-lt v3, v5, :cond_0

    .line 57
    return-void

    .line 38
    :cond_0
    iget-object v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    new-instance v6, Lcom/feelingk/iap/net/ItemAuth;

    invoke-direct {v6}, Lcom/feelingk/iap/net/ItemAuth;-><init>()V

    aput-object v6, v5, v3

    .line 40
    new-array v0, v9, [B

    .line 41
    .local v0, "_tempID":[B
    invoke-static {p1, v4, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    iget-object v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    aget-object v5, v5, v3

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    iput-object v6, v5, Lcom/feelingk/iap/net/ItemAuth;->pId:Ljava/lang/String;

    .line 43
    add-int/lit8 v4, v4, 0xa

    .line 45
    new-array v1, v10, [B

    .line 46
    .local v1, "_tempName":[B
    invoke-static {p1, v4, v1, v8, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    add-int/lit8 v4, v4, 0x1e

    .line 50
    :try_start_0
    iget-object v5, p0, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->items:[Lcom/feelingk/iap/net/ItemAuth;

    aget-object v5, v5, v3

    new-instance v6, Ljava/lang/String;

    const-string v7, "MS949"

    invoke-direct {v6, v1, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/feelingk/iap/net/ItemAuth;->pName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 52
    :catch_0
    move-exception v5

    move-object v2, v5

    .line 53
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1
.end method
