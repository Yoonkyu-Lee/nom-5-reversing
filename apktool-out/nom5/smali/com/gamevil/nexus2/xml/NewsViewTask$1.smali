.class Lcom/gamevil/nexus2/xml/NewsViewTask$1;
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


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 229
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$2()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/gamevil/nexus2/Natives;->openUrl(Ljava/lang/String;)V

    .line 231
    return-void
.end method
