.class Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;
.super Ljava/lang/Object;
.source "Nom5UIControllerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nom5/ui/Nom5UIControllerView;->setTextInputInvisible()V
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
    iput-object p1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    iget-object v0, v0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/ui/UIEditText;->setVisibility(I)V

    .line 292
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;->this$0:Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    iget-object v0, v0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/ui/UIEditText;->clearText()V

    .line 294
    return-void
.end method
