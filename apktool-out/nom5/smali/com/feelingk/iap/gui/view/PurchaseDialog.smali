.class public Lcom/feelingk/iap/gui/view/PurchaseDialog;
.super Landroid/app/Dialog;
.source "PurchaseDialog.java"


# instance fields
.field private mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

.field private mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZ)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeStyle"    # I
    .param p3, "callback"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    .param p4, "isTelecomCarrier"    # I
    .param p5, "bIsDeviceTab"    # Z

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 14
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 15
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 33
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-direct {v0, p1, p3, p4, p5}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZ)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 34
    iput-object p3, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 35
    new-instance v0, Lcom/feelingk/iap/gui/view/PurchaseDialog$2;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/view/PurchaseDialog$2;-><init>(Lcom/feelingk/iap/gui/view/PurchaseDialog;)V

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .prologue
    const/4 v1, 0x0

    .line 18
    const v0, 0x1030010

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 14
    iput-object v1, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 15
    iput-object v1, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 20
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-direct {v0, p1, p2}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 21
    iput-object p2, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 22
    new-instance v0, Lcom/feelingk/iap/gui/view/PurchaseDialog$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/view/PurchaseDialog$1;-><init>(Lcom/feelingk/iap/gui/view/PurchaseDialog;)V

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 29
    return-void
.end method

.method static synthetic access$0(Lcom/feelingk/iap/gui/view/PurchaseDialog;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mRetCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    return-object v0
.end method


# virtual methods
.method public ClosePurchaseDialog()V
    .locals 0

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->dismiss()V

    .line 56
    return-void
.end method

.method public InflateParserDialog(ILcom/feelingk/iap/gui/data/PurchaseItem;)V
    .locals 2
    .param p1, "orientation"    # I
    .param p2, "itemInfo"    # Lcom/feelingk/iap/gui/data/PurchaseItem;

    .prologue
    .line 45
    iget-object v1, p0, Lcom/feelingk/iap/gui/view/PurchaseDialog;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-virtual {v1, p1, p2}, Lcom/feelingk/iap/gui/parser/ParserXML;->Start(ILjava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 46
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->setContentView(Landroid/view/View;)V

    .line 47
    return-void
.end method

.method public ShowPurchaseDialog()V
    .locals 0

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PurchaseDialog;->show()V

    .line 52
    return-void
.end method
