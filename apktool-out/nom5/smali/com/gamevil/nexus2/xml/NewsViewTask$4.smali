.class Lcom/gamevil/nexus2/xml/NewsViewTask$4;
.super Ljava/lang/Object;
.source "NewsViewTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/xml/NewsViewTask;->onPostExecute(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/xml/NewsViewTask;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$4;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 190
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v4, 0x7f080008

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-static {v3}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$6(Landroid/widget/FrameLayout;)V

    .line 191
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$7()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 192
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v4, 0x7f080009

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 193
    .local v1, "image":Landroid/widget/ImageButton;
    invoke-virtual {v1, v5}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 194
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v4, 0x7f08000a

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    .line 195
    .local v2, "news":Landroid/widget/ImageButton;
    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 196
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v4, 0x7f08000b

    invoke-virtual {v3, v4}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 198
    .local v0, "cancle":Landroid/widget/Button;
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 200
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$8()Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$4;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    invoke-static {v3}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$9(Lcom/gamevil/nexus2/xml/NewsViewTask;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    iget-object v3, p0, Lcom/gamevil/nexus2/xml/NewsViewTask$4;->this$0:Lcom/gamevil/nexus2/xml/NewsViewTask;

    invoke-static {v3}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$10(Lcom/gamevil/nexus2/xml/NewsViewTask;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$11()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 206
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$12()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$7()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .end local p0    # "this":Lcom/gamevil/nexus2/xml/NewsViewTask$4;
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p0}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$13(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 209
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$3()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v3

    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 210
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$7()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$3()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 219
    :goto_0
    return-void

    .line 214
    .restart local p0    # "this":Lcom/gamevil/nexus2/xml/NewsViewTask$4;
    :cond_0
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$7()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    .end local p0    # "this":Lcom/gamevil/nexus2/xml/NewsViewTask$4;
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {p0}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$13(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 215
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$3()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v3

    const/16 v4, -0x6e

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 216
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$7()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->access$3()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method
