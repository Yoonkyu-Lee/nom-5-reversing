.class Lcom/gamevil/nom5/lgu/LgUtil$3;
.super Ljava/lang/Object;
.source "LgUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/lgu/LgUtil;->showAlertNShutdown(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nom5/lgu/LgUtil;

.field private final synthetic val$elseCode:Ljava/lang/Integer;

.field private final synthetic val$errorCode:Ljava/lang/Integer;

.field private final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/lgu/LgUtil;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    iput-object p2, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$errorCode:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$elseCode:Ljava/lang/Integer;

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/gamevil/nom5/lgu/LgUtil$3;)Lcom/gamevil/nom5/lgu/LgUtil;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 186
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-static {v1}, Lcom/gamevil/nom5/lgu/LgUtil;->access$1(Lcom/gamevil/nom5/lgu/LgUtil;)Lcom/gamevil/nexus2/NexusGLActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 187
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$title:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 189
    :cond_0
    sget-object v1, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    iget-object v2, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$errorCode:Ljava/lang/Integer;

    iget-object v3, p0, Lcom/gamevil/nom5/lgu/LgUtil$3;->val$elseCode:Ljava/lang/Integer;

    invoke-virtual {v1, v2, v3}, Lcom/gamevil/nom5/lgu/Constants;->getMessage(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 190
    const-string v1, "OK"

    new-instance v2, Lcom/gamevil/nom5/lgu/LgUtil$3$1;

    invoke-direct {v2, p0}, Lcom/gamevil/nom5/lgu/LgUtil$3$1;-><init>(Lcom/gamevil/nom5/lgu/LgUtil$3;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 195
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 196
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 197
    return-void
.end method
