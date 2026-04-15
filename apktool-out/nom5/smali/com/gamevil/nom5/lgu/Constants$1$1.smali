.class Lcom/gamevil/nom5/lgu/Constants$1$1;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/lgu/Constants$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gamevil/nom5/lgu/Constants$1;

.field private final synthetic val$bCallback:Z


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/lgu/Constants$1;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/Constants$1$1;->this$1:Lcom/gamevil/nom5/lgu/Constants$1;

    iput-boolean p2, p0, Lcom/gamevil/nom5/lgu/Constants$1$1;->val$bCallback:Z

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    const/4 v2, -0x1

    .line 179
    iget-boolean v0, p0, Lcom/gamevil/nom5/lgu/Constants$1$1;->val$bCallback:Z

    if-eqz v0, :cond_0

    .line 180
    const/16 v0, 0x21

    const/4 v1, 0x0

    invoke-static {v0, v2, v2, v1}, Lcom/gamevil/nexus2/Natives;->handleCletEvent(IIII)V

    .line 182
    :cond_0
    return-void
.end method
