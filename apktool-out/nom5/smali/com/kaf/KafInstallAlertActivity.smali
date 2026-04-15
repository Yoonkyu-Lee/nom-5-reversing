.class public Lcom/kaf/KafInstallAlertActivity;
.super Landroid/app/Activity;
.source "KafInstallAlertActivity.java"


# static fields
.field private static final DLG_ALERT:I = 0x1

.field private static MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

.field private static SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

.field private static TEXT_NO:Ljava/lang/String;

.field private static TEXT_YES:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "\uc5b4\ud50c\ub9ac\ucf00\uc774\uc158 \uad6c\ub3d9\uc744 \uc704\ud574 olleh \ub9c8\ucf13\uc774 \ud544\uc694\ud569\ub2c8\ub2e4. \uc124\uce58\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?"

    sput-object v0, Lcom/kaf/KafInstallAlertActivity;->MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

    .line 25
    const-string v0, "http://appstoresupport.show.co.kr:8080/store.html"

    sput-object v0, Lcom/kaf/KafInstallAlertActivity;->SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

    .line 26
    const-string v0, "\uc608"

    sput-object v0, Lcom/kaf/KafInstallAlertActivity;->TEXT_YES:Ljava/lang/String;

    .line 27
    const-string v0, "\uc544\ub2c8\uc694"

    sput-object v0, Lcom/kaf/KafInstallAlertActivity;->TEXT_NO:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/kaf/KafInstallAlertActivity;->SHOW_STORE_DOWNLOAD_URL:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/kaf/KafInstallAlertActivity;->showDialog(I)V

    .line 23
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 32
    const/4 v1, 0x0

    .line 33
    .local v1, "dlg":Landroid/app/Dialog;
    const/4 v0, 0x0

    .line 35
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 71
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v2

    .line 78
    :goto_0
    return-object v2

    .line 37
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 39
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    sget-object v2, Lcom/kaf/KafInstallAlertActivity;->MSG_SHOW_STORE_INSTALL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 40
    sget-object v2, Lcom/kaf/KafInstallAlertActivity;->TEXT_YES:Ljava/lang/String;

    new-instance v3, Lcom/kaf/KafInstallAlertActivity$1;

    invoke-direct {v3, p0}, Lcom/kaf/KafInstallAlertActivity$1;-><init>(Lcom/kaf/KafInstallAlertActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 56
    sget-object v2, Lcom/kaf/KafInstallAlertActivity;->TEXT_NO:Ljava/lang/String;

    new-instance v3, Lcom/kaf/KafInstallAlertActivity$2;

    invoke-direct {v3, p0}, Lcom/kaf/KafInstallAlertActivity$2;-><init>(Lcom/kaf/KafInstallAlertActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 74
    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    :cond_0
    move-object v2, v1

    .line 78
    goto :goto_0

    .line 35
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
