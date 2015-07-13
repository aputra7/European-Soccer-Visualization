//Global Variables
float finesseRatioA,finesseRatioB;
float attackScoreA,attackScoreB;
float defenceScoreA,defenceScoreB;
float numGoalsA,numGoalsB;
float WLratioA, WLratioB;

//NUMBER OF SHOTS ON TARGET RATIO
//0.0 - 10.0
float finesseTeamA() {
  int totalShotsA = 0;
  int onTargetA = 0;
  int hs1 = 0;
  int homeOnTarget1 = 0;
  int aws1 = 0;
  int awayOnTarget1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      println(teamList.get(selectedTeamA));
      if(homeName.equals(teamList.get(selectedTeamA))) {
         hs1 = row.getInt("HS");
         homeOnTarget1 = row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         aws1 = row.getInt("AS");
         awayOnTarget1 = row.getInt("AST");
      }
      
    }
    totalShotsA = hs1 + aws1;
    onTargetA = homeOnTarget1 + awayOnTarget1;
    shotsA = new float[2];
    shotsA[0] = totalShotsA;
    shotsA[1] = onTargetA;
    finesseRatioA = onTargetA/totalShotsA;
    return finesseRatioA;
}

void finesseRender() {
  
}

float finesseTeamB() {
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
        hs2 = row.getInt("HS");
        homeOnTarget2 = row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        aws2 = row.getInt("AS");
        awayOnTarget2 = row.getInt("AST");
        }
      }
      totalShotsB = hs2 + aws2;
      onTargetB = homeOnTarget2 + awayOnTarget2;
      shotsB = new float[2];
      shotsB[0] = totalShotsB;
      shotsB[1] = onTargetB;
      finesseRatioB = onTargetB/totalShotsB;
      return finesseRatioB;
      
}

//NUMBER OF CORNERS & OFFSIDES
//0.0 - 50.0
float attackTeamA() {
  float attackScoreA = 0;
  int homeCorner1 = 0;
  int awayCorner1 = 0;
  int homeOffsides1 = 0;
  int awayOffsides1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeCorner1 = row.getInt("HC");
         homeOffsides1 = row.getInt("HO");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayCorner1 = row.getInt("AC");
         awayOffsides1 = row.getInt("AO");
      }
      attackScoreA = homeCorner1 + homeOffsides1 + awayCorner1 + awayOffsides1;
    }
    attackA =  new float[2];
    attackA[0] = homeCorner1 + awayCorner1;
    attackA[1] = homeOffsides1 + awayOffsides1;
    return attackScoreA;
}

void attackRender() {
  
}
float attackTeamB() {
  float attackScoreB = 0;
  int homeCorner2 = 0;
  int awayCorner2 = 0;
  int homeOffsides2 = 0;
  int awayOffsides2 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeCorner2 = row.getInt("HC");
         homeOffsides2 = row.getInt("HO");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayCorner2 = row.getInt("AC");
         awayOffsides2 = row.getInt("AO");
      }
      attackScoreB = homeCorner2 + homeOffsides2 + awayCorner2 + awayOffsides2;
    }
    attackB =  new float[2];
    attackB[0] = homeCorner2 + awayCorner2;
    attackB[1] = homeOffsides2 + awayOffsides2;
    return attackScoreB;
}

// NUMBER OF FOULS + CARDS
//0.0 - 100.0
float defenseTeamA() {
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
         homeFouls1 = row.getInt("HF");
         homeYC1 = row.getInt("HY");
         homeRC1 = row.getInt("HR");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayFouls1 = row.getInt("AF");
         awayYC1 = row.getInt("AY");
         awayRC1 = row.getInt("AR");
      }
    }
    defenceScoreA = homeFouls1 + homeYC1 + homeRC1 + awayFouls1 + awayYC1 + awayRC1;
    defenceA = new float[3];
    defenceA[0] = homeFouls1 + awayFouls1;
    defenceA[1] = homeYC1 + awayYC1;
    defenceA[2] = homeRC1 + awayRC1;
    return defenceScoreA;
}

