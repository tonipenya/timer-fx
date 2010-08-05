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
import javafx.scene.input.MouseEvent;

/**
 * @author tonipenya
 */
var manager = new TimerManager();
var tasks: ITask[];
var models: TaskModel[];
var timeline = Timeline { repeatCount: Timeline.INDEFINITE
            keyFrames: [
                KeyFrame {
                    time: 1s
                    action: function() {
                        delete models;

                        for (task in tasks) {
                            var model = new Main.TaskModel();

                            if (manager.isTaskRunning(task)) {
                                model.label = "{task.getName()} {manager.getTimeRemaining(task)}";
                            } else {
                                model.label = "{task.getName()} {task.getInterval()}";

                            }

                            model.running = manager.isTaskRunning(task);
                            insert model into models;
                        }
                    }
                }
            ];
        };
var taskID = 0;

public class TaskModel {
    var label: String;
    var running: Boolean;

    function clicked(e: MouseEvent): Void {
        java.lang.System.out.println("clicked");
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
                            lstTimers.cellFactory = listCellFactory2;
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
    
    function listCellFactory2(): javafx.scene.control.ListCell {
        var listCell: javafx.scene.control.ListCell;
        
        def checkbox: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
            onMouseClicked: bind (listCell.item as TaskModel).clicked
            text: bind (listCell.item as TaskModel).label
            selected: bind (listCell.item as TaskModel).running with inverse
        }
        
        def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
            content: [ checkbox, ]
            spacing: 6.0
        }
        
        listCell = javafx.scene.control.ListCell {
            node: hbox2
        }
        
        return listCell
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
        insert new Task(taskID++, txtName.text, Long.parseLong(txtDelay.text)) into tasks;

        currentState.previous();
    }

}

function run (): Void {

    insert new Task(1, "task 1", 5000) into tasks;
    insert new Task(2, "task 2", 10000) into tasks;
    insert new Task(3, "task 3", 8000) into tasks;
    insert new Task(4, "task 4", 10000) into tasks;
    taskID = 5;

    manager.startTimer(tasks[0]);
    manager.startTimer(tasks[2]);

    timeline.play();


    var design = Main {};

    javafx.stage.Stage {
        title: "Main"
        scene: design.getDesignScene ()
    }
}
