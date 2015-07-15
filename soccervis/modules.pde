//Global Variables
float finesseRatioA,finesseRatioB;
float attackScoreA,attackScoreB;
float defenceScoreA,defenceScoreB;
float numGoalsA,numGoalsB;
float WLratioA, WLratioB;

//NUMBER OF SHOTS ON TARGET RATIO
//0.0 - 10.0
float finesseTeamA() {
  if(selectedSeason < 7) return 0.0;
  int totalShotsA = 0;
  int onTargetA = 0;
  int hs1 = 0;
  int homeOnTarget1 = 0;
  int aws1 = 0;
  int awayOnTarget1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         hs1 += row.getInt("HS");
         homeOnTarget1 += row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         aws1 += row.getInt("AS");
         awayOnTarget1 += row.getInt("AST");
      }
    }
    totalShotsA = hs1 + aws1;
    onTargetA = homeOnTarget1 + awayOnTarget1;
    shotsA = new float[2];
    shotsA[0] = ((float)(onTargetA))/totalShotsA;
    shotsA[1] = (float)(totalShotsA-onTargetA) / totalShotsA;
    finesseRatioA = ((float)(onTargetA))/totalShotsA;
    return finesseRatioA;
}

void finesseRender() {
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;
  if(selectedSeason < 7) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("DATA UNAVAILABLE", 1210,680); 
    noFill();
    pushMatrix();
    translate(0, height*2/5);
    textSize(15);
    textAlign(RIGHT);
    text("Finesse", localWidth*3-10, localHeight+20);
    rect(localWidth*2, localHeight, localWidth*3, localHeight*2);
    popMatrix();
    return;
  }
  pushMatrix();
  translate(0, height*2/5);
  
  textSize(15);
  textAlign(RIGHT);
  text("Finesse", localWidth*3-10, localHeight+20);
  rect(localWidth*2, localHeight, localWidth*3, localHeight*2);
  line(scale+25, 0+scale, scale+25, localHeight-scale);
  line(scale+25, localHeight-scale, localWidth-scale, localHeight-scale);
  
  //DRAW GOAL IMAGE
  translate(2*width/3.0 + 50, (height - height*2/5)/2.0);
  //grass
  fill(0.23, 0.58, 0.06,0.8);
  rect(0-scale*2,localHeight-(localHeight-(80+localHeight/5.0+61)),localWidth,localHeight-(80+localHeight/5.0+55));

  noFill();
  rect(90, 80, localWidth/5.0+110,localHeight/5.0+60);
  rect(100, 90, localWidth/5.0+90,localHeight/5.0+50);
  line(90, 80+localHeight/5.0+60 , 60, localHeight/5.0+170);
  line(60, localHeight/5.0+170,localWidth/5.0+235 , localHeight/5.0+170);
  line(localWidth/5.0+235 , localHeight/5.0+170,localWidth/5.0+200,80+localHeight/5.0+60);
  line(0-scale*2,(localHeight/2)+68,width,(localHeight/2)+68);
  line(59, 80+localHeight/5.0+62 , 0, localHeight/5.0+200);
  line(330,80+localHeight/5.0+62,localWidth-scale*3,localHeight/5.0+200 );

  ellipse((100+localWidth/5.0)-3, localHeight/5.0+180,5,5 );
    //outsideA
  fill(0.91,0.03,0.03,shotsA[1]);
  noStroke();
  rect(0-scale*2,0,(localWidth/2)+3,localHeight-163);
  rect(0-scale*2,localHeight-163,140,localHeight/5.0+60);
  //outsideB
  fill(0.03,0.03,0.91,shotsB[1]);
  rect((localWidth/2)-47, 0, localWidth/2, localHeight-163);
  rect(localWidth/5.0+200,localHeight-163, 200, localHeight/5.0+60);
  //insideA
  fill(0.91,0.03,0.03,shotsA[0]);
  rect(100, 90,(localWidth/5.0+90)/2,localHeight/5.0+50);
  //insideB
  fill(0.03,0.03,0.91,shotsA[0]);
  rect(100+(localWidth/5.0+90)/2, 90,(localWidth/5.0+90)/2,localHeight/5.0+50);
  noFill();
  stroke(0);
  popMatrix();
  //println("shots on target TEAM A" + shotsA[0] + "SHOTS OFFTARGET" + shotsA[1]);
}