void defenseRender() {
  pushMatrix();
  translate(0, height*2/5);
  float localWidth = width/3.0;
  float localHeight = (height - height*2/5)/2.0;
  float scale = 25;

  textSize(20);
  textAlign(RIGHT);
  text("Defense", localWidth-10, 20);
  rect(0, 0, localWidth, localHeight);
  line(scale+25, 0+scale, scale+25, localHeight-scale);
  line(scale+25, localHeight-scale, localWidth-scale, localHeight-scale);
  
  //TeamA Yellow
  rect(scale+25,scale+20,defenceA[0]*10,scale);
  fill(255, 255, 0);
  rect(scale+25,scale+20,defenceA[1]*10,scale);
  noFill(); 
  //TeamB Yellow
  rect(scale+25,scale+50,defenceB[0]*10,scale);
  fill(255, 255, 0);
  rect(scale+25,scale+50,defenceB[1]*10,scale);
  noFill(); 
  //TeamA Red
  rect(scale+25,scale+100,defenceA[0]*10,scale);
  fill(255, 0, 0);
  rect(scale+25,scale+100,defenceA[2]*10,scale);
  noFill(); 
  //TeamB Red
  rect(scale+25,scale+130,defenceB[0]*10,scale);
  fill(255, 0, 0);
  rect(scale+25,scale+130,defenceB[2]*10,scale);
  noFill(); 
  popMatrix();
}
float defenseTeamB() {
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
         homeFouls2 = row.getInt("HF");
         homeYC2 = row.getInt("HY");
         homeRC2 = row.getInt("HR");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayFouls2 = row.getInt("AF");
         awayYC2 = row.getInt("AY");
         awayRC2 = row.getInt("AR");
      }
      defenceScoreB = homeFouls2 + homeYC2 + homeRC2 + awayFouls2 + awayYC2 + awayRC2;
    }
    defenceB = new float[3];
    defenceB[0] = homeFouls2 + awayFouls2;
    defenceB[1] = homeYC2 + awayYC2;
    defenceB[2] = homeRC2 + awayRC2;
    return defenceScoreB;
}

// NUMBER OF GOALS
//0.0 - 100.0
float entertainmentTeamA() {
  //JOHN TODO
  float numGoalsA = 0;
  int awayGoals1 = 0;
  int homeGoals1 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeGoals1 = row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayGoals1 = row.getInt("FTAG");
      }
      numGoalsA = awayGoals1 + homeGoals1;
    }
    goalsA = new float[2];
    goalsA[0] = homeGoals1;
    goalsA[1] = awayGoals1;
    return numGoalsA;
}

void entertainmentRender() {
  
}
float entertainmentTeamB() {
  float numGoalsB = 0;
  int awayGoals2 = 0;
  int homeGoals2 = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeGoals2 = row.getInt("FTHG");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayGoals2 = row.getInt("FTAG");
      }
      numGoalsB = awayGoals2 + homeGoals2;
    }
    goalsB = new float[2];
    goalsB[0] = homeGoals2;
    goalsB[1] = awayGoals2;
    return numGoalsB;
}

// WIN LOSS RATIO
//0.0 - 100.0
float successTeamA() {
  int w = 0;
  int l = 0;
  int d = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")){
          w++;
        } else if(row.getInt("FTHG") > row.getInt("FTAG")){
          l++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")){
          w++;
        } else if(row.getInt("FTAG") > row.getInt("FTHG")){
          l++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }
      }
    }
    WLratioA = w / (w+l+d);
    winLossA = new float[3];
    winLossA[0] = w;
    winLossA[1] = l;
    winLossA[2] = d;
    return WLratioA;
}

void successRender() {
  
}

float successTeamB() {
  int w = 0;
  int l = 0;
  int d = 0;
    for(TableRow row : seasons[selectedSeason].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")){
          w++;
        } else if(row.getInt("FTHG") > row.getInt("FTAG")){
          l++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")){
          w++;
        } else if(row.getInt("FTAG") > row.getInt("FTHG")){
          l++;
        }
      }else if(awayName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTAG") == row.getInt("FTHG")){
          d++;
        }
      }
    }
    WLratioB = w / (w+l+d);
    winLossB = new float[3];
    winLossB[0] = w;
    winLossB[1] = l;
    winLossB[2] = d;
    return WLratioB;
}
