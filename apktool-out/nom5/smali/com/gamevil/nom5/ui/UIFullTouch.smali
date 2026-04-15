.class public Lcom/gamevil/nom5/ui/UIFullTouch;
.super Lcom/gamevil/nexus2/ui/NeoUIArea;
.source "UIFullTouch.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/gamevil/nexus2/ui/NeoUIArea;-><init>()V

    return-void
.end method


# virtual methods
.method public convertScreenX(I)I
    .locals 2
    .param p1, "x"    # I

    .prologue
    .line 51
    sget v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenWidth:I

    mul-int/2addr v0, p1

    sget v1, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->width:I

    div-int/2addr v0, v1

    return v0
.end method

.method public convertScreenY(I)I
    .locals 2
    .param p1, "y"    # I

    .prologue
    .line 56
    sget v0, Lcom/gamevil/nexus2/NexusGLActivity;->gameScreenHeight:I

    mul-int/2addr v0, p1

    sget v1, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->height:I

    div-int/2addr v0, v1

    return v0
.end method

.method public initialize()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 33
    sget v0, Lcom/gamevil/nexus2/NexusGLActivity;->displayWidth:I

    sget v1, Lcom/gamevil/nexus2/NexusGLActivity;->displayHeight:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setPosition(IIII)V

    .line 34
    return-void
.end method

.method public onAction(IFFI)V
    .locals 4
    .param p1, "_uiAreaAction"    # I
    .param p2, "_px"    # F
    .param p3, "_py"    # F
    .param p4, "_pointerId"    # I

    .prologue
    .line 62
    float-to-int v2, p2

    invoke-virtual {p0, v2}, Lcom/gamevil/nom5/ui/UIFullTouch;->convertScreenX(I)I

    move-result v0

    .line 63
    .local v0, "_x":I
    float-to-int v2, p3

    invoke-virtual {p0, v2}, Lcom/gamevil/nom5/ui/UIFullTouch;->convertScreenY(I)I

    move-result v1

    .line 65
    .local v1, "_y":I
    invoke-static {}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->isArmPassed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 67
    sget-boolean v2, Lcom/gamevil/nom5/lgu/Nom5Launcher;->isShownAlert:Z

    if-eqz v2, :cond_0

    .line 69
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v2}, Lcom/gamevil/nexus2/NexusGLActivity;->finishApp()V

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    const/16 v2, 0x65

    if-ne p1, v2, :cond_2

    .line 88
    sget-object v2, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/16 v3, 0x17

    invoke-virtual {v2, v3, v0, v1, p4}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    .line 89
    const/4 v2, 0x1

    iput v2, p0, Lcom/gamevil/nom5/ui/UIFullTouch;->mStatus:I

    goto :goto_0

    .line 91
    :cond_2
    const/16 v2, 0x66

    if-ne p1, v2, :cond_3

    .line 93
    sget-object v2, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/16 v3, 0x19

    invoke-virtual {v2, v3, v0, v1, p4}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    goto :goto_0

    .line 95
    :cond_3
    const/16 v2, 0x64

    if-ne p1, v2, :cond_0

    .line 98
    sget-object v2, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/16 v3, 0x18

    invoke-virtual {v2, v3, v0, v1, p4}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    .line 99
    const/4 v2, 0x0

    iput v2, p0, Lcom/gamevil/nom5/ui/UIFullTouch;->mStatus:I

    goto :goto_0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "_canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 46
    return-void
.end method

.method public releaseAll()V
    .locals 0

    .prologue
    .line 40
    return-void
.end method
