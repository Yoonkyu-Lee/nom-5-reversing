.class Lcom/kaf/contentsbox/IContentsBoxManager$ContentsBoxConnection;
.super Ljava/lang/Object;
.source "IContentsBoxManager.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kaf/contentsbox/IContentsBoxManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ContentsBoxConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kaf/contentsbox/IContentsBoxManager;


# direct methods
.method constructor <init>(Lcom/kaf/contentsbox/IContentsBoxManager;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lcom/kaf/contentsbox/IContentsBoxManager$ContentsBoxConnection;->this$0:Lcom/kaf/contentsbox/IContentsBoxManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "boundService"    # Landroid/os/IBinder;

    .prologue
    .line 174
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 177
    return-void
.end method
