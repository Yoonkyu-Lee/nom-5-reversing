.class public Lcom/gamevil/nexus2/ui/NexusSound;
.super Ljava/lang/Object;
.source "NexusSound.java"


# static fields
.field public static final MAX_VOLUME:I = 0x50

.field private static isSoundON:Z

.field private static isVibrationON:Z

.field private static mBGMResIDMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static mBgmPlayer:Landroid/media/MediaPlayer;

.field private static mContext:Landroid/content/Context;

.field private static mPlayer:Landroid/media/MediaPlayer;

.field private static mSfxSoundPool:Landroid/media/SoundPool;

.field private static mSfxStreamID:I

.field private static mSoundPoolMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static mVolume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    sput-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isVibrationON:Z

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Vibrator(I)V
    .locals 3
    .param p0, "_time"    # I

    .prologue
    .line 281
    sget-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isVibrationON:Z

    if-eqz v0, :cond_0

    .line 283
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    int-to-long v1, p0

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 285
    :cond_0
    return-void
.end method

.method public static addSFXSound(II)V
    .locals 5
    .param p0, "_index"    # I
    .param p1, "_soundID"    # I

    .prologue
    .line 95
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 96
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    sget-object v3, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, p1, v4}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_0
    return-void
.end method

.method public static getVolume()F
    .locals 1

    .prologue
    .line 266
    sget v0, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    return v0
.end method

.method public static initSounds(Landroid/content/Context;I)V
    .locals 3
    .param p0, "_theContext"    # Landroid/content/Context;
    .param p1, "_maxMultiStream"    # I

    .prologue
    .line 84
    sput-object p0, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    .line 86
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->releaseAll()V

    .line 87
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Landroid/media/SoundPool;-><init>(III)V

    sput-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBGMResIDMap:Ljava/util/HashMap;

    .line 90
    const/high16 v0, 0x42a00000    # 80.0f

    sput v0, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    .line 91
    return-void
.end method

.method public static isBGMPlaying()Z
    .locals 1

    .prologue
    .line 217
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 218
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public static isPlaying()Z
    .locals 1

    .prologue
    .line 210
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 211
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    goto :goto_0
.end method

.method public static isSoundON()Z
    .locals 1

    .prologue
    .line 276
    sget-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    return v0
.end method

.method public static playSFXSound(I)V
    .locals 7
    .param p0, "_index"    # I

    .prologue
    .line 105
    sget-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    if-eqz v0, :cond_0

    .line 107
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 110
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "_index":I
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v3, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    sput v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxStreamID:I

    .line 113
    :cond_0
    return-void
.end method

.method public static playSound(IIZ)V
    .locals 9
    .param p0, "_offSet"    # I
    .param p1, "_index"    # I
    .param p2, "isLoop"    # Z

    .prologue
    .line 161
    add-int v8, p0, p1

    .line 162
    .local v8, "rawIndex":I
    sget-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    if-eqz v0, :cond_0

    .line 164
    if-eqz p2, :cond_1

    .line 167
    :try_start_0
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 168
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    invoke-static {v0, v8}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    sput-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    .line 169
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 171
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 172
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    sget v1, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 173
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local p0    # "_offSet":I
    :cond_0
    :goto_0
    return-void

    .line 175
    .restart local p0    # "_offSet":I
    :catch_0
    move-exception v0

    move-object v7, v0

    .line 176
    .local v7, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 177
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 183
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 186
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0    # "_offSet":I
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v3, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    sput v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxStreamID:I

    goto :goto_0

    .line 191
    .restart local p0    # "_offSet":I
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSound()V

    .line 192
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    invoke-static {v0, v8}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    sput-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    .line 193
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 195
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 196
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    sget v1, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 197
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 199
    :catch_1
    move-exception v0

    move-object v7, v0

    .line 200
    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSound()V

    .line 201
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static playSound(IZ)V
    .locals 4
    .param p0, "_index"    # I
    .param p1, "isLoop"    # Z

    .prologue
    .line 121
    sget-boolean v1, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    if-eqz v1, :cond_0

    .line 123
    if-eqz p1, :cond_1

    .line 126
    :try_start_0
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 127
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    invoke-static {v1, p0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    .line 128
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 130
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 131
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v3, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 132
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 134
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 136
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 142
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSound()V

    .line 143
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mContext:Landroid/content/Context;

    invoke-static {v1, p0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    .line 144
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 146
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 147
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    sget v2, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    sget v3, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 148
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 150
    :catch_1
    move-exception v1

    move-object v0, v1

    .line 151
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSound()V

    .line 152
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static releaseAll()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 51
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 52
    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    .line 55
    :cond_0
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 57
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 58
    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mSoundPoolMap:Ljava/util/HashMap;

    .line 61
    :cond_1
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBGMResIDMap:Ljava/util/HashMap;

    if-eqz v0, :cond_2

    .line 63
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBGMResIDMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 64
    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBGMResIDMap:Ljava/util/HashMap;

    .line 67
    :cond_2
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_3

    .line 69
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 70
    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    .line 73
    :cond_3
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_4

    .line 75
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 76
    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    .line 78
    :cond_4
    return-void
.end method

.method public static setIsVibtationON(Z)V
    .locals 0
    .param p0, "_isON"    # Z

    .prologue
    .line 289
    sput-boolean p0, Lcom/gamevil/nexus2/ui/NexusSound;->isVibrationON:Z

    .line 290
    return-void
.end method

.method public static setSoundON(Z)V
    .locals 0
    .param p0, "_isON"    # Z

    .prologue
    .line 271
    sput-boolean p0, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    .line 272
    return-void
.end method

.method public static setVolume(I)V
    .locals 2
    .param p0, "_vol"    # I

    .prologue
    .line 258
    if-lez p0, :cond_1

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/gamevil/nexus2/ui/NexusSound;->isSoundON:Z

    .line 259
    if-gez p0, :cond_0

    const/4 p0, 0x0

    .line 260
    :cond_0
    int-to-float v0, p0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    sput v0, Lcom/gamevil/nexus2/ui/NexusSound;->mVolume:F

    .line 261
    return-void

    .line 258
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static stopAllSound()V
    .locals 0

    .prologue
    .line 251
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSfxSound()V

    .line 252
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 253
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopSound()V

    .line 254
    return-void
.end method

.method public static declared-synchronized stopBGMSound()V
    .locals 2

    .prologue
    .line 231
    const-class v0, Lcom/gamevil/nexus2/ui/NexusSound;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 233
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 234
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 235
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mBgmPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    :cond_0
    monitor-exit v0

    return-void

    .line 231
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static stopSfxSound()V
    .locals 2

    .prologue
    .line 223
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 225
    sget-object v0, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxSoundPool:Landroid/media/SoundPool;

    sget v1, Lcom/gamevil/nexus2/ui/NexusSound;->mSfxStreamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 227
    :cond_0
    return-void
.end method

.method public static declared-synchronized stopSound()V
    .locals 2

    .prologue
    .line 241
    const-class v0, Lcom/gamevil/nexus2/ui/NexusSound;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 243
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 244
    sget-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 245
    const/4 v1, 0x0

    sput-object v1, Lcom/gamevil/nexus2/ui/NexusSound;->mPlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    :cond_0
    monitor-exit v0

    return-void

    .line 241
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
