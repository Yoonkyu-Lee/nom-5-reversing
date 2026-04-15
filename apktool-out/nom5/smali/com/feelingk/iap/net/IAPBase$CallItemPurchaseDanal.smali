.class Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;
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
    name = "CallItemPurchaseDanal"
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
.field private bUseTcash:Z

.field private pBPInfo:Ljava/lang/String;

.field private pCarrier:I

.field private pEncJumin:Ljava/lang/String;

.field private pID:Ljava/lang/String;

.field private pMdn:Ljava/lang/String;

.field private pName:Ljava/lang/String;

.field private pTID:Ljava/lang/String;

.field final synthetic this$0:Lcom/feelingk/iap/net/IAPBase;


# direct methods
.method public constructor <init>(Lcom/feelingk/iap/net/IAPBase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2
    .param p2, "mdn"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "carrier"    # I
    .param p6, "tid"    # Ljava/lang/String;
    .param p7, "bpInfo"    # Ljava/lang/String;
    .param p8, "TCash"    # Z
    .param p9, "encJumin"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 472
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    .line 460
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 450
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pMdn:Ljava/lang/String;

    .line 451
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pID:Ljava/lang/String;

    .line 452
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pName:Ljava/lang/String;

    .line 453
    const/4 v0, -0x1

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pCarrier:I

    .line 454
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pTID:Ljava/lang/String;

    .line 455
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pBPInfo:Ljava/lang/String;

    .line 456
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->bUseTcash:Z

    .line 457
    iput-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pEncJumin:Ljava/lang/String;

    .line 464
    iput-object p2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pMdn:Ljava/lang/String;

    .line 465
    iput-object p3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pID:Ljava/lang/String;

    .line 466
    iput-object p4, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pName:Ljava/lang/String;

    .line 467
    iput p5, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pCarrier:I

    .line 468
    iput-object p6, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pTID:Ljava/lang/String;

    .line 469
    iput-object p7, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pBPInfo:Ljava/lang/String;

    .line 470
    iput-boolean p8, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->bUseTcash:Z

    .line 471
    iput-object p9, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pEncJumin:Ljava/lang/String;

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
    const/4 v9, 0x0

    .line 476
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pID:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 477
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 499
    :goto_0
    return-object v0

    .line 479
    :cond_0
    iget-object v8, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pMdn:Ljava/lang/String;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pID:Ljava/lang/String;

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pName:Ljava/lang/String;

    iget v3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pCarrier:I

    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pTID:Ljava/lang/String;

    iget-object v5, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pBPInfo:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->bUseTcash:Z

    iget-object v7, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->pEncJumin:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/feelingk/iap/net/IAPNet;->iapSendItemPurchaseByDanal(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lcom/feelingk/iap/net/MsgConfirm;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/feelingk/iap/net/IAPBase;->access$0(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)V

    .line 480
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 482
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v1}, Lcom/feelingk/iap/net/IAPBase;->access$1(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/MsgConfirm;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/net/IAPBase;->access$2(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 484
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xb

    if-eq v0, v1, :cond_1

    .line 485
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xc

    if-eq v0, v1, :cond_1

    .line 486
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xd

    if-ne v0, v1, :cond_2

    .line 488
    :cond_1
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iput v9, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 489
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d9

    const-string v2, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 494
    :goto_1
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 492
    :cond_2
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d3

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v2, v2, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    goto :goto_1

    .line 497
    :cond_3
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    sget-object v1, Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;->APP_CHARGE_ITEM_OK:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    iput-object v1, v0, Lcom/feelingk/iap/net/IAPBase;->mNetworkState:Lcom/feelingk/iap/net/IAPBase$NETWORK_RESULT_TYPE;

    .line 498
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x452

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v2}, Lcom/feelingk/iap/net/IAPBase;->access$1(Lcom/feelingk/iap/net/IAPBase;)Lcom/feelingk/iap/net/MsgConfirm;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 499
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
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
    invoke-virtual {p0}, Lcom/feelingk/iap/net/IAPBase$CallItemPurchaseDanal;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
