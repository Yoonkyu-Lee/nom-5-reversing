.class public Lcom/feelingk/iap/net/InitConfirm;
.super Lcom/feelingk/iap/net/MsgConfirm;
.source "InitConfirm.java"


# static fields
.field static final TAG:Ljava/lang/String; = "InitConfirm"


# instance fields
.field private ExpireDate:[B

.field private eToken:[B

.field private nCount:I

.field private nTokenLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Lcom/feelingk/iap/net/MsgConfirm;-><init>()V

    .line 17
    iput v0, p0, Lcom/feelingk/iap/net/InitConfirm;->nCount:I

    .line 19
    iput v0, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    .line 12
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/feelingk/iap/net/InitConfirm;->nCount:I

    return v0
.end method

.method public getExpireDate()[B
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/feelingk/iap/net/InitConfirm;->ExpireDate:[B

    return-object v0
.end method

.method public getToken()[B
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/feelingk/iap/net/InitConfirm;->eToken:[B

    return-object v0
.end method

.method public getTokenLength()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    return v0
.end method

.method protected parse([B)V
    .locals 6
    .param p1, "v"    # [B

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/MsgConfirm;->parse([B)V

    .line 28
    invoke-virtual {p0}, Lcom/feelingk/iap/net/InitConfirm;->getMsgLength()I

    move-result v3

    add-int/lit8 v1, v3, 0xe

    .line 31
    .local v1, "offset":I
    :try_start_0
    const-string v3, "InitConfirm"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "InitConfirm result code : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/feelingk/iap/net/InitConfirm;->getResultCode()B

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .local v2, "offset":I
    :try_start_1
    aget-byte v3, p1, v1

    iput v3, p0, Lcom/feelingk/iap/net/InitConfirm;->nCount:I

    .line 35
    const/16 v3, 0xe

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/feelingk/iap/net/InitConfirm;->ExpireDate:[B

    .line 36
    iget-object v3, p0, Lcom/feelingk/iap/net/InitConfirm;->ExpireDate:[B

    const/4 v4, 0x0

    const/16 v5, 0xe

    invoke-static {p1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    add-int/lit8 v1, v2, 0xe

    .line 39
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    aget-byte v3, p1, v1

    iput v3, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    .line 41
    iget v3, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    const/4 v4, 0x4

    if-le v3, v4, :cond_0

    .line 42
    iget v3, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/feelingk/iap/net/InitConfirm;->eToken:[B

    .line 43
    iget-object v3, p0, Lcom/feelingk/iap/net/InitConfirm;->eToken:[B

    const/4 v4, 0x0

    iget v5, p0, Lcom/feelingk/iap/net/InitConfirm;->nTokenLength:I

    invoke-static {p1, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_0
    move v1, v2

    .line 50
    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    const/16 v3, -0xa

    invoke-virtual {p0, v3}, Lcom/feelingk/iap/net/InitConfirm;->setResultCode(B)V

    goto :goto_0

    .line 46
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "offset":I
    .restart local v2    # "offset":I
    :catch_1
    move-exception v3

    move-object v0, v3

    move v1, v2

    .end local v2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_1
.end method
