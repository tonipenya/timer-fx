/*
 * Main.fx
 *
 * Created on Aug 4, 2010, 10:59:36 AM
 */
package timerdesktop;

import com.tonipenya.Task;
import com.tonipenya.TimerManager;
import com.tonipenya.ITask;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import timerdesktop.Popup;

/**
 * @author tonipenya
 */
def manager = new TimerManager();
var models: TaskModel[];
var taskID = 0;
var edit: Boolean;

public class MyTask extends Task {

    override function run(): Void {
        var popup = Popup {message: getName()};
        
        javafx.stage.Stage {
            title: "Alarm!"
            scene: popup.scene
        }
    }
}

public class TaskModel {

    var task: ITask;
    var labelText;
    var buttonText;

    postinit {
        refreshLabels();
    }

    var lTimeline = Timeline { repeatCount: Timeline.INDEFINITE
                keyFrames: [
                    KeyFrame {
                        time: 1s
                        action: function() {
                            refreshLabels();
                        }
                    }
                ];
            };

    function startStopTask(): Void {
        if (manager.isTaskRunning(task)) {
            manager.stopTimer(task);
            lTimeline.pause();
        } else {
            manager.startTimer(task);
            lTimeline.play();
        }

        refreshLabels();
    }

    function refreshLabels() {
        var millis: Long = 0;

        if (manager.isTaskRunning(task)) {
            millis = manager.getTimeRemaining(task);
        } else {
            millis = task.getInterval();
        }

        var x = millis / 1000;
        var seconds = x mod 60;
        x /= 60;
        var minutes = x mod 60;
        x /= 60;
        var hours = x mod 24;

        labelText = "{%02d hours}:{%02d minutes}:{%02d seconds} - {task.getName()}";

        if (manager.isTaskRunning(task)) {
            buttonText = "stop";
        } else {
            buttonText = "start";
        }
    }
}

