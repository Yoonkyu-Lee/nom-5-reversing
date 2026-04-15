.class Lcom/gamevil/nexus2/Natives$2;
.super Ljava/lang/Object;
.source "Natives.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/Natives;->hideLoadingDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 990
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 992
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 993
    const/high16 v2, 0x1010000

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 992
    check-cast v0, Landroid/widget/ProgressBar;

    .line 994
    .local v0, "bar":Landroid/widget/ProgressBar;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 995
    return-void
.end method
