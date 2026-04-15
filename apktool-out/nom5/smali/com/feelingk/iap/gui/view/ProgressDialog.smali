.class public Lcom/feelingk/iap/gui/view/ProgressDialog;
.super Ljava/lang/Object;
.source "ProgressDialog.java"


# instance fields
.field private dialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "onCancelLisener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    const/4 v7, -0x1

    const/4 v6, -0x2

    const/16 v5, 0xa

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    .line 18
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 19
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 21
    .local v1, "dialogLayout":Landroid/widget/LinearLayout;
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 24
    .local v3, "tv":Landroid/widget/TextView;
    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 25
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 28
    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 29
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    new-instance v2, Landroid/widget/ProgressBar;

    invoke-direct {v2, p1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 32
    .local v2, "pgBar":Landroid/widget/ProgressBar;
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/widget/ProgressBar;->setPadding(IIII)V

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 35
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 37
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 39
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    .line 40
    iget-object v4, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v4, p3}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 41
    return-void
.end method


# virtual methods
.method public CloseProgress()V
    .locals 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 49
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 50
    return-void
.end method

.method public ShowProgress()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/ProgressDialog;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 45
    return-void
.end method
