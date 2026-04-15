.class public interface abstract Lcom/kaf/contentsbox/ICertificateRepositoryManager$ServiceConnectionListener;
.super Ljava/lang/Object;
.source "ICertificateRepositoryManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kaf/contentsbox/ICertificateRepositoryManager;
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
