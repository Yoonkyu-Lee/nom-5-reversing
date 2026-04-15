.class public abstract Lcom/gamevil/nexus2/ui/NeoUIArea;
.super Ljava/lang/Object;
.source "NeoUIArea.java"


# static fields
.field public static final OUT_OF_AREA:I = -0x1

.field public static final UIAREA_ACTION_DOWN:I = 0x65

.field public static final UIAREA_ACTION_MOVE:I = 0x66

.field public static final UIAREA_ACTION_NONE:I = -0x63

.field public static final UIAREA_ACTION_UP:I = 0x64


# instance fields
.field public mHeight:I

.field public mIsHidden:Z

.field public mStatus:I

.field public mTag:I

.field public mUseTouchMove:Z

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    .line 19
    return-void
.end method


# virtual methods
.method public getIsHidden()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    return v0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mTag:I

    return v0
.end method

.method public abstract initialize()V
.end method

.method public abstract onAction(IFFI)V
.end method

.method public abstract onDraw(Landroid/graphics/Canvas;)V
.end method

.method public pointInArea(II)Z
    .locals 3
    .param p1, "_x"    # I
    .param p2, "_y"    # I

    .prologue
    const/4 v2, 0x0

    .line 68
    iget-boolean v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    if-eqz v0, :cond_0

    move v0, v2

    .line 77
    :goto_0
    return v0

    .line 70
    :cond_0
    iget v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mX:I

    if-gt v0, p1, :cond_1

    iget v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mX:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mWidth:I

    add-int/2addr v0, v1

    if-lt v0, p1, :cond_1

    .line 72
    iget v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mY:I

    if-gt v0, p2, :cond_1

    iget v0, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mY:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mHeight:I

    add-int/2addr v0, v1

    if-lt v0, p2, :cond_1

    .line 74
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 77
    goto :goto_0
.end method

.method public abstract releaseAll()V
.end method

.method public setIsHidden(Z)V
    .locals 0
    .param p1, "_isHide"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    .line 46
    return-void
.end method

.method public setIsUsingTouchMove(Z)V
    .locals 0
    .param p1, "_enable"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mUseTouchMove:Z

    .line 56
    return-void
.end method

.method public setPosition(IIII)V
    .locals 0
    .param p1, "_x"    # I
    .param p2, "_y"    # I
    .param p3, "_width"    # I
    .param p4, "_height"    # I

    .prologue
    .line 60
    iput p1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mX:I

    .line 61
    iput p2, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mY:I

    .line 62
    iput p3, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mWidth:I

    .line 63
    iput p4, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mHeight:I

    .line 64
    return-void
.end method

.method public setTag(I)V
    .locals 0
    .param p1, "_tag"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mTag:I

    .line 41
    return-void
.end method
