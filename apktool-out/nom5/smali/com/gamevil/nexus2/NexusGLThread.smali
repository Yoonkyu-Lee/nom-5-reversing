.class Lcom/gamevil/nexus2/NexusGLThread;
.super Ljava/lang/Thread;
.source "NexusGLThread.java"

# interfaces
.implements Lcom/gamevil/nexus2/Natives$EventListener;


# static fields
.field private static m_nPeriod:I


# instance fields
.field private mContextLost:Z

.field private mDone:Z

.field private mEglHelper:Lcom/gamevil/nexus2/EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mHasFocus:Z

.field private mHasSurface:Z

.field private mHeight:I

.field private mHolder:Landroid/view/SurfaceHolder;

.field private mPaused:Z

.field private mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

.field private mSizeChanged:Z

.field private mWidth:I

.field private nStartTime:J

.field private final sEglSemaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "renderer"    # Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;
    .param p2, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 33
    iput-boolean v2, p0, Lcom/gamevil/nexus2/NexusGLThread;->mSizeChanged:Z

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 44
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    .line 48
    iput-boolean v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mDone:Z

    .line 49
    iput v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mWidth:I

    .line 50
    iput v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHeight:I

    .line 51
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    .line 52
    iput-object p2, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHolder:Landroid/view/SurfaceHolder;

    .line 53
    const-string v0, "NxGLThread"

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/NexusGLThread;->setName(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public static SetFPS(I)V
    .locals 1
    .param p0, "nFPS"    # I

    .prologue
    .line 65
    if-lez p0, :cond_0

    .line 67
    const/16 v0, 0x3e8

    div-int/2addr v0, p0

    sput v0, Lcom/gamevil/nexus2/NexusGLThread;->m_nPeriod:I

    .line 69
    :cond_0
    return-void
.end method

.method private getEvent()Ljava/lang/Runnable;
    .locals 2

    .prologue
    .line 271
    monitor-enter p0

    .line 272
    :try_start_0
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    monitor-exit p0

    .line 277
    :goto_0
    return-object v0

    .line 271
    :cond_0
    monitor-exit p0

    .line 277
    const/4 v0, 0x0

    goto :goto_0

    .line 271
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private guardedRun()V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v15, Lcom/gamevil/nexus2/EglHelper;

    invoke-direct {v15}, Lcom/gamevil/nexus2/EglHelper;-><init>()V

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    .line 101
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    move-object v15, v0

    invoke-interface {v15}, Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;->getConfigSpec()[I

    move-result-object v4

    .line 102
    .local v4, "configSpec":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    invoke-virtual {v15, v4}, Lcom/gamevil/nexus2/EglHelper;->start([I)V

    .line 104
    const/4 v6, 0x0

    .line 105
    .local v6, "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v13, 0x1

    .line 106
    .local v13, "tellRendererSurfaceCreated":Z
    const/4 v12, 0x1

    .line 112
    .local v12, "tellRendererSurfaceChanged":Z
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mDone:Z

    move v15, v0

    if-eqz v15, :cond_1

    .line 189
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    invoke-virtual {v15}, Lcom/gamevil/nexus2/EglHelper;->finish()V

    .line 190
    return-void

    .line 113
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    move-wide v0, v15

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/gamevil/nexus2/NexusGLThread;->nStartTime:J

    .line 119
    const/4 v8, 0x0

    .line 120
    .local v8, "needStart":Z
    monitor-enter p0

    .line 122
    :goto_2
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/gamevil/nexus2/NexusGLThread;->getEvent()Ljava/lang/Runnable;

    move-result-object v9

    .local v9, "r":Ljava/lang/Runnable;
    if-nez v9, :cond_4

    .line 125
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mPaused:Z

    move v15, v0

    if-eqz v15, :cond_2

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    invoke-virtual {v15}, Lcom/gamevil/nexus2/EglHelper;->finish()V

    .line 127
    const/4 v8, 0x1

    .line 129
    :cond_2
    invoke-direct/range {p0 .. p0}, Lcom/gamevil/nexus2/NexusGLThread;->needToWait()Z

    move-result v15

    if-eqz v15, :cond_3

    .line 130
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/gamevil/nexus2/NexusGLThread;->needToWait()Z

    move-result v15

    if-nez v15, :cond_5

    .line 134
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mDone:Z

    move v15, v0

    if-eqz v15, :cond_6

    .line 135
    monitor-exit p0

    goto :goto_1

    .line 120
    .end local v9    # "r":Ljava/lang/Runnable;
    :catchall_0
    move-exception v15

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v15

    .line 123
    .restart local v9    # "r":Ljava/lang/Runnable;
    :cond_4
    :try_start_1
    invoke-interface {v9}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 131
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->wait()V

    goto :goto_3

    .line 137
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mSizeChanged:Z

    move v3, v0

    .line 138
    .local v3, "changed":Z
    move-object/from16 v0, p0

    iget v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mWidth:I

    move v14, v0

    .line 139
    .local v14, "w":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mHeight:I

    move v7, v0

    .line 140
    .local v7, "h":I
    const/4 v15, 0x0

    move v0, v15

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/gamevil/nexus2/NexusGLThread;->mSizeChanged:Z

    .line 120
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    if-eqz v8, :cond_7

    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    invoke-virtual {v15, v4}, Lcom/gamevil/nexus2/EglHelper;->start([I)V

    .line 144
    const/4 v13, 0x1

    .line 145
    const/4 v3, 0x1

    .line 147
    :cond_7
    if-eqz v3, :cond_8

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mHolder:Landroid/view/SurfaceHolder;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/gamevil/nexus2/EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v6

    .end local v6    # "gl":Ljavax/microedition/khronos/opengles/GL10;
    check-cast v6, Ljavax/microedition/khronos/opengles/GL10;

    .line 149
    .restart local v6    # "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v12, 0x1

    .line 151
    :cond_8
    if-eqz v13, :cond_9

    .line 152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    move-object v15, v0

    invoke-interface {v15, v6}, Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;->surfaceCreated(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 153
    const/4 v13, 0x0

    .line 155
    :cond_9
    if-eqz v12, :cond_a

    .line 156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    move-object v15, v0

    invoke-interface {v15, v6, v14, v7}, Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;->surfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 157
    const/4 v12, 0x0

    .line 159
    :cond_a
    if-lez v14, :cond_b

    if-lez v7, :cond_b

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mRenderer:Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    move-object v15, v0

    invoke-interface {v15, v6}, Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;->drawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    move-object v15, v0

    invoke-virtual {v15}, Lcom/gamevil/nexus2/EglHelper;->swap()Z

    .line 171
    :cond_b
    sget v15, Lcom/gamevil/nexus2/NexusGLThread;->m_nPeriod:I

    int-to-long v15, v15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/gamevil/nexus2/NexusGLThread;->nStartTime:J

    move-wide/from16 v19, v0

    sub-long v17, v17, v19

    sub-long v10, v15, v17

    .line 172
    .local v10, "sleepTime":J
    const-wide/16 v15, 0x0

    cmp-long v15, v10, v15

    if-lez v15, :cond_0

    .line 176
    :try_start_2
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 178
    :catch_0
    move-exception v5

    .line 180
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private needToWait()Z
    .locals 1

    .prologue
    .line 193
    iget-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mPaused:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHasFocus:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHasSurface:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mContextLost:Z

    if-eqz v0, :cond_1

    .line 194
    :cond_0
    iget-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mDone:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    .line 193
    goto :goto_0
.end method


# virtual methods
.method public GWSwapBuffers()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    if-eqz v0, :cond_0

    .line 286
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEglHelper:Lcom/gamevil/nexus2/EglHelper;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/EglHelper;->swap()Z

    move-result v0

    if-nez v0, :cond_0

    .line 288
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "!!Error  EGL_CONTEXT_LOST "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 291
    :cond_0
    return-void
.end method

.method public OnMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "_msg"    # Ljava/lang/String;

    .prologue
    .line 295
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "NXGLThread::OnMessage "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 213
    monitor-enter p0

    .line 214
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mPaused:Z

    .line 213
    monitor-exit p0

    .line 216
    return-void

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 219
    monitor-enter p0

    .line 220
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mPaused:Z

    .line 221
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 219
    monitor-exit p0

    .line 223
    return-void

    .line 219
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onSurfaceChaged(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 239
    monitor-enter p0

    .line 240
    :try_start_0
    iput p1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mWidth:I

    .line 241
    iput p2, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHeight:I

    .line 242
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mSizeChanged:Z

    .line 239
    monitor-exit p0

    .line 244
    return-void

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 233
    monitor-enter p0

    .line 234
    :try_start_0
    iput-boolean p1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHasFocus:Z

    .line 235
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 233
    monitor-exit p0

    .line 237
    return-void

    .line 233
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 265
    monitor-enter p0

    .line 266
    :try_start_0
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    monitor-exit p0

    .line 268
    return-void

    .line 265
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 2

    .prologue
    .line 249
    monitor-enter p0

    .line 250
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->mDone:Z

    .line 251
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 249
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    :try_start_1
    invoke-virtual {p0}, Lcom/gamevil/nexus2/NexusGLThread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 258
    :goto_0
    return-void

    .line 249
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 83
    :try_start_0
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    :try_start_1
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLThread;->guardedRun()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 93
    :goto_0
    return-void

    .line 84
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 91
    .local v0, "e":Ljava/lang/InterruptedException;
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    .line 88
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 91
    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    .line 90
    :catchall_0
    move-exception v1

    .line 91
    iget-object v2, p0, Lcom/gamevil/nexus2/NexusGLThread;->sEglSemaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 92
    throw v1
.end method

.method public surfaceCreated()V
    .locals 1

    .prologue
    .line 198
    monitor-enter p0

    .line 199
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHasSurface:Z

    .line 200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mContextLost:Z

    .line 201
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 198
    monitor-exit p0

    .line 203
    return-void

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceDestroyed()V
    .locals 1

    .prologue
    .line 206
    monitor-enter p0

    .line 207
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NexusGLThread;->mHasSurface:Z

    .line 208
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 206
    monitor-exit p0

    .line 210
    return-void

    .line 206
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
