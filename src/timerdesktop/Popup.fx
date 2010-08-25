/*
 * Popup.fx
 *
 * Created on Aug 9, 2010, 5:06:09 PM
 */

package timerdesktop;

/**
 * @author tonipenya
 */
public class Popup {
    public var message: String;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def fontbold16: javafx.scene.text.Font = javafx.scene.text.Font {
        size: 16.0
        embolden: true
    }
    
    public-read def lblTaskName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 97.0
        layoutY: 52.0
        text: bind message
        font: fontbold16
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        width: 254.0
        height: 120.0
        content: getDesignRootNodes ()
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ lblTaskName, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main

}