.class Lcom/feelingk/iap/IAPActivity$5;
.super Ljava/lang/Object;
.source "IAPActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 572
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 573
    .local v0, "hnd":Landroid/os/Handler;
    const/16 v3, 0x44e

    invoke-virtual {v0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 574
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 576
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$25(Lcom/feelingk/iap/IAPActivity;)V

    .line 578
    const/16 v3, 0x64

    invoke-static {v3}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 579
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/feelingk/iap/IAPActivity;->access$21(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    invoke-static {v3, v5}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    .line 580
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3, v6}, Lcom/feelingk/iap/IAPActivity;->access$17(Lcom/feelingk/iap/IAPActivity;Z)V

    .line 582
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$5;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$16(Lcom/feelingk/iap/IAPActivity;)Lcom/feelingk/iap/IAPLibSetting;

    move-result-object v3

    iget-object v2, v3, Lcom/feelingk/iap/IAPLibSetting;->ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 583
    .local v2, "onAppCallbackFn":Lcom/feelingk/iap/IAPLib$OnClientListener;
    invoke-interface {v2}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onDlgError()V

    .line 584
    return-void
.end method
