package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.os.Vibrator;
import com.gamevil.nexus2.NexusGLActivity;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class NexusSound {
    public static final int MAX_VOLUME = 80;
    private static boolean isSoundON;
    private static boolean isVibrationON = true;
    private static HashMap<Integer, Integer> mBGMResIDMap;
    private static MediaPlayer mBgmPlayer;
    private static Context mContext;
    private static MediaPlayer mPlayer;
    private static SoundPool mSfxSoundPool;
    private static int mSfxStreamID;
    private static HashMap<Integer, Integer> mSoundPoolMap;
    private static float mVolume;

    public static void releaseAll() {
        if (mSfxSoundPool != null) {
            mSfxSoundPool.release();
            mSfxSoundPool = null;
        }
        if (mSoundPoolMap != null) {
            mSoundPoolMap.clear();
            mSoundPoolMap = null;
        }
        if (mBGMResIDMap != null) {
            mBGMResIDMap.clear();
            mBGMResIDMap = null;
        }
        if (mBgmPlayer != null) {
            mBgmPlayer.release();
            mBgmPlayer = null;
        }
        if (mPlayer != null) {
            mPlayer.release();
            mPlayer = null;
        }
    }

    public static void initSounds(Context _theContext, int _maxMultiStream) {
        mContext = _theContext;
        releaseAll();
        mSfxSoundPool = new SoundPool(_maxMultiStream, 3, 0);
        mSoundPoolMap = new HashMap<>();
        mBGMResIDMap = new HashMap<>();
        mVolume = 80.0f;
    }

    public static void addSFXSound(int _index, int _soundID) {
        if (mSoundPoolMap != null) {
            mSoundPoolMap.put(Integer.valueOf(_index), Integer.valueOf(mSfxSoundPool.load(mContext, _soundID, 1)));
        }
    }

    public static void playSFXSound(int _index) {
        if (isSoundON && mSfxSoundPool != null) {
            mSfxStreamID = mSfxSoundPool.play(mSoundPoolMap.get(Integer.valueOf(_index)).intValue(), mVolume, mVolume, 1, 0, 1.0f);
        }
    }

    public static void playSound(int _index, boolean isLoop) {
        if (isSoundON) {
            if (isLoop) {
                try {
                    stopBGMSound();
                    mBgmPlayer = MediaPlayer.create(mContext, _index);
                    if (mBgmPlayer != null) {
                        mBgmPlayer.setLooping(isLoop);
                        mBgmPlayer.setVolume(mVolume, mVolume);
                        mBgmPlayer.start();
                        return;
                    }
                    return;
                } catch (Exception e) {
                    stopBGMSound();
                    e.printStackTrace();
                    return;
                }
            }
            try {
                stopSound();
                mPlayer = MediaPlayer.create(mContext, _index);
                if (mPlayer != null) {
                    mPlayer.setLooping(isLoop);
                    mPlayer.setVolume(mVolume, mVolume);
                    mPlayer.start();
                }
            } catch (Exception e2) {
                stopSound();
                e2.printStackTrace();
            }
        }
    }

    public static void playSound(int _offSet, int _index, boolean isLoop) {
        int rawIndex = _offSet + _index;
        if (isSoundON) {
            if (isLoop) {
                try {
                    stopBGMSound();
                    mBgmPlayer = MediaPlayer.create(mContext, rawIndex);
                    if (mBgmPlayer != null) {
                        mBgmPlayer.setLooping(isLoop);
                        mBgmPlayer.setVolume(mVolume, mVolume);
                        mBgmPlayer.start();
                        return;
                    }
                    return;
                } catch (Exception e) {
                    stopBGMSound();
                    e.printStackTrace();
                    return;
                }
            }
            if (mSfxSoundPool != null && mSoundPoolMap != null && mSoundPoolMap.containsKey(Integer.valueOf(_index))) {
                mSfxStreamID = mSfxSoundPool.play(mSoundPoolMap.get(Integer.valueOf(_index)).intValue(), mVolume, mVolume, 1, 0, 1.0f);
                return;
            }
            try {
                stopSound();
                mPlayer = MediaPlayer.create(mContext, rawIndex);
                if (mPlayer != null) {
                    mPlayer.setLooping(isLoop);
                    mPlayer.setVolume(mVolume, mVolume);
                    mPlayer.start();
                }
            } catch (Exception e2) {
                stopSound();
                e2.printStackTrace();
            }
        }
    }

    public static boolean isPlaying() {
        if (mPlayer == null) {
            return false;
        }
        return mPlayer.isPlaying();
    }

    public static boolean isBGMPlaying() {
        if (mBgmPlayer == null) {
            return false;
        }
        return mBgmPlayer.isPlaying();
    }

    public static void stopSfxSound() {
        if (mSfxSoundPool != null) {
            mSfxSoundPool.stop(mSfxStreamID);
        }
    }

    public static synchronized void stopBGMSound() {
        if (mBgmPlayer != null) {
            mBgmPlayer.stop();
            mBgmPlayer.release();
            mBgmPlayer = null;
        }
    }

    public static synchronized void stopSound() {
        if (mPlayer != null) {
            mPlayer.stop();
            mPlayer.release();
            mPlayer = null;
        }
    }

    public static void stopAllSound() {
        stopSfxSound();
        stopBGMSound();
        stopSound();
    }

    public static void setVolume(int _vol) {
        isSoundON = _vol > 0;
        if (_vol < 0) {
            _vol = 0;
        }
        mVolume = _vol / 10.0f;
    }

    public static float getVolume() {
        return mVolume;
    }

    public static void setSoundON(boolean _isON) {
        isSoundON = _isON;
    }

    public static boolean isSoundON() {
        return isSoundON;
    }

    public static void Vibrator(int _time) {
        if (isVibrationON) {
            ((Vibrator) NexusGLActivity.myActivity.getSystemService("vibrator")).vibrate(_time);
        }
    }

    public static void setIsVibtationON(boolean _isON) {
        isVibrationON = _isON;
    }
}
