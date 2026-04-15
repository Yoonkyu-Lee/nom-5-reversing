.class public interface abstract Lcom/kaf/app/IAppManager$ServiceConnectionListener;
.super Ljava/lang/Object;
.source "IAppManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kaf/app/IAppManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ServiceConnectionListener"
.end annotation


# virtual methods
.method public abstract onServiceConnected(Ljava/lang/String;)V
.end method

.method public abstract onServiceDisconnected()V
.end method
