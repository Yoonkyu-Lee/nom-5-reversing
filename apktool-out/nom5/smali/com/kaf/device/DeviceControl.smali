.class public Lcom/kaf/device/DeviceControl;
.super Ljava/lang/Object;
.source "DeviceControl.java"


# instance fields
.field private dc:Lcom/kaf/device/IDeviceControl;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getDeviceControl()Lcom/kaf/device/IDeviceControl;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 35
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getBatteryStatus()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 108
    const-string v2, "KAF Library is not loaded."

    .line 107
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    if-nez v0, :cond_1

    .line 110
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 111
    const-string v2, "Object is null"

    .line 110
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    invoke-virtual {v0}, Lcom/kaf/device/IDeviceControl;->getBatteryStatus()I

    move-result v0

    return v0
.end method

.method public getExternalStorageVolumes()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 89
    const-string v2, "KAF Library is not loaded."

    .line 88
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    if-nez v0, :cond_1

    .line 91
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 92
    const-string v2, "Object is null"

    .line 91
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    invoke-virtual {v0}, Lcom/kaf/device/IDeviceControl;->getExternalStorageVolumes()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMountedVolumeCount()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 70
    const-string v2, "KAF Library is not loaded."

    .line 69
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    if-nez v0, :cond_1

    .line 72
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 73
    const-string v2, "Object is null"

    .line 72
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    invoke-virtual {v0}, Lcom/kaf/device/IDeviceControl;->getMountedVolumeCount()I

    move-result v0

    return v0
.end method

.method public vibrate([JI)Z
    .locals 3
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
    .line 48
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 50
    const-string v2, "KAF Library is not loaded."

    .line 49
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    if-nez v0, :cond_1

    .line 53
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 54
    const-string v2, "Object is null"

    .line 53
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/kaf/device/DeviceControl;->dc:Lcom/kaf/device/IDeviceControl;

    invoke-virtual {v0, p1, p2}, Lcom/kaf/device/IDeviceControl;->vibrate([JI)Z

    move-result v0

    return v0
.end method
