.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;
.super Ljava/lang/Object;
.source "GamevilLiveWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->initialize()V
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
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 130
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v3, 0x7f08000e

    invoke-virtual {v2, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 131
    .local v0, "back":Landroid/widget/ImageButton;
    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 132
    sget-object v2, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v3, 0x7f08000f

    invoke-virtual {v2, v3}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 133
    .local v1, "close":Landroid/widget/ImageButton;
    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 137
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-static {v2}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->access$3(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v2, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$4;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-static {v2}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->access$4(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    return-void
.end method
