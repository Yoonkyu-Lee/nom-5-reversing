package com.gamevil.nom5.p001ui;

import android.graphics.Canvas;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nexus2.NexusGLRenderer;
import com.gamevil.nexus2.p000ui.NeoUIArea;
import com.gamevil.nexus2.p000ui.NeoUIControllerView;
import com.gamevil.nom5.lgu.Nom5Launcher;

/* JADX INFO: loaded from: classes.dex */
public class UIFullTouch extends NeoUIArea {
    @Override // com.gamevil.nexus2.p000ui.NeoUIArea
    public void initialize() {
        setPosition(0, 0, NexusGLActivity.displayWidth, NexusGLActivity.displayHeight);
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIArea
    public void releaseAll() {
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIArea
    public void onDraw(Canvas _canvas) {
    }

    public int convertScreenX(int x) {
        return (NexusGLActivity.gameScreenWidth * x) / NeoUIControllerView.width;
    }

    public int convertScreenY(int y) {
        return (NexusGLActivity.gameScreenHeight * y) / NeoUIControllerView.height;
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIArea
    public void onAction(int _uiAreaAction, float _px, float _py, int _pointerId) {
        int _x = convertScreenX((int) _px);
        int _y = convertScreenY((int) _py);
        if (!Nom5Launcher.isArmPassed()) {
            if (Nom5Launcher.isShownAlert) {
                NexusGLActivity.myActivity.finishApp();
            }
        } else if (_uiAreaAction == 101) {
            NexusGLRenderer.m_renderer.setTouchEvent(23, _x, _y, _pointerId);
            this.mStatus = 1;
        } else if (_uiAreaAction == 102) {
            NexusGLRenderer.m_renderer.setTouchEvent(25, _x, _y, _pointerId);
        } else if (_uiAreaAction == 100) {
            NexusGLRenderer.m_renderer.setTouchEvent(24, _x, _y, _pointerId);
            this.mStatus = 0;
        }
    }
}
