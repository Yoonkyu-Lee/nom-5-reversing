.class Lcom/feelingk/iap/IAPActivity$3;
.super Ljava/lang/Object;
.source "IAPActivity.java"

# interfaces
.implements Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/IAPActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/feelingk/iap/IAPActivity;


# direct methods
.method constructor <init>(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPurchaseButtonClick()V
    .locals 9

    .prologue
    const/16 v8, 0x44c

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 522
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$22(Lcom/feelingk/iap/IAPActivity;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 523
    .local v2, "msgUI":Landroid/os/Message;
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$22(Lcom/feelingk/iap/IAPActivity;)Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 525
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$23(Lcom/feelingk/iap/IAPActivity;)I

    move-result v3

    if-ne v3, v6, :cond_2

    .line 527
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 528
    .local v0, "hnd":Landroid/os/Handler;
    const/4 v1, 0x0

    .line 529
    .local v1, "msgNET":Landroid/os/Message;
    const-string v3, "IAPActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "# Purchase SK!!  mUseTCash ="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v5}, Lcom/feelingk/iap/IAPActivity;->access$24(Lcom/feelingk/iap/IAPActivity;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " / BPProtocol = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v5}, Lcom/feelingk/iap/IAPActivity;->access$20(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$24(Lcom/feelingk/iap/IAPActivity;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v6

    :goto_0
    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v4}, Lcom/feelingk/iap/IAPActivity;->access$20(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v6

    :goto_1
    invoke-virtual {v0, v8, v3, v4}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    .line 531
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 544
    :goto_2
    return-void

    :cond_0
    move v3, v7

    .line 530
    goto :goto_0

    :cond_1
    move v4, v7

    goto :goto_1

    .line 535
    .end local v0    # "hnd":Landroid/os/Handler;
    .end local v1    # "msgNET":Landroid/os/Message;
    :cond_2
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 540
    .restart local v0    # "hnd":Landroid/os/Handler;
    const-string v3, "IAPActivity"

    const-string v4, "# Purchase KT_LG!!  "

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 541
    const/16 v3, 0x44d

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 542
    .restart local v1    # "msgNET":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_2
.end method

.method public onPurchaseCancelButtonClick()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 504
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 505
    .local v0, "hnd":Landroid/os/Handler;
    const/16 v3, 0x44e

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 506
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 508
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$2(Lcom/feelingk/iap/IAPActivity;)V

    .line 510
    const/16 v3, 0x64

    invoke-static {v3}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 511
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/feelingk/iap/IAPActivity;->access$21(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    invoke-static {v3, v5}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    .line 512
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3, v6}, Lcom/feelingk/iap/IAPActivity;->access$17(Lcom/feelingk/iap/IAPActivity;Z)V

    .line 515
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$16(Lcom/feelingk/iap/IAPActivity;)Lcom/feelingk/iap/IAPLibSetting;

    move-result-object v3

    iget-object v2, v3, Lcom/feelingk/iap/IAPLibSetting;->ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 516
    .local v2, "onAppCallbackFn":Lcom/feelingk/iap/IAPLib$OnClientListener;
    invoke-interface {v2}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onDlgPurchaseCancel()V

    .line 517
    return-void
.end method

.method public onUseTCashCheckChanged(Z)V
    .locals 3
    .param p1, "isChecked"    # Z

    .prologue
    const/4 v1, 0x0

    .line 483
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v0, p1}, Lcom/feelingk/iap/IAPActivity;->access$17(Lcom/feelingk/iap/IAPActivity;Z)V

    .line 486
    if-eqz p1, :cond_0

    .line 489
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    .line 498
    :goto_0
    const-string v0, "IAPActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "PopupCheck!!  UseTCash ="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / BPProtocol = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v2}, Lcom/feelingk/iap/IAPActivity;->access$20(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    return-void

    .line 492
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v0}, Lcom/feelingk/iap/IAPActivity;->access$19(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 493
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    goto :goto_0

    .line 495
    :cond_1
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$3;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    goto :goto_0
.end method
