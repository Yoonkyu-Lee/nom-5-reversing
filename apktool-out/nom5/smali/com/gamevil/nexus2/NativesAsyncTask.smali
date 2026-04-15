.class public Lcom/gamevil/nexus2/NativesAsyncTask;
.super Landroid/os/AsyncTask;
.source "NativesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field m_bCancelled:Z

.field public m_nTimeOut:I

.field public m_nTimerIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 11
    iput v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    .line 12
    iput v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    .line 13
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_bCancelled:Z

    .line 17
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "timeOut"    # I

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 11
    iput v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    .line 12
    iput v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    .line 13
    iput-boolean v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_bCancelled:Z

    .line 21
    iput p1, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    .line 22
    return-void
.end method


# virtual methods
.method public varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 2
    .param p1, "in"    # [Ljava/lang/Integer;

    .prologue
    .line 35
    iget v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 36
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/NativesAsyncTask;->doInBackground([Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public onCancelled()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_bCancelled:Z

    .line 55
    return-void
.end method

.method public onPostExecute(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "in"    # Ljava/lang/Integer;

    .prologue
    .line 42
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "NETWORK:: TimerCallBack Idx="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " END CALLBACK time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    iget-boolean v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_bCancelled:Z

    if-nez v0, :cond_0

    .line 45
    iget v0, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    invoke-static {v0}, Lcom/gamevil/nexus2/Natives;->NativeAsyncTimerCallBack(I)V

    .line 47
    :cond_0
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/gamevil/nexus2/NativesAsyncTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method public setTimeOut(II)V
    .locals 3
    .param p1, "time"    # I
    .param p2, "timerIndex"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    .line 27
    iput p2, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    .line 28
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "NETWORK:: setTimeOut Idx="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimerIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " END CALLBACK time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/gamevil/nexus2/NativesAsyncTask;->m_nTimeOut:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    return-void
.end method
