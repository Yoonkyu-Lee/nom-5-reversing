.class public Lcom/kaf/sound/Sound;
.super Ljava/lang/Object;
.source "Sound.java"


# instance fields
.field private sound:Lcom/kaf/sound/ISound;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/sound/Sound;->sound:Lcom/kaf/sound/ISound;

    .line 17
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getSound()Lcom/kaf/sound/ISound;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/sound/Sound;->sound:Lcom/kaf/sound/ISound;
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
.method public setBeepSound(II)Z
    .locals 3
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
    .line 42
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 44
    const-string v2, "KAF Library is not loaded."

    .line 43
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/kaf/sound/Sound;->sound:Lcom/kaf/sound/ISound;

    if-nez v0, :cond_1

    .line 47
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 48
    const-string v2, "Object is null"

    .line 47
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_1
    iget-object v0, p0, Lcom/kaf/sound/Sound;->sound:Lcom/kaf/sound/ISound;

    invoke-virtual {v0, p1, p2}, Lcom/kaf/sound/ISound;->setBeepSound(II)Z

    move-result v0

    return v0
.end method
