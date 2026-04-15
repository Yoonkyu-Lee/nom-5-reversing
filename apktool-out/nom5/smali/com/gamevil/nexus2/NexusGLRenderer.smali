.class public Lcom/gamevil/nexus2/NexusGLRenderer;
.super Ljava/lang/Object;
.source "NexusGLRenderer.java"

# interfaces
.implements Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;


# static fields
.field public static m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;


# instance fields
.field private currentMotionEvent:I

.field private handleCletParam1:I

.field private handleCletParam2:I

.field private pointerId:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/16 v0, 0x8

    iput v0, p0, Lcom/gamevil/nexus2/NexusGLRenderer;->currentMotionEvent:I

    .line 32
    iput v1, p0, Lcom/gamevil/nexus2/NexusGLRenderer;->handleCletParam1:I

    .line 33
    iput v1, p0, Lcom/gamevil/nexus2/NexusGLRenderer;->handleCletParam2:I

    .line 24
    return-void
.end method

.method private sendHandleCletEvent()V
    .locals 5

    .prologue
    .line 191
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v1, v1, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/ui/EventQueue;->IsEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 193
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v1, v1, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/ui/EventQueue;->Dequeue()Lcom/gamevil/nexus2/ui/EventQueue$EventItem;

    move-result-object v0

    .line 194
    .local v0, "currentEvent":Lcom/gamevil/nexus2/ui/EventQueue$EventItem;
    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->GetEvent()I

    move-result v1

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->GetParam1()I

    move-result v2

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->GetParam2()I

    move-result v3

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue$EventItem;->GetPointerID()I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Lcom/gamevil/nexus2/Natives;->handleCletEvent(IIII)V

    .line 206
    .end local v0    # "currentEvent":Lcom/gamevil/nexus2/ui/EventQueue$EventItem;
    :cond_0
    return-void
.end method


# virtual methods
.method public drawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 1
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLRenderer;->sendHandleCletEvent()V

    .line 43
    invoke-static {}, Lcom/gamevil/nexus2/Natives;->NativeRender()V

    .line 44
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    if-eqz v0, :cond_0

    .line 46
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->checkUIStatus()V

    .line 53
    :cond_0
    return-void
.end method

.method public getConfigSpec()[I
    .locals 2

    .prologue
    .line 57
    const/4 v1, 0x3

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 61
    .local v0, "configSpec":[I
    return-object v0

    .line 57
    nop

    :array_0
    .array-data 4
        0x3025
        0x10
        0x3038
    .end array-data
.end method

.method public setTouchEvent(IIII)V
    .locals 1
    .param p1, "action"    # I
    .param p2, "_param1"    # I
    .param p3, "_param2"    # I
    .param p4, "_param3"    # I

    .prologue
    .line 111
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue;->IsFull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/EventQueue;->ClearEvent()V

    .line 114
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/gamevil/nexus2/ui/EventQueue;->Enqueue(IIII)V

    .line 183
    :goto_0
    return-void

    .line 118
    :cond_0
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->eventQueue:Lcom/gamevil/nexus2/ui/EventQueue;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/gamevil/nexus2/ui/EventQueue;->Enqueue(IIII)V

    goto :goto_0
.end method

.method public surfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 2
    .param p1, "_gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "_width"    # I
    .param p3, "_height"    # I

    .prologue
    .line 67
    sput p2, Lcom/gamevil/nexus2/NexusGLActivity;->displayWidth:I

    .line 68
    sput p3, Lcom/gamevil/nexus2/NexusGLActivity;->displayHeight:I

    .line 73
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    if-eqz v0, :cond_0

    .line 75
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->removeAllUIArea()V

    .line 76
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {v0, p2, p3}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->setSize(II)V

    .line 78
    :cond_0
    sget v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenWidth:I

    sget v1, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenHeight:I

    invoke-static {v0, v1}, Lcom/gamevil/nexus2/Natives;->NativeInitDeviceInfo(II)V

    .line 79
    invoke-static {p2, p3}, Lcom/gamevil/nexus2/Natives;->NativeResize(II)V

    .line 80
    return-void
.end method

.method public surfaceCreated(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 87
    sput-object p0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    .line 89
    sget v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenWidth:I

    sget v1, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenHeight:I

    invoke-static {v0, v1}, Lcom/gamevil/nexus2/Natives;->NativeInitWithBufferSize(II)V

    .line 97
    return-void
.end method
