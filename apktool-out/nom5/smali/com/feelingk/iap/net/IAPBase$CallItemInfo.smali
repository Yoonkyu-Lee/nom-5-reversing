.class Lcom/feelingk/iap/net/IAPBase$CallItemInfo;
.super Ljava/lang/Object;
.source "IAPBase.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/net/IAPBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallItemInfo"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private pBPInfo:Ljava/lang/String;

.field private pID:Ljava/lang/String;

.field private pName:Ljava/lang/String;

.field private pTID:Ljava/lang/String;

.field private pTelecom:I

.field final synthetic this$0:Lcom/feelingk/iap/net/IAPBase;


# direct methods
.method public constructor <init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "telecom"    # I
    .param p3, "productID"    # Ljava/lang/String;
    .param p4, "productName"    # Ljava/lang/String;
    .param p5, "pTID"    # Ljava/lang/String;
    .param p6, "pBPInfo"    # Ljava/lang/String;

    .prologue
    .line 217
    invoke-direct {p0, p1, p3, p4}, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;-><init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    iput p2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTelecom:I

    .line 221
    iput-object p5, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTID:Ljava/lang/String;

    .line 222
    iput-object p6, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pBPInfo:Ljava/lang/String;

    .line 223
    return-void
.end method

.method public constructor <init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p2, "productID"    # Ljava/lang/String;
    .param p3, "productName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 236
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTelecom:I

    .line 210
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pID:Ljava/lang/String;

    .line 211
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pName:Ljava/lang/String;

    .line 212
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTID:Ljava/lang/String;

    .line 213
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pBPInfo:Ljava/lang/String;

    .line 234
    iput-object p2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pID:Ljava/lang/String;

    .line 235
    iput-object p3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v9, 0x7d8

    const/16 v8, -0xb

    const/16 v7, -0xc

    const/16 v6, -0xd

    const/4 v5, 0x0

    .line 240
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pID:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 241
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 287
    :goto_0
    return-object v0

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTelecom:I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lcom/feelingk/iap/net/IAPBase;->connect(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 244
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 247
    :cond_1
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_VALID_USER:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 248
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pID:Ljava/lang/String;

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pName:Ljava/lang/String;

    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pTID:Ljava/lang/String;

    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pBPInfo:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lcom/feelingk/iap/net/IAPNet;->iapSendItemQuery(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/feelingk/iap/net/MsgConfirm;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->access$0(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)V

    .line 249
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 251
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v1}, Lcom/feelingk/iap/net/IAPBase;->access$1(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/MsgConfirm;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->access$2(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 253
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-eq v0, v8, :cond_2

    .line 254
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-eq v0, v7, :cond_2

    .line 255
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-ne v0, v6, :cond_3

    .line 258
    :cond_2
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iput v5, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 259
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const-string v1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-static {v0, v9, v1}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 264
    :goto_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 262
    :cond_3
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d2

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v2, v2, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    goto :goto_1

    .line 267
    :cond_4
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->pID:Ljava/lang/String;

    invoke-static {v1}, Lcom/feelingk/iap/net/IAPNet;->iapSendItemInfoQuery(Ljava/lang/String;)Lcom/feelingk/iap/net/ItemInfoConfirm;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->access$4(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/ItemInfoConfirm;)V

    .line 268
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 270
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v1}, Lcom/feelingk/iap/net/IAPBase;->access$5(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/ItemInfoConfirm;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->access$2(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 272
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-eq v0, v8, :cond_5

    .line 273
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-eq v0, v7, :cond_5

    .line 274
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    if-ne v0, v6, :cond_6

    .line 277
    :cond_5
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iput v5, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 278
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const-string v1, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-static {v0, v9, v1}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 282
    :goto_2
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    .line 281
    :cond_6
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    goto :goto_2

    .line 284
    :cond_7
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_QUERY_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 285
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x450

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v2}, Lcom/feelingk/iap/net/IAPBase;->access$5(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/ItemInfoConfirm;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 287
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/feelingk/iap/net/IAPBase$CallItemInfo;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
