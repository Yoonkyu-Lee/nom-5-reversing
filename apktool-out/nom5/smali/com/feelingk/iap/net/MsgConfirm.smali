.class public Lcom/feelingk/iap/net/MsgConfirm;
.super Lcom/feelingk/iap/net/Confirm;
.source "MsgConfirm.java"


# instance fields
.field private mMessage:[B

.field private mMessageLength:I

.field private mSWDumpMessage:Ljava/lang/String;

.field private mUserMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0}, Lcom/feelingk/iap/net/Confirm;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessageLength:I

    .line 17
    iput-object v1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mUserMessage:Ljava/lang/String;

    .line 20
    iput-object v1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mSWDumpMessage:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public GetDumpMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/feelingk/iap/net/MsgConfirm;->mSWDumpMessage:Ljava/lang/String;

    return-object v0
.end method

.method public GetUserMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/feelingk/iap/net/MsgConfirm;->mUserMessage:Ljava/lang/String;

    return-object v0
.end method

.method public SetDumpMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mSWDumpMessage:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public SetUserMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mUserMessage:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public getMsg()[B
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessage:[B

    return-object v0
.end method

.method public getMsgLength()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessageLength:I

    return v0
.end method

.method protected parse([B)V
    .locals 5
    .param p1, "v"    # [B

    .prologue
    .line 24
    invoke-super {p0, p1}, Lcom/feelingk/iap/net/Confirm;->parse([B)V

    .line 26
    const/16 v1, 0xd

    aget-byte v1, p1, v1

    iput v1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessageLength:I

    .line 27
    iget v1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessageLength:I

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessage:[B

    .line 31
    const/16 v1, 0xe

    :try_start_0
    iget-object v2, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessage:[B

    const/4 v3, 0x0

    iget v4, p0, Lcom/feelingk/iap/net/MsgConfirm;->mMessageLength:I

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    :goto_0
    return-void

    .line 33
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 34
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "IAPNet"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[MsgConfirm] :"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
