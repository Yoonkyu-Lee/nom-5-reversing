.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;
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
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;)Lcom/gamevil/nexus2/xml/GamevilLiveWebView;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 242
    invoke-static {}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->access$0()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2$1;

    invoke-direct {v1, p0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2$1;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 252
    return-void
.end method
