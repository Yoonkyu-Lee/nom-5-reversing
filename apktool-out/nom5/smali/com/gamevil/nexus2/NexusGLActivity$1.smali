.class Lcom/gamevil/nexus2/NexusGLActivity$1;
.super Ljava/lang/Object;
.source "NexusGLActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/NexusGLActivity;->OnAsyncTimerSet(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/NexusGLActivity;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/NexusGLActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/NexusGLActivity$1;->this$0:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 343
    new-instance v0, Lcom/gamevil/nexus2/NativesAsyncTask;

    invoke-direct {v0}, Lcom/gamevil/nexus2/NativesAsyncTask;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    .line 344
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    sget v1, Lcom/gamevil/nexus2/NexusGLActivity;->m_timeout:I

    sget v2, Lcom/gamevil/nexus2/NexusGLActivity;->m_timerIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/gamevil/nexus2/NativesAsyncTask;->setTimeOut(II)V

    .line 345
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->task:Lcom/gamevil/nexus2/NativesAsyncTask;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NativesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 347
    return-void
.end method
