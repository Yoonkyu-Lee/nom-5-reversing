.class public abstract Lcom/kaf/device/IDeviceControl;
.super Ljava/lang/Object;
.source "IDeviceControl.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method


# virtual methods
.method public getBatteryStatus()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 19
    const/4 v0, -0x1

    return v0
.end method

.method public getExternalStorageVolumes()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 16
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMountedVolumeCount()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 13
    const/4 v0, -0x1

    return v0
.end method

.method public vibrate([JI)Z
    .locals 1
    .param p1, "pattern"    # [J
    .param p2, "strength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 10
    const/4 v0, 0x0

    return v0
.end method
