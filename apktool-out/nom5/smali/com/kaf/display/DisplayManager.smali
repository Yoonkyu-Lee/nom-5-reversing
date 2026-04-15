.class public Lcom/kaf/display/DisplayManager;
.super Ljava/lang/Object;
.source "DisplayManager.java"


# instance fields
.field private dm:Lcom/kaf/display/IDisplayManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    .line 18
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getDisplayManager()Lcom/kaf/display/IDisplayManager;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    :goto_0
    return-void

    .line 20
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 21
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getMainLCDColorDepth()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 76
    const-string v2, "KAF Library is not loaded."

    .line 75
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 79
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 80
    const-string v2, "Object is null"

    .line 79
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getMainLCDColorDepth()I

    move-result v0

    return v0
.end method

.method public getMainLCDHeight()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 56
    const-string v2, "KAF Library is not loaded."

    .line 55
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 59
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 60
    const-string v2, "Object is null"

    .line 59
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getMainLCDHeight()I

    move-result v0

    return v0
.end method

.method public getMainLCDWidth()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 35
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 36
    const-string v2, "KAF Library is not loaded."

    .line 35
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 39
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 40
    const-string v2, "Object is null"

    .line 39
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getMainLCDWidth()I

    move-result v0

    return v0
.end method

.method public getSubLCDColorDepth()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 139
    const-string v2, "KAF Library is not loaded."

    .line 138
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 142
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 143
    const-string v2, "Object is null"

    .line 142
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getSubLCDColorDepth()I

    move-result v0

    return v0
.end method

.method public getSubLCDHeight()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 117
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 118
    const-string v2, "KAF Library is not loaded."

    .line 117
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 121
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 122
    const-string v2, "Object is null"

    .line 121
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getSubLCDHeight()I

    move-result v0

    return v0
.end method

.method public getSubLCDWidth()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 97
    const-string v2, "KAF Library is not loaded."

    .line 96
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 100
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 101
    const-string v2, "Object is null"

    .line 100
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->getSubLCDWidth()I

    move-result v0

    return v0
.end method

.method public isSupportTouch()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 159
    const-string v2, "KAF Library is not loaded."

    .line 158
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    if-nez v0, :cond_1

    .line 162
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 163
    const-string v2, "Object is null"

    .line 162
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_1
    iget-object v0, p0, Lcom/kaf/display/DisplayManager;->dm:Lcom/kaf/display/IDisplayManager;

    invoke-virtual {v0}, Lcom/kaf/display/IDisplayManager;->isSupportTouch()Z

    move-result v0

    return v0
.end method
