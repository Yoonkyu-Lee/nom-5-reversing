.class public Lcom/feelingk/iap/gui/view/PopupDialog;
.super Landroid/app/Dialog;
.source "PopupDialog.java"


# instance fields
.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeStyle"    # I
    .param p3, "isDeviceTab"    # Z

    .prologue
    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 13
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 15
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mClickListener:Landroid/view/View$OnClickListener;

    .line 19
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-direct {v0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 21
    return-void
.end method

.method static synthetic access$0(Lcom/feelingk/iap/gui/view/PopupDialog;)Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method


# virtual methods
.method public ClosePopupDialog()V
    .locals 0

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PopupDialog;->dismiss()V

    .line 48
    return-void
.end method

.method public InflateView(ILjava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "clickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 24
    iput-object p3, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mClickListener:Landroid/view/View$OnClickListener;

    .line 29
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/PopupDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    const-string v1, "/xml/commonPopup.xml"

    invoke-virtual {v0, v1, p2, p3}, Lcom/feelingk/iap/gui/parser/ParserXML;->Start(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PopupDialog;->setContentView(Landroid/view/View;)V

    .line 31
    const/16 v0, 0x69

    if-ne p1, v0, :cond_0

    .line 32
    new-instance v0, Lcom/feelingk/iap/gui/view/PopupDialog$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/view/PopupDialog$1;-><init>(Lcom/feelingk/iap/gui/view/PopupDialog;)V

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PopupDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 39
    :cond_0
    return-void
.end method

.method public ShowPopupDialog()V
    .locals 0

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PopupDialog;->show()V

    .line 43
    return-void
.end method