float finesseTeamB() {
  if(selectedSeason < 7) return 0.0;
  int totalShotsB = 0;
  int onTargetB = 0;
  int hs2 = 0;
  int homeOnTarget2 = 0;
  int aws2 = 0;
  int awayOnTarget2 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
        hs2 += row.getInt("HS");
        homeOnTarget2 += row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        aws2 += row.getInt("AS");
        awayOnTarget2 += row.getInt("AST");
        }
      }
      totalShotsB = hs2 + aws2;
      onTargetB = homeOnTarget2 + awayOnTarget2;
      shotsB = new float[2];
      shotsB[0] = (float)(onTargetB)/totalShotsB;
      shotsB[1] = (float)(totalShotsB-onTargetB) / totalShotsB;
      finesseRatioB = ((float)onTargetB)/totalShotsB;
      return finesseRatioB;
      
}

//NUMBER OF CORNERS & OFFSIDES
//0.0 - 50.0
float attackTeamA() {
  if(selectedSeason < 7) return 0.0;
  float attackScoreA = 0;
  int homeCorner1 = 0;
  int awayCorner1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeCorner1 += row.getInt("HC");
         attackScoreA += row.getInt("HC");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayCorner1 += row.getInt("AC");
         attackScoreA += row.getInt("AC");
      }
    }

    attackA =  new float[1];
    attackA[0] = homeCorner1 + awayCorner1;
    
    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
        String homeName = row.getString("HomeTeam");
        String awayName = row.getString("AwayTeam");
        if(homeName.equals(teamList.get(i))) {
           temp += row.getInt("HC");
        } else if(awayName.equals(teamList.get(i))) {
           temp += row.getInt("AC");
        }
      }
      if(temp > max) max = temp;
      temp = 0;
    }
    if(max == 0) return 0.0;
    return attackScoreA/max;
}

void attackRender() {
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;
  if(selectedSeason < 7) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("DATA UNAVAILABLE", 1210,440); 
    noFill();
    pushMatrix();
    translate(0, height*2/5);
    textSize(15);
    textAlign(RIGHT);
    text("Attack", localWidth*3-10, 20);
    rect(localWidth*2, 0, localWidth, localHeight);
    popMatrix();
    return;
  }
  pushMatrix();
  translate(0, height*2/5);
  
  textSize(15);
  textAlign(RIGHT);
  fill(0);
  text("Attack", localWidth*3-10, 20);
  noFill();
  rect(localWidth*2, 0, localWidth, localHeight);
  line(scale+25 + localWidth*2, 0+scale, scale+25+ localWidth*2, localHeight-scale);
  line(scale+25+ localWidth*2, localHeight-scale, localWidth-scale+ localWidth*2, localHeight-scale);
  
  //X label
  for (float i=scale+25+localWidth*2, j=0; i <= localWidth-scale+localWidth*2; i+=((localWidth-scale+localWidth*2)-(scale+25+localWidth*2))/5, j+=5) {
    textSize(10);
    textAlign(CENTER);
    text(int(j), i, localHeight-scale + 15);
  }
  // Team label
//  textSize(10);
//  textAlign(LEFT);
//  text(teamList.get(selectedTeamA), 2*localWidth + 10, localHeight - 6*scale);
//  text(teamList.get(selectedTeamB), localWidth*2+10, localHeight - scale*4+7);
  // Team A 
  fill(0.91,0.03,0.03);
  rect(scale+25 + localWidth*2,scale*2,attackA[0],scale*2);
  noFill();

  
  // Team B
  fill(0.03,0.03,0.91);
  rect(scale+25 + localWidth*2,scale*5,attackB[0],scale*2);
  noFill();

  // Label Team A 
  fill(0);
  textSize(10);
  textAlign(CENTER,BOTTOM);
  rotate(-HALF_PI);
  text(teamList.get(selectedTeamA), -(localHeight - 6*scale -15 ), 2*localWidth + 10 + scale );
  text(teamList.get(selectedTeamB), -(localHeight - scale*4+7 +5), localWidth*2+10 +scale);
  
  popMatrix();
}
float attackTeamB() {
  if(selectedSeason < 7) return 0.0;
  float attackScoreB = 0;
  int homeCorner2 = 0;
  int awayCorner2 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeCorner2 += row.getInt("HC");
         attackScoreB += row.getInt("HC");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayCorner2 += row.getInt("AC");
         attackScoreB += row.getInt("AC");
      }
    }

    attackB =  new float[1];
    attackB[0] = homeCorner2 + awayCorner2;

    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
        String homeName = row.getString("HomeTeam");
        String awayName = row.getString("AwayTeam");
        if(homeName.equals(teamList.get(i))) {
           temp += row.getInt("HC");
        } else if(awayName.equals(teamList.get(i))) {
           temp += row.getInt("AC");
        }
      }
      if(temp > max) max = temp;
      temp = 0;
    }
    if(max == 0) return 0.0;
    return attackScoreB/max;
}

