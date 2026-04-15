.class Lcom/feelingk/iap/IAPActivity$2;
.super Ljava/lang/Object;
.source "IAPActivity.java"

# interfaces
.implements Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;


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
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 405
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/feelingk/iap/IAPActivity$2;)Lcom/feelingk/iap/IAPActivity;
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    return-object v0
.end method


# virtual methods
.method public onAuthDialogCancelButtonClick()V
    .locals 3

    .prologue
    .line 467
    const/16 v1, 0x64

    invoke-static {v1}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 468
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v1}, Lcom/feelingk/iap/IAPActivity;->access$9(Lcom/feelingk/iap/IAPActivity;)V

    .line 471
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/feelingk/iap/IAPActivity;->access$15(Lcom/feelingk/iap/IAPActivity;I)V

    .line 472
    iget-object v1, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v1}, Lcom/feelingk/iap/IAPActivity;->access$16(Lcom/feelingk/iap/IAPActivity;)Lcom/feelingk/iap/IAPLibSetting;

    move-result-object v1

    iget-object v0, v1, Lcom/feelingk/iap/IAPLibSetting;->ClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    .line 473
    .local v0, "onAppCallbackFn":Lcom/feelingk/iap/IAPLib$OnClientListener;
    invoke-interface {v0}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onJuminNumberDlgCancel()V

    .line 474
    return-void
.end method

.method public onAuthDialogOKButtonClick(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "juminText1"    # Ljava/lang/String;
    .param p2, "juminText2"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 409
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, "JuminNumber":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Lcom/feelingk/iap/encryption/CryptoManager;->encrypt(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 420
    .local v4, "tmpJuminNumber":Ljava/lang/String;
    :goto_0
    if-eqz v4, :cond_0

    .line 422
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getNetHandler()Landroid/os/Handler;

    move-result-object v2

    .line 423
    .local v2, "hnd":Landroid/os/Handler;
    const/16 v5, 0x456

    invoke-virtual {v2, v5, v7, v7, v4}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 424
    .local v3, "msgNET":Landroid/os/Message;
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    .line 427
    .end local v2    # "hnd":Landroid/os/Handler;
    .end local v3    # "msgNET":Landroid/os/Message;
    :cond_0
    const/16 v5, 0x64

    invoke-static {v5}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 428
    iget-object v5, p0, Lcom/feelingk/iap/IAPActivity$2;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v5}, Lcom/feelingk/iap/IAPActivity;->access$9(Lcom/feelingk/iap/IAPActivity;)V

    .line 430
    if-eqz v4, :cond_1

    .line 431
    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    new-instance v6, Lcom/feelingk/iap/IAPActivity$2$1;

    invoke-direct {v6, p0}, Lcom/feelingk/iap/IAPActivity$2$1;-><init>(Lcom/feelingk/iap/IAPActivity$2;)V

    .line 458
    const-wide/16 v7, 0x12c

    .line 431
    invoke-virtual {v5, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 462
    :cond_1
    return-void

    .line 415
    .end local v4    # "tmpJuminNumber":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 416
    .local v1, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .line 417
    .restart local v4    # "tmpJuminNumber":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
