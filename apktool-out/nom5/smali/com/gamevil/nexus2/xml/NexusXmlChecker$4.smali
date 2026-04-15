.class Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;
.super Ljava/lang/Object;
.source "NexusXmlChecker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/xml/NexusXmlChecker;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;->this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    .line 436
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 441
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;->this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    new-instance v1, Lcom/gamevil/nexus2/xml/NewsViewTask;

    invoke-direct {v1}, Lcom/gamevil/nexus2/xml/NewsViewTask;-><init>()V

    iput-object v1, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->task:Lcom/gamevil/nexus2/xml/NewsViewTask;

    .line 442
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;->this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    iget-object v0, v0, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->task:Lcom/gamevil/nexus2/xml/NewsViewTask;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;->this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    invoke-static {v3}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->access$3(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NexusXmlChecker$4;->this$0:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    invoke-static {v3}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->access$2(Lcom/gamevil/nexus2/xml/NexusXmlChecker;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/xml/NewsViewTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 444
    return-void
.end method
