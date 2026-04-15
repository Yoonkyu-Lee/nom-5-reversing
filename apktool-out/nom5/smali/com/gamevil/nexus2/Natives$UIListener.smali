.class public interface abstract Lcom/gamevil/nexus2/Natives$UIListener;
.super Ljava/lang/Object;
.source "Natives.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/Natives;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UIListener"
.end annotation


# virtual methods
.method public abstract OnEvent(I)V
.end method

.method public abstract OnSoundPlay(IIZ)V
.end method

.method public abstract OnStopSound()V
.end method

.method public abstract OnUIStatusChange(I)V
.end method

.method public abstract OnVibrate(I)V
.end method
