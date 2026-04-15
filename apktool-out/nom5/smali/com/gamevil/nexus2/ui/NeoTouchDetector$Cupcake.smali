.class Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;
.super Lcom/gamevil/nexus2/ui/NeoTouchDetector;
.source "NeoTouchDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/ui/NeoTouchDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Cupcake"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/gamevil/nexus2/ui/NeoTouchDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;)V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;)V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;-><init>()V

    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    return v0
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, -0x1

    const/4 v4, 0x0

    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 104
    :cond_0
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 81
    :pswitch_0
    invoke-static {}, Lcom/gamevil/nexus2/ui/NeoTouchDetector;->access$0()I

    move-result v2

    if-ne v2, v3, :cond_0

    .line 83
    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v0

    .line 84
    .local v0, "_x":F
    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v1

    .line 85
    .local v1, "_y":F
    invoke-static {v4}, Lcom/gamevil/nexus2/ui/NeoTouchDetector;->access$1(I)V

    .line 86
    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->mListener:Lcom/gamevil/nexus2/ui/NeoTouchDetector$OnActionListener;

    const/16 v3, 0x65

    invoke-interface {v2, v3, v0, v1, v4}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$OnActionListener;->onAction(IFFI)V

    goto :goto_0

    .line 95
    .end local v0    # "_x":F
    .end local v1    # "_y":F
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v0

    .line 96
    .restart local v0    # "_x":F
    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v1

    .line 97
    .restart local v1    # "_y":F
    invoke-static {v3}, Lcom/gamevil/nexus2/ui/NeoTouchDetector;->access$1(I)V

    .line 98
    iget-object v2, p0, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Cupcake;->mListener:Lcom/gamevil/nexus2/ui/NeoTouchDetector$OnActionListener;

    const/16 v3, 0x64

    invoke-interface {v2, v3, v0, v1, v4}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$OnActionListener;->onAction(IFFI)V

    goto :goto_0

    .line 79
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
