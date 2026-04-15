.class public interface abstract Lcom/feelingk/iap/IAPLib$OnClientListener;
.super Ljava/lang/Object;
.source "IAPLib.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/IAPLib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnClientListener"
.end annotation


# virtual methods
.method public abstract onDlgError()V
.end method

.method public abstract onDlgPurchaseCancel()V
.end method

.method public abstract onError(II)V
.end method

.method public abstract onItemAuthInfo(Lcom/feelingk/iap/net/ItemAuthInfo;)V
.end method

.method public abstract onItemPurchaseComplete()V
.end method

.method public abstract onItemQueryComplete()Ljava/lang/Boolean;
.end method

.method public abstract onItemUseQuery(Lcom/feelingk/iap/net/ItemUse;)V
.end method

.method public abstract onJuminNumberDlgCancel()V
.end method

.method public abstract onWholeQuery([Lcom/feelingk/iap/net/ItemAuth;)V
.end method
