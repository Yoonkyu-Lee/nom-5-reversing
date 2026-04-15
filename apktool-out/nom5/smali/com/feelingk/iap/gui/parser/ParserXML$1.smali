.class Lcom/feelingk/iap/gui/parser/ParserXML$1;
.super Ljava/lang/Object;
.source "ParserXML.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/gui/parser/ParserXML;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/feelingk/iap/gui/parser/ParserXML;


# direct methods
.method constructor <init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 1053
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1057
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$0(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v0

    .line 1058
    .local v0, "num_jumin1":I
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$1(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->length()I

    move-result v1

    .line 1060
    .local v1, "num_jumin2":I
    const/4 v3, 0x6

    if-ne v0, v3, :cond_0

    const/4 v3, 0x7

    if-ne v1, v3, :cond_0

    .line 1061
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$2(Lcom/feelingk/iap/gui/parser/ParserXML;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v4}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$0(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v5}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$1(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;->onAuthDialogOKButtonClick(Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    :goto_0
    return-void

    .line 1063
    :cond_0
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML$1;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$3(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/content/Context;

    move-result-object v3

    const-string v4, "\uc8fc\ubbfc\ubc88\ud638\ub97c \ub2e4\uc2dc \ud655\uc778\ud574 \uc8fc\uc138\uc694."

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1064
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
