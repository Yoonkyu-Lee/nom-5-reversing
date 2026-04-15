package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nexus2.NexusGLRenderer;

/* JADX INFO: loaded from: classes.dex */
public class UIEditText extends EditText {
    public UIEditText(Context context) {
        super(context);
        setHint("Enter Name");
    }

    public UIEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
        setHint("Enter Name");
    }

    public void clearText() {
        setText("");
        setHint("Enter Name");
    }

    @Override // android.widget.TextView
    public void onEndBatchEdit() {
        getText().length();
        NexusGLActivity.uiViewControll.textInputed = getText().toString();
    }

    @Override // android.widget.TextView
    public void onCommitCompletion(CompletionInfo text) {
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
    }

    @Override // android.widget.TextView
    public void onEditorAction(int actionCode) {
        if (actionCode == 6) {
            NexusGLActivity.uiViewControll.textInputed = getText().toString();
        }
        super.onEditorAction(actionCode);
    }

    @Override // android.widget.TextView, android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        NexusGLActivity.uiViewControll.textInputed = getText().toString();
        if (NexusGLActivity.uiViewControll.textInputed.length() <= 0 && keyCode == 67) {
            NexusGLRenderer.m_renderer.setTouchEvent(2, -16, 0, 0);
        } else if (NexusGLActivity.uiViewControll.textInputed.length() > 0 && keyCode == 23) {
            NexusGLRenderer.m_renderer.setTouchEvent(2, -5, 0, 0);
        }
        return super.onKeyDown(keyCode, event);
    }

    public void showInput() {
        InputMethodManager mgr = (InputMethodManager) NexusGLActivity.myActivity.getSystemService("input_method");
        mgr.showSoftInput(this, 0);
    }
}
