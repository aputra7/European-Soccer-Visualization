import controlP5.*; 
import java.util.ArrayList;
import java.util.Collections;


//Global variables
Table[] seasons;
DropdownList teamA, teamB, league;
int[] pointsA;      //for overview line charts
int[] pointsB;      //for overview line charts
int selectedLeague;  //YET TO BE IMPLEMENTED.
int selectedSeason; //0-21 where 1993/1994 = 0 and 2014/2015 = 21
int selectedTeamA;  //0-21 Corresponds to index of teamList
int selectedTeamB;  //0-21 Corresponds to index of teamList
ArrayList<String> teamList = new ArrayList<String>(); // List of team names

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
     
  controlP5.printPublicMethodsFor(Chart.class);
  Chart mychart = controlP5.addChart("hello")
               .setPosition((width/2) + 220 , height/2 + 200)
               .setSize(200, 200)
               .setRange(-20, 20)
               .setView(Chart.BAR) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               ;
               mychart.setData("a", ???);
               mychart.setStrokeWeight(1.5);
               mychart.setData("b", ???);
               
  populateList(teamA, "a");
  populateList(teamB, "b");
  populateList(league, "l");
  selectedTeamA = 0;
  selectedTeamB = 0;
  refreshOverview();
}

void draw(){
  background(color(1,1,1));
  refresh();
}

void refresh() {
  
  // Team Logos
  renderLogos();

  line(0, height*2/5, width, height*2/5);

  //Overview line charts
  overviewLineCharts();
  //finesseTeamB();
}





/*CONTROL P5 STUFF STARTS HERE*/
/*Do Not Modify*/
// Fills up the controlP5 dropdown list with the appropriate items.
void populateList(DropdownList ddl, String type) {
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
    refreshOverview();
    //dropdownListSelection[Integer.parseInt(theEvent.getGroup().toString().substring(0, 1))] = int(theEvent.getGroup().getValue());
  } 
  else if (theEvent.isController()) {
    //println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

// This is a slider Listener
void slider(int sliderVal) {
  selectedSeason = sliderVal - 1993;
}
