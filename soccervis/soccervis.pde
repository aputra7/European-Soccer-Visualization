import controlP5.*; 
import java.util.ArrayList;
import java.util.Collections;


//Global variables
Table[] seasons;
DropdownList teamA, teamB, league;
int[] pointsA;      //for overview line charts
int[] pointsB;      //for overview line charts
int selectedLeague = 0;  //YET TO BE IMPLEMENTED.
int selectedSeason = 21; //0-21 where 1993/1994 = 0 and 2014/2015 = 21
int selectedTeamA;  //0-21 Corresponds to index of teamList
int selectedTeamB;  //0-21 Corresponds to index of teamList
ArrayList<String> teamList = new ArrayList<String>(); // List of team names
boolean isSliderListenerReady = false;
float[] pentagonValues; //0-10 A,B,A,B,A,B...

//Global variables for modules
float[] shotsA;
float[] shotsB;

//[0] = corners , [1] = offsides
float[] attackA;
float[] attackB;

//[0] = fouls, [1] = yc, [2] = rc
float[] defenceA;
float[] defenceB;

//[0] = homeGoals, [1] = awayGoals
float[] goalsA;
float[] goalsB;

//[0] = win, [1] = loss [2] = draw
float[] winLossA;
float[] winLossB;

void setup(){
  //Set up the window
  size(1440, 810); // 16:9 aspect ratio
  colorMode(RGB, 1);
  background(color(1,1,1));
  
  // Import data
  seasons = new Table[22];
  pointsA = new int[22];
  pointsB = new int[22];
  importData("E"); // 'E' for English Premier League

  //controlP5
  ControlP5 controlP5 = new ControlP5(this);
  teamA = controlP5.addDropdownList("0", (width/6)-100, 20, 200, 200);
  teamB = controlP5.addDropdownList("1", (width*5/6)-100, 20, 200, 200);
  league = controlP5.addDropdownList("2", (width/2)-75, 20, 150, 200);
  controlP5.addSlider("slider")
     .setPosition((width/2)-220,300)
     .setWidth(440)
     .setRange(1993,2014)
     .setValue(2014)
     .setNumberOfTickMarks(22)
     .setSliderMode(Slider.FLEXIBLE)
     ;         
  populateList(teamA, "a");
  populateList(teamB, "b");
  populateList(league, "l");
  selectedTeamA = 0;
  selectedTeamB = 0;
  selectedSeason = 21;
  selectedLeague = 0;
  isSliderListenerReady = true;
  pentagonValues = new float[10];
  refreshOverview();
  updateModules();
}

void draw(){
  background(color(1,1,1));
  refresh();
}

void refresh() {
  
  // Team Logos
  renderLogos();
  renderPentagon();
  line(0, height*2/5, width, height*2/5);

  //Overview line charts
  overviewLineCharts();
  finesseRender();
  attackRender();
  defenseRender();
  entertainmentRender();
  successRender();
}





/*CONTROL P5 STUFF STARTS HERE*/
/*Do Not Modify*/
// Fills up the controlP5 dropdown list with the appropriate items.
void populateList(DropdownList ddl, String type) {
  ddl.clear();
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("Select Team");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  
  if(type.equals("a") || type.equals("b")) {
    teamList = new ArrayList<String>();
    for(TableRow row : seasons[selectedSeason].rows()) {
      String name = row.getString("HomeTeam");
      if(!teamList.contains(name)) {
        teamList.add(name);
      }
    }
    Collections.sort(teamList);
    for(int i = 0; i<teamList.size(); i++) {
      ddl.addItem(teamList.get(i), i);
    }
  } else if(type.equals("l")) {
    ddl.captionLabel().set("Select League");
    ddl.addItem("English Premier League", 0);
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

// This is a control P5's dropdown list handler
void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    int whichDropDownList = Integer.parseInt(theEvent.getGroup().toString().substring(0, 1));
    if(whichDropDownList == 0) {
      selectedTeamA = (int)theEvent.getGroup().getValue();
    } else if(whichDropDownList == 1) {
      selectedTeamB = (int)theEvent.getGroup().getValue();
    }
    populateList(teamA, "a");
    populateList(teamB, "b");
    populateList(league, "l");
    updateModules();
    refreshOverview();
    //dropdownListSelection[Integer.parseInt(theEvent.getGroup().toString().substring(0, 1))] = int(theEvent.getGroup().getValue());
  } 
  else if (theEvent.isController()) {
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

// This is a slider Listener
void slider(int sliderVal) {
  if(selectedSeason != (sliderVal - 1993)) {
    selectedSeason = sliderVal - 1993;
    if(isSliderListenerReady) {
      updateModules();
      populateList(teamA, "a");
      populateList(teamB, "b");
      populateList(league, "l");
    }
  }
}

void updateModules() {
  pentagonValues[0] = finesseTeamA();
  pentagonValues[1] = finesseTeamB();
  pentagonValues[2] = attackTeamA();
  pentagonValues[3] = attackTeamB();
  pentagonValues[4] = defenseTeamA();
  pentagonValues[5] = defenseTeamB();
  pentagonValues[6] = entertainmentTeamA();
  pentagonValues[7] = entertainmentTeamB();
  pentagonValues[8] = successTeamA();
  pentagonValues[9] = successTeamB();
}

void mousePressed(){
  //Unprojection to find 3D click ray
   println("The mouse button " + mouseButton + " was pressed. You mouseClickCheck pixel (" + mouseX + "," + mouseY + ").");
}
