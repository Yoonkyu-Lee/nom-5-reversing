.class Lcom/feelingk/iap/IAPActivity$6;
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
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$6;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 586
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 590
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v0

    .line 591
    .local v0, "hnd":Landroid/os/Handler;
    const/16 v2, 0x44f

    invoke-virtual {v0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 592
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 594
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity$6;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$6;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/IAPActivity;->access$21(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    invoke-static {v2, v4}, Lcom/feelingk/iap/IAPActivity;->access$18(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Boolean;)V

    .line 595
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity$6;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v2, v5}, Lcom/feelingk/iap/IAPActivity;->access$17(Lcom/feelingk/iap/IAPActivity;Z)V

    .line 597
    iget-object v2, p0, Lcom/feelingk/iap/IAPActivity$6;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v2}, Lcom/feelingk/iap/IAPActivity;->access$25(Lcom/feelingk/iap/IAPActivity;)V

    .line 598
    const/16 v2, 0x64

    invoke-static {v2}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 599
    return-void
.end method
