.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;
.super Ljava/lang/Object;
.source "GamevilLiveWebView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/xml/GamevilLiveWebView;
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
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$1;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->goBack()V

    .line 237
    :cond_0
    return-void
.end method
