.class public interface abstract Lcom/skt/arm/aidl/IArmService;
.super Ljava/lang/Object;
.source "IArmService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/skt/arm/aidl/IArmService$Stub;
    }
.end annotation


# virtual methods
.method public abstract executeArm(Ljava/lang/String;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
