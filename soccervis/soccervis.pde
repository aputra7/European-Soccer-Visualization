import controlP5.*; 
import java.util.List;
import java.util.Collections;


//Global variables
Table t;
float yMax;
List<HashMap<String, Integer>> categories  = new ArrayList<HashMap<String, Integer>>();
int[] dropdownListSelection = new int[3];
DropdownList categoricalAtt, quantitativeAtt, barStyle;

void setup(){
  //Set up the window
  size(1280,720);
  colorMode(RGB, 1);
  background(color(1,1,1));

  //controlP5
  ControlP5 controlP5 = new ControlP5(this);
  categoricalAtt = controlP5.addDropdownList("0", 820, 175, 100, 200);
  quantitativeAtt = controlP5.addDropdownList("1", 945, 175, 100, 200);
  barStyle = controlP5.addDropdownList("2", 1070, 175, 100, 200);
  populateList(categoricalAtt, "c");
  populateList(quantitativeAtt, "q");
  populateList(barStyle, "b");
}

void draw(){
  background(color(1,1,1));
  refresh();
}

void refresh() {
  

  
}
//end of refresh function.


// Fills up the controlP5 dropdown list with the appropriate items.
void populateList(DropdownList ddl, String type) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("dropdown");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  if(type.equals("c")) {
    ddl.addItem("region", 0);
    ddl.addItem("state", 1);
    ddl.addItem("category", 2);
    ddl.addItem("type", 3);
    ddl.addItem("caffeination", 4);
  } else if(type.equals("q")) {
    ddl.addItem("sales", 0);
    ddl.addItem("profit", 1);
  } else if(type.equals("b")) {
    ddl.addItem("Baseline", 0);
    ddl.addItem("Rounded tops", 1);
    ddl.addItem("Triangle", 2);
    ddl.addItem("Capped", 3);
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

// This is a control P5's dropdown list handler
void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    //dropdownListSelection[Integer.parseInt(theEvent.getGroup().toString().substring(0, 1))] = int(theEvent.getGroup().getValue());
  } 
  else if (theEvent.isController()) {
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}
