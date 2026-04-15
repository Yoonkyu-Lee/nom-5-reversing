.class public Lcom/gamevil/nexus2/NexusGLSurfaceView;
.super Landroid/view/SurfaceView;
.source "NexusGLSurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;
    }
.end annotation


# instance fields
.field private mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

.field private mHolder:Landroid/view/SurfaceHolder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 35
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->init()V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->init()V

    .line 41
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    .line 47
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 48
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 49
    return-void
.end method


# virtual methods
.method public getSurfaceHolder()Landroid/view/SurfaceHolder;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    return-object v0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 115
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 121
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->requestExitAndWait()V

    .line 122
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->onPause()V

    .line 84
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->NativePauseClet()V

    .line 85
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->onResume()V

    .line 92
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->NativeResumeClet()V

    .line 93
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 99
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->onWindowFocusChanged(Z)V

    .line 100
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0, p1}, Lcom/gamevil/nexus2/NexusGLThread;->onWindowFocusChanged(Z)V

    .line 102
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0, p1}, Lcom/gamevil/nexus2/NexusGLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 111
    return-void
.end method

.method public releaseAll()V
    .locals 1

    .prologue
    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    .line 128
    return-void
.end method

.method public setRenderer(Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;)V
    .locals 2
    .param p1, "renderer"    # Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;

    .prologue
    .line 60
    new-instance v0, Lcom/gamevil/nexus2/NexusGLThread;

    iget-object v1, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mHolder:Landroid/view/SurfaceHolder;

    invoke-direct {v0, p1, v1}, Lcom/gamevil/nexus2/NexusGLThread;-><init>(Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;Landroid/view/SurfaceHolder;)V

    iput-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    .line 61
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->start()V

    .line 62
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-static {v0}, Lcom/gamevil/nexus2/Natives;->setEventListener(Lcom/gamevil/nexus2/Natives$EventListener;)V

    .line 63
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "w"    # I
    .param p4, "h"    # I

    .prologue
    .line 76
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0, p3, p4}, Lcom/gamevil/nexus2/NexusGLThread;->onSurfaceChaged(II)V

    .line 77
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->surfaceCreated()V

    .line 66
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/gamevil/nexus2/NexusGLSurfaceView;->mGLThread:Lcom/gamevil/nexus2/NexusGLThread;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLThread;->surfaceDestroyed()V

    .line 71
    return-void
.end method
