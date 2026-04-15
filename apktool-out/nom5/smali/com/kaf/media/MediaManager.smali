.class public Lcom/kaf/media/MediaManager;
.super Ljava/lang/Object;
.source "MediaManager.java"


# instance fields
.field private mm:Lcom/kaf/media/IMediaManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    .line 17
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getMediaManager()Lcom/kaf/media/IMediaManager;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    :goto_0
    return-void

    .line 19
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 20
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getAbleAODFormats()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 95
    const-string v2, "KAF Library is not loaded."

    .line 94
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 98
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 99
    const-string v2, "Object is null"

    .line 98
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0}, Lcom/kaf/media/IMediaManager;->getAbleAODFormats()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAbleImageFormats()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 33
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 35
    const-string v2, "KAF Library is not loaded."

    .line 34
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 38
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 39
    const-string v2, "Object is null"

    .line 38
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0}, Lcom/kaf/media/IMediaManager;->getAbleImageFormats()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAbleSoundFormats()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 55
    const-string v2, "KAF Library is not loaded."

    .line 54
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 58
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 59
    const-string v2, "Object is null"

    .line 58
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0}, Lcom/kaf/media/IMediaManager;->getAbleSoundFormats()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAbleVODFormats()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 75
    const-string v2, "KAF Library is not loaded."

    .line 74
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 78
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 79
    const-string v2, "Object is null"

    .line 78
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0}, Lcom/kaf/media/IMediaManager;->getAbleVODFormats()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVODServices()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 149
    const-string v2, "KAF Library is not loaded."

    .line 148
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 152
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 153
    const-string v2, "Object is null"

    .line 152
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0}, Lcom/kaf/media/IMediaManager;->getVODServices()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVideoInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 120
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 121
    const-string v2, "KAF Library is not loaded."

    .line 120
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 125
    const-string v2, "Object is null"

    .line 124
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/kaf/media/MediaManager;->mm:Lcom/kaf/media/IMediaManager;

    invoke-virtual {v0, p1}, Lcom/kaf/media/IMediaManager;->getVideoInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
