.class Lcom/gamevil/nexus2/xml/NewsViewTask$2;
.super Ljava/lang/Object;
.source "NewsViewTask.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/xml/NewsViewTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/xml/NewsViewTask;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$2;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 236
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$3()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$2;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    invoke-static {v0}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$4(Lcom/gamevil/nexus2/xml/NewsViewTask;)V

    .line 245
    :goto_0
    return-void

    .line 242
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$2;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    invoke-static {v0}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$5(Lcom/gamevil/nexus2/xml/NewsViewTask;)V

    goto :goto_0
.end method
