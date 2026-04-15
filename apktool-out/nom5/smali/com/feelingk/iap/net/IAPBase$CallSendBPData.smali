.class Lcom/feelingk/iap/net/IAPBase$CallSendBPData;
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
    name = "CallSendBPData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<[B>;"
    }
.end annotation


# instance fields
.field private mData:[B

.field private mTelecom:I

.field final synthetic this$0:Lcom/feelingk/iap/net/IAPBase;


# direct methods
.method public constructor <init>(Lcom/feelingk/iap/net/IAPBase;[BI)V
    .locals 1
    .param p2, "data"    # [B
    .param p3, "telecom"    # I

    .prologue
    .line 681
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    .line 678
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 672
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mData:[B

    .line 673
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mTelecom:I

    .line 679
    iput-object p2, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mData:[B

    .line 680
    iput p3, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mTelecom:I

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->call()[B

    move-result-object v0

    return-object v0
.end method

.method public call()[B
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 684
    const/4 v11, 0x0

    .line 686
    .local v11, "init":Lcom/feelingk/iap/net/InitConfirm;
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v0, v0, Lcom/feelingk/iap/net/IAPBase;->mContext:Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/net/ConnectivityManager;

    .line 687
    .local v10, "connectivityManager":Landroid/net/ConnectivityManager;
    const/4 v0, 0x0

    invoke-virtual {v10, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v12

    .line 688
    .local v12, "mobile":Landroid/net/NetworkInfo;
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v14

    .line 691
    .local v14, "wifi":Landroid/net/NetworkInfo;
    invoke-virtual {v14}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 692
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    .line 704
    :goto_0
    const-string v0, "IAPBase"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CallSendBPData Start!!  WifiEnable = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-boolean v2, v2, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 705
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-boolean v0, v0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    if-eqz v0, :cond_2

    .line 707
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->setWifi(Z)V

    .line 708
    new-instance v0, Lcom/feelingk/iap/net/ServerInfo;

    const-string v1, "iap.tstore.co.kr"

    const/16 v2, 0x1d56

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/ServerInfo;-><init>(Ljava/lang/String;I)V

    .line 709
    iget v1, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mTelecom:I

    .line 710
    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v2, v2, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    .line 711
    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v3, v3, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 712
    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v4, v4, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    .line 713
    iget-object v5, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v5, v5, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 714
    const/4 v6, 0x0

    .line 715
    const/4 v7, 0x0

    .line 716
    const/4 v8, 0x0

    .line 717
    const/4 v9, 0x1

    .line 708
    invoke-static/range {v0 .. v9}, Lcom/feelingk/iap/net/IAPNet;->iapConnect(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v11

    .line 731
    :goto_1
    if-nez v11, :cond_3

    .line 732
    const/4 v0, 0x0

    .line 759
    :goto_2
    return-object v0

    .line 694
    :cond_0
    invoke-virtual {v12}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 695
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    goto :goto_0

    .line 698
    :cond_1
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/4 v1, -0x1

    iput v1, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 699
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d0

    const-string v2, "\ub124\ud2b8\uc6cc\ud06c\uac00 \uc5f0\uacb0\ub418\uc5b4 \uc788\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4."

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 700
    const/4 v0, 0x0

    goto :goto_2

    .line 721
    :cond_2
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->setWifi(Z)V

    .line 722
    new-instance v0, Lcom/feelingk/iap/net/ServerInfo;

    const-string v1, "iap.tstore.co.kr"

    const/16 v2, 0x1dba

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/net/ServerInfo;-><init>(Ljava/lang/String;I)V

    .line 723
    iget v1, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mTelecom:I

    .line 724
    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v2, v2, Lcom/feelingk/iap/net/IAPBase;->APPLICATION_ID:Ljava/lang/String;

    .line 725
    iget-object v3, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v3, v3, Lcom/feelingk/iap/net/IAPBase;->MDN:Ljava/lang/String;

    .line 726
    iget-object v4, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v4, v4, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_IP:Ljava/lang/String;

    .line 727
    iget-object v5, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v5, v5, Lcom/feelingk/iap/net/IAPBase;->BP_SERVER_PORT:I

    .line 722
    invoke-static/range {v0 .. v5}, Lcom/feelingk/iap/net/IAPNet;->iapConnectBP(Lcom/feelingk/iap/net/ServerInfo;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v11

    goto :goto_1

    .line 734
    :cond_3
    const/4 v13, 0x0

    check-cast v13, [B

    .line 735
    .local v13, "returnData":[B
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-boolean v0, v0, Lcom/feelingk/iap/net/IAPBase;->isWifi:Z

    if-nez v0, :cond_7

    .line 737
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    invoke-static {v0, v11}, Lcom/feelingk/iap/net/IAPBase;->access$2(Lcom/feelingk/iap/net/IAPBase;Lcom/feelingk/iap/net/MsgConfirm;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 738
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xb

    if-eq v0, v1, :cond_4

    .line 739
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xc

    if-eq v0, v1, :cond_4

    .line 740
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v0, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    const/16 v1, -0xd

    if-ne v0, v1, :cond_5

    .line 743
    :cond_4
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/4 v1, 0x0

    iput v1, v0, Lcom/feelingk/iap/net/IAPBase;->subErrorCode:I

    .line 744
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d8

    const-string v2, "\ub124\ud2b8\uc6cc\ud06c \uc5f0\uacb0\uc744 \ud655\uc778 \ud574\uc8fc\uc2dc\uae30 \ubc14\ub78d\ub2c8\ub2e4."

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 749
    :goto_3
    const/4 v0, 0x0

    goto :goto_2

    .line 747
    :cond_5
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x7d0

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget-object v2, v2, Lcom/feelingk/iap/net/IAPBase;->errMsg:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    goto :goto_3

    .line 752
    :cond_6
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mData:[B

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapSendDataBP([B)[B

    move-result-object v13

    .line 753
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapCloseBP(Z)I

    :goto_4
    move-object v0, v13

    .line 759
    goto/16 :goto_2

    .line 756
    :cond_7
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallSendBPData;->mData:[B

    invoke-static {v0}, Lcom/feelingk/iap/net/IAPNet;->iapSendData([B)[B

    move-result-object v13

    goto :goto_4
.end method
