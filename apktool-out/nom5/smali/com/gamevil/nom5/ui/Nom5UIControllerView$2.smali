.class Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;
.super Ljava/lang/Object;
.source "Nom5UIControllerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/ui/Nom5UIControllerView;->setTextInputVisible()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/ui/Nom5UIControllerView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    .line 276
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 279
    iget-object v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    iget-object v1, v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    invoke-virtual {v1, v3}, Lcom/gamevil/nexus2/ui/UIEditText;->setVisibility(I)V

    .line 280
    iget-object v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    iget-object v1, v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/ui/UIEditText;->requestFocus()Z

    .line 281
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 282
    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 281
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 283
    .local v0, "mgr":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    iget-object v1, v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 284
    return-void
.end method