// NUMBER OF FOULS + CARDS
//0.0 - 100.0
float defenseTeamA() {
  if(selectedSeason < 7) return 0.0;
  float defenceScoreA = 0;
  int homeFouls1 = 0;
  int awayFouls1 = 0;
  int homeYC1 = 0;
  int awayYC1 = 0;
  int homeRC1 = 0;
  int awayRC1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeFouls1 += row.getInt("HF");
         homeYC1 += row.getInt("HY");
         homeRC1 += row.getInt("HR");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayFouls1 += row.getInt("AF");
         awayYC1 += row.getInt("AY");
         awayRC1 += row.getInt("AR");
      }
    }
    defenceScoreA = homeFouls1 + homeYC1 + homeRC1 + awayFouls1 + awayYC1 + awayRC1;
    defenceA = new float[3];
    defenceA[0] = homeFouls1 + awayFouls1;
    defenceA[1] = homeYC1 + awayYC1;
    defenceA[2] = homeRC1 + awayRC1;
    
    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
        String homeName = row.getString("HomeTeam");
        String awayName = row.getString("AwayTeam");
        if(homeName.equals(teamList.get(i))) {
           temp += row.getInt("HF");
           temp += row.getInt("HY");
           temp += row.getInt("HR");
        } else if(awayName.equals(teamList.get(i))) {
           temp += row.getInt("AF");
           temp += row.getInt("AY");
           temp += row.getInt("AR");
        }
      }
      if(temp > max) max = temp;
      temp = 0;
    }
    
    if(max == 0) return 0.0;
    return defenceScoreA/max;
}

void defenseRender() {
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;
  if(selectedSeason < 7) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("DATA UNAVAILABLE", 220,444); 
    noFill();
    pushMatrix();
    translate(0, height*2/5);
    textSize(15);
    textAlign(RIGHT);
    text("Defense", localWidth-10, 20);
    rect(0, 0, localWidth, localHeight);
    popMatrix();
    return;
  }
  pushMatrix();
  translate(0, height*2/5);
  textSize(15);
  textAlign(RIGHT);
  fill(0);
  text("Defense", localWidth-10, 20);
  noFill();
  rect(0, 0, localWidth, localHeight);
  line(scale+25, 0+scale, scale+25, localHeight-scale);
  line(scale+25, localHeight-scale, localWidth-scale, localHeight-scale);
  //println(defenceA[0]+ "   " + defenceA[1] + "   " +defenceA[2]);
  
  //X label
  for (float i=scale+25, j=0; i <= localWidth-scale; i+=(localWidth-2*scale-25)/8, j+=5) {
    textSize(10);
    textAlign(CENTER);
    text(int(j), i, localHeight-scale + 15);
  }
  

  
  //TeamA Yellow
  noFill();
  rect(scale+25,scale*2,defenceA[0]-(defenceA[0]/3),scale*2);
  fill(255, 255, 0);
  rect(scale+25,scale*2,defenceA[1]-(defenceA[1]/3),scale*2);
  fill(255, 0, 0);
  rect(scale+25+defenceA[1]-(defenceA[1]/3),scale*2,defenceA[2]-(defenceA[2]/3),scale*2);
  noFill(); 
  
  //TeamB Yellow
  rect(scale+25,scale*5,defenceB[0]-(defenceB[0]/3),scale*2);
  fill(255, 255, 0);
  rect(scale+25,scale*5,defenceB[1]-(defenceB[1]/3),scale*2);
  fill(255, 0, 0);
  rect(scale+25+defenceB[1]-(defenceB[1]/3),scale*5,defenceB[2]-(defenceA[2]/3),scale*2);
  noFill(); 
  // Label Team A 
  fill(0);
  textSize(10);
  textAlign(CENTER,BOTTOM);
  rotate(-HALF_PI);
  text(teamList.get(selectedTeamA), -(scale + scale*2), scale +10 );
  text(teamList.get(selectedTeamB), -(scale + scale*5), scale +10);
  popMatrix();
  textSize(10);
  textAlign(CENTER);
  text("Bookings + Fouls", 425, 535);
}
float defenseTeamB() {
  if(selectedSeason < 7) return 0.0;
  float defenceScoreB = 0;
  int homeFouls2 = 0;
  int awayFouls2 = 0;
  int homeYC2 = 0;
  int awayYC2 = 0;
  int homeRC2 = 0;
  int awayRC2 = 0;                                                                                      
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeFouls2 += row.getInt("HF");
         homeYC2 += row.getInt("HY");
         homeRC2 += row.getInt("HR");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayFouls2 += row.getInt("AF");
         awayYC2 += row.getInt("AY");
         awayRC2 += row.getInt("AR");
      }
    }
    defenceScoreB = homeFouls2 + homeYC2 + homeRC2 + awayFouls2 + awayYC2 + awayRC2;
    defenceB = new float[3];
    defenceB[0] = homeFouls2 + awayFouls2;
    defenceB[1] = homeYC2 + awayYC2;
    defenceB[2] = homeRC2 + awayRC2;
    
    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
        String homeName = row.getString("HomeTeam");
        String awayName = row.getString("AwayTeam");
        if(homeName.equals(teamList.get(i))) {
           temp += row.getInt("HF");
           temp += row.getInt("HY");
           temp += row.getInt("HR");
        } else if(awayName.equals(teamList.get(i))) {
           temp += row.getInt("AF");
           temp += row.getInt("AY");
           temp += row.getInt("AR");
        }
      }
      if(temp > max) max = temp;
      temp = 0;
    }

    if(max == 0) return 0.0;
    return defenceScoreB/max;
}

