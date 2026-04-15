.class Lcom/gamevil/nom5/lgu/LgUtil$3$1;
.super Ljava/lang/Object;
.source "LgUtil.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/lgu/LgUtil$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gamevil/nom5/lgu/LgUtil$3;


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/lgu/LgUtil$3;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil$3$1;->this$1:Lcom/gamevil/nom5/lgu/LgUtil$3;

    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 193
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil$3$1;->this$1:Lcom/gamevil/nom5/lgu/LgUtil$3;

    invoke-static {v0}, Lcom/gamevil/nom5/lgu/LgUtil$3;->access$0(Lcom/gamevil/nom5/lgu/LgUtil$3;)Lcom/gamevil/nom5/lgu/LgUtil;

    move-result-object v0

    invoke-static {v0}, Lcom/gamevil/nom5/lgu/LgUtil;->access$1(Lcom/gamevil/nom5/lgu/LgUtil;)Lcom/gamevil/nexus2/NexusGLActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLActivity;->finishApp()V

    .line 194
    return-void
.end method
