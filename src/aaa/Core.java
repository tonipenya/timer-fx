/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package aaa;

import com.tonipenya.ITimerManager;
import com.tonipenya.TimerManager;

/**
 *
 * @author tonipenya
 */
public class Core {

    private static Core instance = null;
    private ITimerManager manager;

    private Core() {
        manager = new TimerManager();
    }

    private static class CoreHolder {
        private static final Core INSTANCE = new Core();
    }

    public static Core getInstance() {
        return CoreHolder.INSTANCE;
    }

    public ITimerManager getMananager() {
        return manager;
    }

}
