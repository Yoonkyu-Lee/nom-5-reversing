.class Lcom/feelingk/iap/IAPLib$1;
.super Landroid/os/Handler;
.source "IAPLib.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/IAPLib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 228
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v11, 0x7d3

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 231
    const-string v6, "IAPLib"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "[NET-Handler] Network Message Receive Msg.what = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/feelingk/iap/util/CommonF$LOGGER;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_0

    .line 369
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 371
    const/4 v4, 0x0

    .line 372
    .local v4, "msgUI":Landroid/os/Message;
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v6, :cond_0

    .line 373
    const-string v6, "\uc815\uc758\ub418\uc9c0 \uc54a\ub294  \uc5d0\ub7ec\uc785\ub2c8\ub2e4."

    iput-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 377
    :cond_0
    iget v6, p1, Landroid/os/Message;->what:I

    if-ne v6, v11, :cond_1

    iget v6, p1, Landroid/os/Message;->arg1:I

    const/16 v7, 0xf

    if-ne v6, v7, :cond_1

    .line 380
    const/4 v6, 0x0

    invoke-static {v6}, Lcom/feelingk/iap/IAPLib;->updateEncJuminNumber(Ljava/lang/String;)V

    .line 383
    :cond_1
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 384
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    iget v7, p1, Landroid/os/Message;->what:I

    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6, v7, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 385
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 387
    :cond_2
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 388
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    iget v7, p1, Landroid/os/Message;->what:I

    iget v8, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v6, v7, v8}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onError(II)V

    .line 392
    .end local v4    # "msgUI":Landroid/os/Message;
    :cond_3
    :goto_0
    return-void

    .line 238
    :pswitch_0
    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v6, v9, :cond_4

    move v6, v9

    :goto_1
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    sput-object v6, Lcom/feelingk/iap/IAPLib;->mUseTCash:Ljava/lang/Boolean;

    .line 239
    iget v6, p1, Landroid/os/Message;->arg2:I

    if-ne v6, v9, :cond_5

    move v6, v9

    :goto_2
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    sput-object v6, Lcom/feelingk/iap/IAPLib;->mUseBPProtol:Ljava/lang/Boolean;

    .line 240
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->sendItemQuery()V

    goto :goto_0

    :cond_4
    move v6, v10

    .line 238
    goto :goto_1

    :cond_5
    move v6, v10

    .line 239
    goto :goto_2

    .line 247
    :pswitch_1
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->sendItemQuery()V

    goto :goto_0

    .line 252
    :pswitch_2
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 253
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    invoke-interface {v6}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onItemQueryComplete()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 254
    sget v6, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    if-ne v6, v9, :cond_6

    .line 255
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mUseTCash:Ljava/lang/Boolean;

    invoke-static {v6}, Lcom/feelingk/iap/IAPLib;->sendItemPurchse(Ljava/lang/Boolean;)V

    goto :goto_0

    .line 257
    :cond_6
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mMdn:Ljava/lang/String;

    sget v7, Lcom/feelingk/iap/IAPLib;->mKorTelecom:I

    sget-object v8, Lcom/feelingk/iap/IAPLib;->mUseTCash:Ljava/lang/Boolean;

    sget-object v9, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    invoke-static {v6, v7, v8, v9}, Lcom/feelingk/iap/IAPLib;->sendItemPurchseByDanal(Ljava/lang/String;ILjava/lang/Boolean;Ljava/lang/String;)V

    goto :goto_0

    .line 260
    :cond_7
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 261
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    const-string v7, "\uacfc\uae08 \uc624\ub958"

    invoke-virtual {v6, v11, v7}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 262
    .local v3, "messageUI":Landroid/os/Message;
    invoke-virtual {v3}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 271
    .end local v3    # "messageUI":Landroid/os/Message;
    :pswitch_3
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 278
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 279
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v6, :cond_3

    .line 280
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    const/16 v7, 0x452

    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6, v7, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 281
    .restart local v4    # "msgUI":Landroid/os/Message;
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 293
    .end local v4    # "msgUI":Landroid/os/Message;
    :pswitch_4
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 294
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    invoke-interface {v6}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onItemPurchaseComplete()V

    goto/16 :goto_0

    .line 301
    :pswitch_5
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    sput-object v6, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    .line 302
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    sget-object v7, Lcom/feelingk/iap/IAPLib;->mEncJuminNumber:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/feelingk/iap/net/IAPBase;->setBaseEncodeJuminNumber(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 307
    :pswitch_6
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 309
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 310
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->access$0()Landroid/os/Handler;

    move-result-object v6

    const/16 v7, 0x450

    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6, v7, v8}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    .line 311
    .restart local v4    # "msgUI":Landroid/os/Message;
    invoke-virtual {v4}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 317
    .end local v4    # "msgUI":Landroid/os/Message;
    :pswitch_7
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    goto/16 :goto_0

    .line 322
    :pswitch_8
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 325
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v6}, Lcom/feelingk/iap/net/IAPBase;->getItemWholeAuthConfirmMessage()Lcom/feelingk/iap/net/ItemWholeAuthConfirm;

    move-result-object v5

    .line 327
    .local v5, "whole":Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 328
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    invoke-virtual {v5}, Lcom/feelingk/iap/net/ItemWholeAuthConfirm;->getItems()[Lcom/feelingk/iap/net/ItemAuth;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onWholeQuery([Lcom/feelingk/iap/net/ItemAuth;)V

    goto/16 :goto_0

    .line 334
    .end local v5    # "whole":Lcom/feelingk/iap/net/ItemWholeAuthConfirm;
    :pswitch_9
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 337
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v6}, Lcom/feelingk/iap/net/IAPBase;->getItemUseConfirmMessage()Lcom/feelingk/iap/net/ItemUseConfirm;

    move-result-object v2

    .line 338
    .local v2, "itemUse":Lcom/feelingk/iap/net/ItemUseConfirm;
    new-instance v1, Lcom/feelingk/iap/net/ItemUse;

    invoke-direct {v1}, Lcom/feelingk/iap/net/ItemUse;-><init>()V

    .line 340
    .local v1, "item":Lcom/feelingk/iap/net/ItemUse;
    invoke-virtual {v2}, Lcom/feelingk/iap/net/ItemUseConfirm;->getItemID()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/feelingk/iap/net/ItemUse;->pId:Ljava/lang/String;

    .line 341
    invoke-virtual {v2}, Lcom/feelingk/iap/net/ItemUseConfirm;->getItemName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Lcom/feelingk/iap/net/ItemUse;->pName:Ljava/lang/String;

    .line 342
    invoke-virtual {v2}, Lcom/feelingk/iap/net/ItemUseConfirm;->getCount()I

    move-result v6

    iput v6, v1, Lcom/feelingk/iap/net/ItemUse;->pCount:I

    .line 344
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 345
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    invoke-interface {v6, v1}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onItemUseQuery(Lcom/feelingk/iap/net/ItemUse;)V

    goto/16 :goto_0

    .line 351
    .end local v1    # "item":Lcom/feelingk/iap/net/ItemUse;
    .end local v2    # "itemUse":Lcom/feelingk/iap/net/ItemUseConfirm;
    :pswitch_a
    invoke-static {}, Lcom/feelingk/iap/IAPLib;->close()V

    .line 354
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mBase:Lcom/feelingk/iap/net/IAPBase;

    invoke-virtual {v6}, Lcom/feelingk/iap/net/IAPBase;->getInitConfirmMessage()Lcom/feelingk/iap/net/InitConfirm;

    move-result-object v0

    .line 356
    .local v0, "init":Lcom/feelingk/iap/net/InitConfirm;
    new-instance v1, Lcom/feelingk/iap/net/ItemAuthInfo;

    invoke-direct {v1}, Lcom/feelingk/iap/net/ItemAuthInfo;-><init>()V

    .line 358
    .local v1, "item":Lcom/feelingk/iap/net/ItemAuthInfo;
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getCount()I

    move-result v6

    iput v6, v1, Lcom/feelingk/iap/net/ItemAuthInfo;->pCount:I

    .line 359
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getExpireDate()[B

    move-result-object v6

    iput-object v6, v1, Lcom/feelingk/iap/net/ItemAuthInfo;->pExpireDate:[B

    .line 360
    invoke-virtual {v0}, Lcom/feelingk/iap/net/InitConfirm;->getToken()[B

    move-result-object v6

    iput-object v6, v1, Lcom/feelingk/iap/net/ItemAuthInfo;->pToken:[B

    .line 362
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    if-eqz v6, :cond_3

    .line 363
    sget-object v6, Lcom/feelingk/iap/IAPLib;->mClientListener:Lcom/feelingk/iap/IAPLib$OnClientListener;

    invoke-interface {v6, v1}, Lcom/feelingk/iap/IAPLib$OnClientListener;->onItemAuthInfo(Lcom/feelingk/iap/net/ItemAuthInfo;)V

    goto/16 :goto_0

    .line 233
    :pswitch_data_0
    .packed-switch 0x44c
        :pswitch_0
        :pswitch_1
        :pswitch_7
        :pswitch_4
        :pswitch_6
        :pswitch_2
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_5
    .end packed-switch
.end method
