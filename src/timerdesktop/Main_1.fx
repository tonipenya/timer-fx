/*
 * Main.fx
 *
 * Created on Aug 4, 2010, 10:59:36 AM
 */

package timerdesktop;

/**
 * @author tonipenya
 */
public class Main {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_lstTimers: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lstTimers: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 114.0
        layoutY: 89.0
        layoutInfo: __layoutInfo_lstTimers
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def lblName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 87.0
        layoutY: 41.0
        text: "Label"
    }
    
    public-read def lblDelay: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 81.0
        layoutY: 78.0
        text: "Label"
    }
    
    public-read def txtName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 214.0
        layoutY: 41.0
    }
    
    public-read def txtDelay: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 214.0
        layoutY: 78.0
    }
    
    public-read def btnOk: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 214.0
        layoutY: 124.0
        text: "Button"
    }
    
    public-read def btnAdd: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 373.0
        layoutY: 56.0
        text: "Button"
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        width: 480.0
        height: 320.0
        content: getDesignRootNodes ()
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "main", "edit", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            lstTimers.visible = true;
                            lstTimers.layoutX = 6.0;
                            lstTimers.layoutY = 6.0;
                            __layoutInfo_lstTimers.width = 279.0;
                            __layoutInfo_lstTimers.height = 308.0;
                            lstTimers.cellFactory = null;
                            lblName.visible = false;
                            lblName.layoutX = 87.0;
                            lblName.layoutY = 41.0;
                            lblName.text = "Label";
                            lblDelay.visible = false;
                            lblDelay.layoutX = 81.0;
                            lblDelay.layoutY = 78.0;
                            lblDelay.text = "Label";
                            txtName.visible = false;
                            txtName.layoutX = 214.0;
                            txtName.layoutY = 41.0;
                            txtDelay.visible = false;
                            txtDelay.layoutX = 214.0;
                            txtDelay.layoutY = 78.0;
                            btnOk.visible = false;
                            btnOk.layoutX = 214.0;
                            btnOk.layoutY = 124.0;
                            btnOk.text = "Button";
                            btnAdd.visible = true;
                            btnAdd.text = "Add";
                            btnAdd.font = null;
                            btnAdd.action = btnAddActionAtmain;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            lstTimers.visible = false;
                            lstTimers.layoutX = 114.0;
                            lstTimers.layoutY = 89.0;
                            lstTimers.cellFactory = null;
                            lblName.visible = true;
                            lblName.layoutX = 6.0;
                            lblName.layoutY = 12.0;
                            lblName.text = "Name";
                            lblDelay.visible = true;
                            lblDelay.layoutX = 6.0;
                            lblDelay.layoutY = 39.0;
                            lblDelay.text = "Delay";
                            txtName.visible = true;
                            txtName.layoutX = 40.0;
                            txtName.layoutY = 6.0;
                            txtDelay.visible = true;
                            txtDelay.layoutX = 40.0;
                            txtDelay.layoutY = 33.0;
                            btnOk.visible = true;
                            btnOk.layoutX = 40.0;
                            btnOk.layoutY = 60.0;
                            btnOk.text = "OK";
                            btnOk.action = addAction;
                            btnAdd.visible = false;
                            btnAdd.text = "Button";
                        }
                    }
                ]
            }
        ]
    }
    
    function listCellFactory(): javafx.scene.control.ListCell {
        return null
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ lstTimers, lblName, lblDelay, txtName, txtDelay, btnOk, btnAdd, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main

    function btnAddActionAtmain(): Void {
        currentState.next();
         }
    
    function addAction(): Void {
        //TODO
        insert "{txtName.text} {txtDelay.text}" into lstTimers.items;

        currentState.previous();
         }

}

function run (): Void {
    var design = Main {};

    javafx.stage.Stage {
        title: "Main"
        scene: design.getDesignScene ()
    }
}
