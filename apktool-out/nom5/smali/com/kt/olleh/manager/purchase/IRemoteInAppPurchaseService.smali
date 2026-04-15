.class public interface abstract Lcom/kt/olleh/manager/purchase/IRemoteInAppPurchaseService;
.super Ljava/lang/Object;
.source "IRemoteInAppPurchaseService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/kt/olleh/manager/purchase/IRemoteInAppPurchaseService$Stub;
    }
.end annotation


# virtual methods
.method public abstract cancel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract purchase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