public class Main {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_lstTimers: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lstTimers: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 114.0
        layoutY: 89.0
        layoutInfo: __layoutInfo_lstTimers
        items: bind models
    }
    
    public-read def lblName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 87.0
        layoutY: 41.0
        text: "Label"
    }
    
    public-read def txtName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 214.0
        layoutY: 41.0
    }
    
    public-read def lblDelay: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 81.0
        layoutY: 78.0
        text: "Label"
    }
    
    def __layoutInfo_txtHours: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHours: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 197.0
        layoutY: 39.0
        layoutInfo: __layoutInfo_txtHours
        text: "00"
    }
    
    def __layoutInfo_txtMinutes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtMinutes: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 303.0
        layoutY: 39.0
        layoutInfo: __layoutInfo_txtMinutes
        text: "00"
    }
    
    def __layoutInfo_txtSeconds: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtSeconds: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 396.0
        layoutY: 39.0
        layoutInfo: __layoutInfo_txtSeconds
        text: "00"
    }
    
    public-read def flow: javafx.scene.layout.Flow = javafx.scene.layout.Flow {
        visible: false
        layoutX: 267.0
        layoutY: 33.0
        content: [ txtHours, txtMinutes, txtSeconds, ]
        hgap: 6.0
        vgap: 6.0
    }
    
    public-read def btnOk: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 114.0
        layoutY: 114.0
        text: "Button"
    }
    
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        text: "Button"
    }
    
    public-read def flow2: javafx.scene.layout.Flow = javafx.scene.layout.Flow {
        visible: false
        layoutX: 245.0
        layoutY: 101.0
        content: [ btnOk, btnCancel, ]
        hgap: 6.0
        vgap: 6.0
    }
    
    public-read def grid: com.javafx.preview.layout.Grid = com.javafx.preview.layout.Grid {
        visible: false
        layoutX: 210.0
        layoutY: 33.0
        hgap: 6.0
        vgap: 6.0
        rows: [
            com.javafx.preview.layout.GridRow {
                cells: [ lblName, txtName, ]
            }
            com.javafx.preview.layout.GridRow {
                cells: [ lblDelay, flow, ]
            }
            com.javafx.preview.layout.GridRow {
                cells: [ javafx.scene.shape.Rectangle { fill: null }, flow2, ]
            }
        ]
    }
    
    def __layoutInfo_btnAdd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAdd: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 373.0
        layoutY: 56.0
        layoutInfo: __layoutInfo_btnAdd
        text: "Button"
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 292.0
        layoutY: 6.0
        layoutInfo: __layoutInfo_btnEdit
        text: "Button"
    }
    
    public-read def btnDelete: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        text: "Button"
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: false
        layoutX: 298.0
        layoutY: 211.0
        content: [ btnAdd, btnEdit, btnDelete, ]
        spacing: 6.0
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        width: 350.0
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
                            __layoutInfo_lstTimers.width = 232.0;
                            __layoutInfo_lstTimers.height = 308.0;
                            lstTimers.cellFactory = listCellFactory2;
                            lblName.visible = false;
                            lblName.layoutX = 87.0;
                            lblName.layoutY = 41.0;
                            lblName.text = "Label";
                            txtName.visible = false;
                            txtName.layoutX = 214.0;
                            txtName.layoutY = 41.0;
                            lblDelay.visible = false;
                            lblDelay.layoutX = 81.0;
                            lblDelay.layoutY = 78.0;
                            lblDelay.text = "Label";
                            txtHours.visible = false;
                            txtHours.layoutX = 197.0;
                            txtHours.layoutY = 39.0;
                            txtMinutes.visible = false;
                            txtMinutes.layoutX = 303.0;
                            txtMinutes.layoutY = 39.0;
                            txtSeconds.visible = false;
                            txtSeconds.layoutX = 396.0;
                            txtSeconds.layoutY = 39.0;
                            flow.visible = false;
                            flow.layoutX = 267.0;
                            flow.layoutY = 33.0;
                            flow.wrapLength = 400.0;
                            btnOk.visible = false;
                            btnOk.layoutX = 114.0;
                            btnOk.layoutY = 114.0;
                            btnOk.text = "Button";
                            btnCancel.visible = false;
                            btnCancel.text = "Button";
                            flow2.visible = false;
                            flow2.wrapLength = 400.0;
                            grid.visible = false;
                            grid.layoutX = 210.0;
                            grid.layoutY = 33.0;
                            btnAdd.visible = true;
                            btnAdd.layoutX = 298.0;
                            btnAdd.layoutY = 246.0;
                            __layoutInfo_btnAdd.width = 54.0;
                            btnAdd.text = "Add";
                            btnAdd.font = null;
                            btnAdd.action = btnAddActionAtmain;
                            btnEdit.visible = true;
                            __layoutInfo_btnEdit.width = 54.0;
                            btnEdit.text = "Edit";
                            btnEdit.action = btnEditActionAtmain;
                            btnDelete.visible = true;
                            btnDelete.text = "Delete";
                            btnDelete.action = btnDeleteActionAtmain;
                            vbox.visible = true;
                            vbox.layoutX = 244.0;
                            vbox.layoutY = 6.0;
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
                            txtName.visible = true;
                            txtName.layoutX = 40.0;
                            txtName.layoutY = 6.0;
                            lblDelay.visible = true;
                            lblDelay.layoutX = 6.0;
                            lblDelay.layoutY = 41.0;
                            lblDelay.text = "Delay";
                            txtHours.visible = true;
                            txtHours.layoutX = 43.0;
                            txtHours.layoutY = 39.0;
                            __layoutInfo_txtHours.width = 29.0;
                            txtHours.font = null;
                            txtMinutes.visible = true;
                            txtMinutes.layoutX = 73.0;
                            txtMinutes.layoutY = 41.0;
                            __layoutInfo_txtMinutes.width = 29.0;
                            txtSeconds.visible = true;
                            txtSeconds.layoutX = 197.0;
                            txtSeconds.layoutY = 104.0;
                            __layoutInfo_txtSeconds.width = 29.0;
                            flow.visible = true;
                            flow.layoutX = 158.0;
                            flow.layoutY = 143.0;
                            flow.wrapLength = 100.0;
                            btnOk.visible = true;
                            btnOk.layoutX = 37.0;
                            btnOk.layoutY = 98.0;
                            btnOk.text = "OK";
                            btnOk.action = addAction;
                            btnCancel.visible = true;
                            btnCancel.text = "Cancel";
                            btnCancel.action = btnCancelActionAtedit;
                            flow2.visible = true;
                            flow2.wrapLength = 100.0;
                            grid.visible = true;
                            grid.layoutX = 6.0;
                            grid.layoutY = 8.0;
                            btnAdd.visible = false;
                            btnAdd.layoutX = 373.0;
                            btnAdd.layoutY = 56.0;
                            btnAdd.text = "Button";
                            btnEdit.visible = false;
                            btnEdit.text = "Button";
                            btnDelete.visible = false;
                            btnDelete.text = "Button";
                            vbox.visible = false;
                            vbox.layoutX = 298.0;
                            vbox.layoutY = 211.0;
                        }
                    }
                ]
            }
        ]
    }
    
    function listCellFactory2(): javafx.scene.control.ListCell {
        var listCell: javafx.scene.control.ListCell;
        
        def btnTask: javafx.scene.control.Button = javafx.scene.control.Button {
            text: bind (listCell.item as TaskModel).buttonText
            action: bind (listCell.item as TaskModel).startStopTask
        }
        
        def lblTask: javafx.scene.control.Label = javafx.scene.control.Label {
            text: bind (listCell.item as TaskModel).labelText
        }
        
        def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
            content: [ btnTask, lblTask, ]
            spacing: 6.0
            fillHeight: true
        }
        
        listCell = javafx.scene.control.ListCell {
            node: hbox2
        }
        
        return listCell
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ lstTimers, grid, vbox, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main

    function btnAddActionAtmain(): Void {
        txtHours.text = "00";
        txtMinutes.text = "00";
        txtSeconds.text = "00";
        txtName.text = "";

        edit = false;
        currentState.next();
    }

    function btnEditActionAtmain(): Void {
        if (lstTimers.selectedItem == null) {
            return;
        }

        def model = lstTimers.selectedItem as TaskModel;
        var millis = model.task.getInterval();
        var x = millis / 1000;
        var seconds = x mod 60;
        x /= 60;
        var minutes = x mod 60;
        x /= 60;
        var hours = x mod 24;

        txtName.text = model.task.getName();
        txtHours.text = "{%02d hours}";
        txtMinutes.text = "{%02d minutes}";
        txtSeconds.text = "{%02d seconds}";

        edit = true;
        currentState.next();
    }

    function btnDeleteActionAtmain(): Void {
        if (lstTimers.selectedItem == null) {
            return;
        }
        
        delete lstTimers.selectedItem as TaskModel from models;
    }

    function addAction(): Void {
        var hours = Long.parseLong(txtHours.text);
        var minutes = Long.parseLong(txtMinutes.text);
        var seconds = Long.parseLong(txtSeconds.text);
        var millis = hours * 3600 * 1000 + minutes * 60 * 1000 + seconds * 1000;

        if (edit) {
            def model:TaskModel = lstTimers.selectedItem as TaskModel;

            // TODO: there must be a way to call Task constructor from TaskModel
            var task = MyTask{};
            task.setId(model.task.getId());
            task.setName(txtName.text);
            task.setInterval(millis);
            
            models[lstTimers.selectedIndex]= TaskModel {task: task};
        } else {
            var task = MyTask{};
            task.setId(taskID++);
            task.setName(txtName.text);
            task.setInterval(millis);
            
            insert TaskModel { task: task} into models;
        }

        currentState.previous();
    }

    function btnCancelActionAtedit(): Void {
        currentState.previous();
    }
}

function run (): Void {
    var task = MyTask{};
    task.setId(1);
    task.setName("task 1");
    task.setInterval(5000);
    insert TaskModel {task: task} into models;
    task = MyTask{};
    task.setId(2);
    task.setName("task 2");
    task.setInterval(10000);
    insert TaskModel {task: task} into models;
    task = MyTask{};
    task.setId(3);
    task.setName("task 3");
    task.setInterval(8000);
    insert TaskModel {task: task } into models;
    taskID = 5;

    var design = Main {};

    javafx.stage.Stage {
        title: "Main"
        scene: design.getDesignScene ()
    }
}
