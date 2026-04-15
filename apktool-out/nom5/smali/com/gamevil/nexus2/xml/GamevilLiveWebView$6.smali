.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$6;
.super Ljava/lang/Object;
.source "GamevilLiveWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->hidePrograssBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$6;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 290
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v2, 0x1010002

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    .line 291
    .local v0, "bar":Landroid/widget/ProgressBar;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 292
    return-void
.end method
