package com.gamevil.nexus2.p000ui;

import android.graphics.Bitmap;
import android.opengl.GLUtils;
import com.kaf.net.Network;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public class UITexturePlane {
    private final int TEXTURE_SIZE = Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT;
    private int height;
    private int imgH;
    private int imgW;
    private FloatBuffer mCoordBuffer;
    private int mTextureID;
    private FloatBuffer mVertexBuffer;
    private float offX;
    private float offY;
    private float posX;
    private float posY;
    private Bitmap[] texImage;
    private int width;

    public void releaseAll() {
        if (this.texImage != null) {
            for (int i = 0; i < this.texImage.length; i++) {
                this.texImage[i] = null;
            }
            this.texImage = null;
        }
        this.mVertexBuffer = null;
    }

    public void setTextureImages(Bitmap[] _texImg) {
        this.texImage = _texImg;
        this.imgW = this.texImage[0].getWidth();
        this.imgH = this.texImage[0].getHeight();
    }

    public void setScreenSize(float _width, float _height) {
        this.offX = (-_width) / 2.0f;
        this.offY = _height / 2.0f;
    }

    public void setPlanePosition(int _x, int _y, int _width, int _height, int _dist) {
        this.posX = this.offX + _x;
        this.posY = this.offY - _y;
        this.width = _width;
        this.height = _height;
        float[] vertices = {this.posX, this.posY, _dist, this.posX, this.posY - this.height, _dist, this.posX + this.width, this.posY - this.height, _dist, this.posX, this.posY, _dist, this.posX + this.width, this.posY, _dist, this.posX + this.width, this.posY - this.height, _dist};
        float ratioW = this.width / 128.0f;
        float ratioH = this.height / 128.0f;
        float[] texCoords = {0.0f, 0.0f, 0.0f, ratioH, ratioW, ratioH, 0.0f, 0.0f, ratioW, 0.0f, ratioW, ratioH};
        this.mVertexBuffer = null;
        this.mCoordBuffer = null;
        this.mVertexBuffer = getFloatBufferFromFloatArray(vertices);
        this.mCoordBuffer = getFloatBufferFromFloatArray(texCoords);
    }

    public void setPlanePosition(int _x, int _y, int _width, int _height) {
        setPlanePosition(_x, _y, _width, _height, 0);
    }

    public void setPlanePosition(int _x, int _y) {
        setPlanePosition(_x, _y, this.imgW, this.imgH, 0);
    }

    public void setPosition(int _x, int _y) {
        this.posX = this.offX + _x;
        this.posY = this.offY - _y;
        this.mVertexBuffer.put(0, this.posX);
        this.mVertexBuffer.put(1, this.posY);
        this.mVertexBuffer.put(2, 0.0f);
        this.mVertexBuffer.put(3, this.posX);
        this.mVertexBuffer.put(4, this.posY - this.height);
        this.mVertexBuffer.put(5, 0.0f);
        this.mVertexBuffer.put(6, this.posX + this.width);
        this.mVertexBuffer.put(7, this.posY - this.height);
        this.mVertexBuffer.put(8, 0.0f);
        this.mVertexBuffer.put(9, this.posX);
        this.mVertexBuffer.put(10, this.posY);
        this.mVertexBuffer.put(11, 0.0f);
        this.mVertexBuffer.put(12, this.posX + this.width);
        this.mVertexBuffer.put(13, this.posY);
        this.mVertexBuffer.put(14, 0.0f);
        this.mVertexBuffer.put(15, this.posX + this.width);
        this.mVertexBuffer.put(16, this.posY - this.height);
        this.mVertexBuffer.put(17, 0.0f);
    }

    public void initializeTexturPlane(GL10 gl) {
        int[] textures = new int[1];
        gl.glGenTextures(1, textures, 0);
        this.mTextureID = textures[0];
        gl.glBindTexture(3553, this.mTextureID);
        int[] color = new int[Network.NETSTATUS_WLAN_DISCONNECT];
        for (int i = 0; i < color.length; i++) {
            color[i] = 16777215;
        }
        Bitmap bitmap256 = Bitmap.createBitmap(color, Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT, Network.NETSTATUS_WIFI_NESPOT_Private_IP_CONNECT, Bitmap.Config.ARGB_8888);
        GLUtils.texImage2D(3553, 0, bitmap256, 0);
        bitmap256.recycle();
        gl.glBlendFunc(1, 771);
        gl.glTexParameterf(3553, 10241, 9728.0f);
        gl.glTexParameterf(3553, 10240, 9729.0f);
    }

    public void draw(GL10 gl, int _imgIdx) {
        if (this.texImage != null) {
            gl.glEnable(3042);
            gl.glEnable(3553);
            gl.glEnableClientState(32888);
            gl.glBindTexture(3553, this.mTextureID);
            if (this.mCoordBuffer != null) {
                gl.glTexCoordPointer(2, 5126, 0, this.mCoordBuffer);
            }
            if (this.mVertexBuffer != null) {
                gl.glVertexPointer(3, 5126, 0, this.mVertexBuffer);
            }
            GLUtils.texSubImage2D(3553, 0, 0, 0, this.texImage[_imgIdx]);
            gl.glDrawArrays(5, 0, 6);
            gl.glDisableClientState(32888);
            gl.glDisable(3553);
            gl.glDisable(3042);
        }
    }

    FloatBuffer getFloatBufferFromFloatArray(float[] array) {
        ByteBuffer tempBuffer = ByteBuffer.allocateDirect(array.length * 4);
        tempBuffer.order(ByteOrder.nativeOrder());
        FloatBuffer buffer = tempBuffer.asFloatBuffer();
        buffer.put(array);
        buffer.position(0);
        return buffer;
    }
}
