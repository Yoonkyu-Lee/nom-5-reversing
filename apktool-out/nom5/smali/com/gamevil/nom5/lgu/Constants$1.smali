.class Lcom/gamevil/nom5/lgu/Constants$1;
.super Ljava/lang/Object;
.source "Constants.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/lgu/Constants;->showNetworkAlert(Ljava/lang/Long;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nom5/lgu/Constants;

.field private final synthetic val$bCallback:Z

.field private final synthetic val$currentMillis:Ljava/lang/Long;


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/lgu/Constants;Ljava/lang/Long;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/Constants$1;->this$0:Lcom/gamevil/nom5/lgu/Constants;

    iput-object p2, p0, Lcom/gamevil/nom5/lgu/Constants$1;->val$currentMillis:Ljava/lang/Long;

    iput-boolean p3, p0, Lcom/gamevil/nom5/lgu/Constants$1;->val$bCallback:Z

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 171
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 172
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 173
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Constants$1;->this$0:Lcom/gamevil/nom5/lgu/Constants;

    iget-object v2, p0, Lcom/gamevil/nom5/lgu/Constants$1;->val$currentMillis:Ljava/lang/Long;

    invoke-virtual {v1, v2}, Lcom/gamevil/nom5/lgu/Constants;->getNotificationMessage(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 174
    const-string v1, "OK"

    new-instance v2, Lcom/gamevil/nom5/lgu/Constants$1$1;

    iget-boolean v3, p0, Lcom/gamevil/nom5/lgu/Constants$1;->val$bCallback:Z

    invoke-direct {v2, p0, v3}, Lcom/gamevil/nom5/lgu/Constants$1$1;-><init>(Lcom/gamevil/nom5/lgu/Constants$1;Z)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 183
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 184
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 185
    return-void
.end method
