.class Lcom/gamevil/nexus2/ui/NeoTouchDetector$Froyo;
.super Lcom/gamevil/nexus2/ui/NeoTouchDetector$Eclair;
.source "NeoTouchDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/ui/NeoTouchDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Froyo"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Eclair;-><init>(Lcom/gamevil/nexus2/ui/NeoTouchDetector$Eclair;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gamevil/nexus2/ui/NeoTouchDetector$Froyo;)V
    .locals 0

    .prologue
    .line 199
    invoke-direct {p0}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Froyo;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 204
    invoke-super {p0, p1}, Lcom/gamevil/nexus2/ui/NeoTouchDetector$Eclair;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