// NUMBER OF GOALS
//0.0 - 100.0
float entertainmentTeamA() {
  //if(selectedSeason < 7) return 0.0;
  float numGoalsA = 0;
  int awayGoals1 = 0;
  int homeGoals1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeGoals1 += row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayGoals1 += row.getInt("FTAG");
      }
    }
    numGoalsA = awayGoals1 + homeGoals1;
    goalsA = new float[2];
    goalsA[0] = homeGoals1;
    goalsA[1] = awayGoals1;
    
    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(i))) {
         temp += row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(i))) {
         temp += row.getInt("FTAG");
      }
    }
      if(temp > max) max = temp;
      temp = 0;
    }
    println(numGoalsA + " " + max);
    if(max == 0) return 0.0;
    return numGoalsA/max;
}

void entertainmentRender() {
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;
  /*if(selectedSeason < 7) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("DATA UNAVAILABLE",220,680);
    noFill();
    pushMatrix();
    translate(0, height*2/5);
    textSize(15);
    textAlign(RIGHT);
    text("Entertainment", localWidth-20, localHeight+20);
    rect(0,0, localWidth, localHeight*2);
    popMatrix();
    return;
  }*/
  pushMatrix();
  translate(0,  height - (height - height*2/5)/2.0);
  textSize(15);
  textAlign(RIGHT);
  fill(0);
  text("Entertainment", localWidth-20, 20);
  noFill();
  rect(0,0, localWidth, localHeight*2);
  line(scale+25, 0+scale, scale+25, localHeight-scale);  // y-axis
  line(scale+25, localHeight-scale, localWidth-scale, localHeight-scale);  // x-axis
  
  // X label
  for (float i=scale+25, j=0; i <= localWidth-scale; i+=(localWidth-2*scale-25)/11, j+=10) {
    textSize(10);
    textAlign(LEFT);
    text(int(j), i, localHeight-scale + 15);
  }
  // Drawing bar charts
  // Team A Chart
//  textSize(10);
//  textAlign(LEFT);
//  text(teamList.get(selectedTeamA), scale-15, scale*3+15);
  //text("Team B", scale-15, 6*scale+20 );
  fill(0.91,0.03,0.03);
  rect(scale+25,scale*2,goalsA[0]*2 + goalsA[1]*2,scale*2);
  noFill();
  
  // Team B Chart
  fill(0);
//  textSize(10);
//  textAlign(LEFT);
//  text(teamList.get(selectedTeamB), scale-15, scale*5.3+15);
  fill(0.03,0.03,0.91);
  rect(scale+25,scale*5.3,goalsA[0]*2 + goalsB[1]*2,scale*2);
  noFill();

// Label Team A 
  fill(0);
  textSize(10);
  textAlign(CENTER,BOTTOM);
  rotate(-HALF_PI);
  text(teamList.get(selectedTeamA), -(scale + scale*2), scale +10 );
  text(teamList.get(selectedTeamB), -(scale + scale*5 + 10), scale +10);
  popMatrix();
}

float entertainmentTeamB() {
  //if(selectedSeason < 7) return 0.0;
  float numGoalsB = 0;
  int awayGoals2 = 0;
  int homeGoals2 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeGoals2 += row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayGoals2 += row.getInt("FTAG");
      }
    }
    numGoalsB = awayGoals2 + homeGoals2;
    goalsB = new float[2];
    goalsB[0] = homeGoals2;
    goalsB[1] = awayGoals2;
    
    //Normalizer
    float max = 0;
    float temp = 0;
    for(int i = 0; i<teamList.size(); i++) {
      for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(i))) {
         temp += row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(i))) {
         temp += row.getInt("FTAG");
      }
    }
      if(temp > max) max = temp;
      temp = 0;
    }

    if(max == 0) return 0.0;
    return numGoalsB/max;
}

