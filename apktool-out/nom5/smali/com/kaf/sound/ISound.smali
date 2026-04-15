.class public abstract Lcom/kaf/sound/ISound;
.super Ljava/lang/Object;
.source "ISound.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setBeepSound(II)Z
    .locals 1
    .param p1, "frequency"    # I
    .param p2, "duration"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 7
    const/4 v0, 0x0

    return v0
.end method
