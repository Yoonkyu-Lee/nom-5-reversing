.class Lcom/feelingk/iap/IAPActivity$1;
.super Landroid/os/Handler;
.source "IAPActivity.java"


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
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 302
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 11
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v10, 0x69

    const/16 v9, 0x68

    const/16 v8, 0x67

    const/16 v7, 0x65

    const/16 v6, 0x64

    .line 305
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->getDialogType()I

    move-result v1

    .line 307
    .local v1, "dlgType":I
    const-string v3, "IAPActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "[GUI-Handler] mGUIMessageHandler msg.what= "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 376
    const-string v3, "IAPActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "[GUI Handler] OnError "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    if-eq v1, v6, :cond_0

    .line 380
    invoke-static {v6}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 381
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$0(Lcom/feelingk/iap/IAPActivity;)V

    .line 382
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$2(Lcom/feelingk/iap/IAPActivity;)V

    .line 385
    :cond_0
    iget v3, p1, Landroid/os/Message;->what:I

    const/16 v4, 0x7d4

    if-lt v3, v4, :cond_2

    iget v3, p1, Landroid/os/Message;->what:I

    const/16 v4, 0x7d7

    if-gt v3, v4, :cond_2

    .line 397
    :cond_1
    :goto_0
    return-void

    .line 313
    :sswitch_0
    const/16 v3, 0x66

    if-ne v1, v3, :cond_1

    .line 314
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$0(Lcom/feelingk/iap/IAPActivity;)V

    .line 316
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/feelingk/iap/IAPActivity;->access$1(Lcom/feelingk/iap/IAPActivity;Ljava/lang/Object;)V

    .line 317
    invoke-static {v8}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    goto :goto_0

    .line 325
    :sswitch_1
    if-ne v1, v8, :cond_1

    .line 326
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$2(Lcom/feelingk/iap/IAPActivity;)V

    .line 328
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$3(Lcom/feelingk/iap/IAPActivity;)V

    .line 329
    invoke-static {v9}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    goto :goto_0

    .line 337
    :sswitch_2
    if-ne v1, v9, :cond_1

    .line 338
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$0(Lcom/feelingk/iap/IAPActivity;)V

    .line 351
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/feelingk/iap/net/MsgConfirm;

    .line 354
    .local v0, "confirm":Lcom/feelingk/iap/net/MsgConfirm;
    :try_start_0
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    new-instance v4, Ljava/lang/String;

    invoke-virtual {v0}, Lcom/feelingk/iap/net/MsgConfirm;->getMsg()[B

    move-result-object v5

    const-string v6, "MS949"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v3, v4}, Lcom/feelingk/iap/IAPActivity;->access$4(Lcom/feelingk/iap/IAPActivity;Ljava/lang/String;)V

    .line 355
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v3}, Lcom/feelingk/iap/IAPActivity;->access$5(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/IAPActivity;->access$4(Lcom/feelingk/iap/IAPActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    :goto_1
    invoke-static {v10}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 362
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v4}, Lcom/feelingk/iap/IAPActivity;->access$5(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v10, v4}, Lcom/feelingk/iap/IAPActivity;->access$6(Lcom/feelingk/iap/IAPActivity;ILjava/lang/String;)V

    goto :goto_0

    .line 357
    :catch_0
    move-exception v3

    move-object v2, v3

    .line 358
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 390
    .end local v0    # "confirm":Lcom/feelingk/iap/net/MsgConfirm;
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_2
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/feelingk/iap/IAPActivity;->access$7(Lcom/feelingk/iap/IAPActivity;Ljava/lang/String;)V

    .line 391
    invoke-static {v7}, Lcom/feelingk/iap/IAPLib;->setDialogType(I)V

    .line 392
    iget-object v3, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    iget-object v4, p0, Lcom/feelingk/iap/IAPActivity$1;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v4}, Lcom/feelingk/iap/IAPActivity;->access$8(Lcom/feelingk/iap/IAPActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v7, v4}, Lcom/feelingk/iap/IAPActivity;->access$6(Lcom/feelingk/iap/IAPActivity;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 308
    :sswitch_data_0
    .sparse-switch
        0x44c -> :sswitch_1
        0x450 -> :sswitch_0
        0x452 -> :sswitch_2
    .end sparse-switch
.end method