// WIN LOSS RATIO
//0.0 - 100.0
float successTeamA() {
  //if(selectedSeason < 7) return 0.0;
  int w = 0;
  int l = 0;
  int d = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")){
          w++;
        } else if(row.getInt("FTHG") < row.getInt("FTAG")){
          l++;
        } else if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")){
          w++;
        } else if(row.getInt("FTAG") < row.getInt("FTHG")){
          l++;
        } if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }
      }
    }
    if((w+l+d) != 0) WLratioA = ((float)w) / (w+l+d);
    else WLratioA = 0.0;
    winLossA = new float[3];
    winLossA[0] = w*10;
    winLossA[1] = l*10;
    winLossA[2] = d*10;
    return WLratioA;
}

void successRender() {
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;
  /*if(selectedSeason < 7) {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("DATA UNAVAILABLE",740,560);
    noFill();
    pushMatrix();
    translate(0, height*2/5);
    textSize(15);
    textAlign(RIGHT);
    text("Success", localWidth*2-10, scale);
    rect(0,0, localWidth, localHeight*2);
    popMatrix();
    return;*/
  rect(873,740,scale,scale);
  textSize(10);
  textAlign(CENTER);
  fill(0);
  text("W",885,755);
  noFill();
  rect(873,740-scale,scale,scale);
  text("D",884,729);
  rect(873,740-scale*2,scale,scale);
  noFill();

  pushMatrix();
  text("L",886,702);
  translate(0, height*2/5);
  //Y label
  float number_scale = (localHeight*2-2*scale)/8;
  for(float i=localHeight*2-scale, j=0; j<=40; i-=number_scale, j+=5) {
    textSize(10);
    textAlign(CENTER);
    text(int(j), localWidth+10, i); 
  }
  
  textSize(15);
  textAlign(RIGHT);
  fill(0);
  text("Success", localWidth*2-10, scale);
  noFill();
  rect(0, 0, localWidth, localHeight);
  line(localWidth + scale, localHeight*2-scale, localWidth+scale, scale); //y
  line(localWidth + scale, localHeight*2-scale, localWidth*2 - scale*5, localHeight*2-scale);//x
    // Team Label
  textSize(10);
  textAlign(CENTER);
  text(teamList.get(selectedTeamA), (localWidth + scale*4 + scale*2) - scale, localHeight*2-scale + 10 );
  text(teamList.get(selectedTeamB), (localWidth + scale*8 + scale*2) - scale, localHeight*2-scale + 10);


  //A
  fill(0.91, 0.03, 0.03);
  rect(localWidth + scale*4, localHeight*2-scale, scale*2, -winLossA[0]);
  //noFill();
  
  fill(0.97, 0.11, 0.11,0.7);
  rect(localWidth + scale*4, localHeight*2-scale - winLossA[0], scale*2, -winLossA[1]);
  //noFill();
  
  fill(0.98, 0.24, 0.24,0.5);
  rect(localWidth + scale*4, localHeight*2-scale - winLossA[0] - winLossA[1], scale*2, -winLossA[2]);
  //noFill();
  
  //B
  fill(0.03,0.03,0.91);
  rect(localWidth + scale*8, localHeight*2-scale, scale*2, -winLossB[0]);
  noFill();
  
  fill(0.11,0.11,0.97,0.7);
  rect(localWidth + scale*8, localHeight*2-scale - winLossB[0], scale*2, -winLossB[1]);
  noFill();
  
  fill(0.24,0.24,0.98,0.6);
  rect(localWidth + scale*8, localHeight*2-scale - winLossB[0] - winLossB[1], scale*2, -winLossB[2]);
  noFill();
  
  popMatrix();
}

float successTeamB() {
  //if(selectedSeason < 7) return 0.0;
  int w = 0;
  int l = 0;
  int d = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")){
          w++;
        } else if(row.getInt("FTHG") < row.getInt("FTAG")){
          l++;
        } else if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }

      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")){
          w++;
        } else if(row.getInt("FTAG") < row.getInt("FTHG")){
          l++;
        } else if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }
      }
    }
    if((w+l+d) != 0) WLratioB = ((float)w) / (w+l+d);
    else WLratioB = 0.0;
    winLossB = new float[3];
    winLossB[0] = w*10;
    winLossB[1] = l*10;
    winLossB[2] = d*10;
    return WLratioB;
}
