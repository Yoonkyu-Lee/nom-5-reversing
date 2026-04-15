.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3$1;
.super Ljava/lang/Object;
.source "GamevilLiveWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3$1;->this$1:Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 260
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3$1;->this$1:Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;

    invoke-static {v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;->access$0(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;)Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->clearHistory()V

    .line 261
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3$1;->this$1:Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;

    invoke-static {v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;->access$0(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;)Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->clearCache(Z)V

    .line 262
    iget-object v1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3$1;->this$1:Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;

    invoke-static {v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;->access$0(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$3;)Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadLivePage()V

    .line 263
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v2, 0x7f08000c

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 264
    .local v0, "f":Landroid/widget/FrameLayout;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 265
    return-void
.end method
