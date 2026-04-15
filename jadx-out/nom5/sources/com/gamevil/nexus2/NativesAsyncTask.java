package com.gamevil.nexus2;

import android.os.AsyncTask;
import android.os.SystemClock;

/* JADX INFO: loaded from: classes.dex */
public class NativesAsyncTask extends AsyncTask<Integer, Integer, Integer> {
    boolean m_bCancelled;
    public int m_nTimeOut;
    public int m_nTimerIndex;

    public NativesAsyncTask() {
        this.m_nTimeOut = 0;
        this.m_nTimerIndex = 0;
        this.m_bCancelled = false;
    }

    public NativesAsyncTask(int timeOut) {
        this.m_nTimeOut = 0;
        this.m_nTimerIndex = 0;
        this.m_bCancelled = false;
        this.m_nTimeOut = timeOut;
    }

    public void setTimeOut(int time, int timerIndex) {
        this.m_nTimeOut = time;
        this.m_nTimerIndex = timerIndex;
        System.out.println("NETWORK:: setTimeOut Idx=" + this.m_nTimerIndex + " END CALLBACK time = " + this.m_nTimeOut);
    }

    @Override // android.os.AsyncTask
    public Integer doInBackground(Integer... in) {
        SystemClock.sleep(this.m_nTimeOut);
        return 1;
    }

    @Override // android.os.AsyncTask
    public void onPostExecute(Integer in) {
        System.out.println("NETWORK:: TimerCallBack Idx=" + this.m_nTimerIndex + " END CALLBACK time = " + this.m_nTimeOut);
        if (!this.m_bCancelled) {
            Natives.NativeAsyncTimerCallBack(this.m_nTimerIndex);
        }
    }

    @Override // android.os.AsyncTask
    public void onCancelled() {
        this.m_bCancelled = true;
    }
}
