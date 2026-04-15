.class Lcom/feelingk/iap/IAPActivity$7;
.super Landroid/telephony/PhoneStateListener;
.source "IAPActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/feelingk/iap/IAPActivity;->IAPLibUSIMStateCheck()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/feelingk/iap/IAPActivity;


# direct methods
.method constructor <init>(Lcom/feelingk/iap/IAPActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/feelingk/iap/IAPActivity$7;->this$0:Lcom/feelingk/iap/IAPActivity;

    .line 606
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 2
    .param p1, "serviceState"    # Landroid/telephony/ServiceState;

    .prologue
    .line 608
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$7;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-virtual {p1}, Landroid/telephony/ServiceState;->getState()I

    move-result v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/IAPActivity;->access$26(Lcom/feelingk/iap/IAPActivity;I)V

    .line 610
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$7;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v0}, Lcom/feelingk/iap/IAPActivity;->access$27(Lcom/feelingk/iap/IAPActivity;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/feelingk/iap/IAPActivity$7;->this$0:Lcom/feelingk/iap/IAPActivity;

    invoke-static {v0}, Lcom/feelingk/iap/IAPActivity;->access$27(Lcom/feelingk/iap/IAPActivity;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 613
    :cond_0
    return-void
.end method
