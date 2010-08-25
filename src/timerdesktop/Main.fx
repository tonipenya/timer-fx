/*
 * Main.fx
 *
 * Created on Aug 4, 2010, 10:59:36 AM
 */
package timerdesktop;

import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import com.tonipenya.timer.ICommand;
import java.lang.String;
import com.tonipenya.timer.dmo.ITask;
import com.tonipenya.timer.TimerManager;
import com.tonipenya.timer.dmo.Task;
import com.tonipenya.timer.dmo.ChainedTask;
import com.tonipenya.timer.ChainedCommand;
import com.tonipenya.timer.ITimerManager;
import javafx.stage.Stage;

/**
 * @author tonipenya
 */
def manager = new TimerManager();
var models: TaskModel[];
var taskID = 0;
var edit: Boolean;

public class MyCommand extends ICommand {

    public var task : ITask;

    override public function getName () : String {
        return task.getName();
    }

    override public function run () : Void {
        openPopUp(getName());
    }
}

public class CCommand extends ChainedCommand {
    public var task:ChainedTask;
    public var manager:ITimerManager;
    
    postinit {
        super.setManager(manager);
        super.setTask(task);

    }

    override public function implementation():Void {
        openPopUp(getName());
    }
}


public class TaskModel {

    var task: ITask;
    var command : ICommand;
    var labelText;
    var buttonText;

    postinit {
        if (task instanceof ChainedTask) {
            command = CCommand{task:task as ChainedTask, manager:manager};
        } else {
            command = Main.MyCommand{task: task};
        }

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
        if (manager.isRunning(command)) {
            manager.stopTimer(command);
            lTimeline.pause();
        } else {
            var delay;

            if (task instanceof ChainedTask) {
                delay = (task as ChainedTask).getTasks()[0].getInterval();
            } else {
                delay = task.getInterval();
            }

            manager.startTimer(command, delay);
            lTimeline.play();
        }

        refreshLabels();
    }

    function refreshLabels() {
        var millis: Long = 0;

        if (manager.isRunning(command)) {
            millis = manager.getTimeRemaining(command);
        } else {
            millis = task.getInterval();
        }

        var x = millis / 1000;
        var seconds = x mod 60;
        x /= 60;
        var minutes = x mod 60;
        x /= 60;
        var hours = x mod 24;

        labelText = "{%02d hours}:{%02d minutes}:{%02d seconds}";


        if (manager.isRunning(command)) {
            buttonText = "stop";
            labelText = "{labelText} - {command.getName()}"
        } else {
            buttonText = "start";
            labelText = "{labelText} - {task.getName()}"
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
                            btnOk.action = null;
                            btnCancel.visible = false;
                            btnCancel.text = "Button";
                            btnCancel.action = null;
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
                            btnAdd.action = null;
                            btnEdit.visible = false;
                            btnEdit.text = "Button";
                            btnEdit.action = null;
                            btnDelete.visible = false;
                            btnDelete.text = "Button";
                            btnDelete.action = null;
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
            var task = new Task(model.task.getId(), txtName.text, millis);
            models[lstTimers.selectedIndex]= TaskModel {task: task};
        } else {
            var task = new Task(taskID++, txtName.text, millis);
            insert TaskModel { task: task} into models;
        }

        currentState.previous();
    }

    function btnCancelActionAtedit(): Void {
        currentState.previous();
    }
}

function run (): Void {

    var task = new Task(1, "task 1", 3000);
    insert TaskModel {task: task} into models;
    task = new Task(2, "task 2", 4000);
    insert TaskModel {task: task} into models;
    task = new Task(3, "task 3", 5000);
    insert TaskModel {task: task} into models;

    var tasks : ITask[];
    task = new Task(4, "timer", 900000);
    insert task into tasks;
    task = new Task(5, "phd", 900000);
    insert task into tasks;
    task = new Task(6, "pause", 300000);
    insert task into tasks;
    task = new Task(7, "chinese", 900000);
    insert task into tasks;
    task = new Task(8, "lotary", 900000);
    insert task into tasks;
    task = new Task(9, "random", 900000);
    insert task into tasks;
    task = new Task(10, "pause", 600000);
    insert task into tasks;
    
    var chained = new ChainedTask(11, "chain", tasks);
    insert TaskModel {task: chained} into models;
    
    taskID = 12;

    var design = Main {};

    javafx.stage.Stage {
        title: "Main"
        scene: design.getDesignScene ()
    }
}

function openPopUp(message:String) {
    var popup = Popup {message: message};

    Stage {
            title: "Alarm!"
            scene: popup.getDesignScene()
        }
}

