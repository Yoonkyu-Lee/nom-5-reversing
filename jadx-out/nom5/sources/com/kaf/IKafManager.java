package com.kaf;

import android.content.Context;
import com.kaf.device.IDeviceControl;
import com.kaf.display.IDisplayManager;
import com.kaf.log.IDebug;
import com.kaf.media.IMediaManager;
import com.kaf.net.IBcmSocket;
import com.kaf.net.INetwork;
import com.kaf.sound.ISound;
import com.kaf.sys.IProperty;
import java.io.IOException;
import java.net.InetAddress;

/* JADX INFO: loaded from: classes.dex */
public abstract class IKafManager {
    public static IKafManager getInstance() {
        return null;
    }

    public void checkInit(int apiLevel) throws IllegalAccessException, GeneralException {
    }

    public String getAppId() {
        return null;
    }

    public int Initialize(Context context, int copyright) throws IllegalAccessException, GeneralException, IllegalArgumentException {
        return 0;
    }

    public IDeviceControl getDeviceControl() throws IllegalAccessException, InstantiationException {
        return null;
    }

    public IDisplayManager getDisplayManager() throws IllegalAccessException, InstantiationException {
        return null;
    }

    public IProperty getProperty() throws IllegalAccessException, InstantiationException {
        return null;
    }

    public IMediaManager getMediaManager() throws IllegalAccessException, InstantiationException {
        return null;
    }

    public ISound getSound() throws IllegalAccessException, InstantiationException {
        return null;
    }

    public INetwork getNetwork() {
        return null;
    }

    public INetwork getNetworkInstance() {
        return null;
    }

    public IBcmSocket getBcmSocket() {
        return null;
    }

    public IBcmSocket getBcmSocket(InetAddress dstAddress, int dstPort, InetAddress localAddress, int localPort, String appid, String billKind, char connectKind, boolean isTestMode) throws IOException, SecurityException, IllegalArgumentException {
        return null;
    }

    public IDebug getDebug() {
        return null;
    }
}
