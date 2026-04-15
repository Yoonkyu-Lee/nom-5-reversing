.class public interface abstract Lcom/lgt/arm/ArmInterface;
.super Ljava/lang/Object;
.source "ArmInterface.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lgt/arm/ArmInterface$Stub;
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
