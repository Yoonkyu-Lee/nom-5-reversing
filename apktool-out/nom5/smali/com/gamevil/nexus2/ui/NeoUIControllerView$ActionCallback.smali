.class Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;
.super Ljava/lang/Object;
.source "NeoUIControllerView.java"

# interfaces
.implements Lcom/gamevil/nexus2/ui/NeoTouchDetector$OnActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/ui/NeoUIControllerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/ui/NeoUIControllerView;


# direct methods
.method private constructor <init>(Lcom/gamevil/nexus2/ui/NeoUIControllerView;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;->this$0:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gamevil/nexus2/ui/NeoUIControllerView;Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;)V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;-><init>(Lcom/gamevil/nexus2/ui/NeoUIControllerView;)V

    return-void
.end method


# virtual methods
.method public onAction(IFFI)V
    .locals 4
    .param p1, "_action"    # I
    .param p2, "dx"    # F
    .param p3, "dy"    # F
    .param p4, "pointerId"    # I

    .prologue
    .line 79
    iget-object v3, p0, Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;->this$0:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v3, v3, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    if-nez v3, :cond_1

    .line 91
    :cond_0
    return-void

    .line 81
    :cond_1
    iget-object v3, p0, Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;->this$0:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v3, v3, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    invoke-virtual {v3}, Lcom/gamevil/nexus2/ui/NxArray;->getElemetsSize()I

    move-result v2

    .line 82
    .local v2, "_subViewSize":I
    const/4 v1, 0x0

    .local v1, "_i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 84
    iget-object v3, p0, Lcom/gamevil/nexus2/ui/NeoUIControllerView$ActionCallback;->this$0:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v3, v3, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    invoke-virtual {v3, v1}, Lcom/gamevil/nexus2/ui/NxArray;->getElement(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gamevil/nexus2/ui/NeoUIArea;

    .line 85
    .local v0, "_area":Lcom/gamevil/nexus2/ui/NeoUIArea;
    if-eqz v0, :cond_2

    iget-boolean v3, v0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    if-nez v3, :cond_2

    .line 87
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/gamevil/nexus2/ui/NeoUIArea;->onAction(IFFI)V

    .line 82
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
