//NUMBER OF SHOTS ON TARGET RATIO
//0.0 - 50.0
float finesseTeamA() {
  float ratio = 0;
  int totalShotsA = 0;
  int onTargetA = 0;
  int hs1 = 0;
  int homeOnTarget1 = 0;
  int aws1 = 0;
  int awayOnTarget1 = 0;
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
         hs1 = row.getInt("HS");
         homeOnTarget1 = row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         aws1 = row.getInt("AS");
         awayOnTarget1 = row.getInt("AST");
      }
      totalShotsA = hs1 + aws1;
      onTargetA = homeOnTarget1 + awayOnTarget1;
      ratio = onTargetA/totalShotsA;
    }
  }
    return ratio;
}

void finesseTeamARender() {
  
}
float finesseTeamB() {
  float ratio = 0;
  int totalShotsB = 0;
  int onTargetB = 0;
  int hs2 = 0;
  int homeOnTarget2 = 0;
  int aws2 = 0;
  int awayOnTarget2 = 0;
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
        hs2 = row.getInt("HS");
        homeOnTarget2 = row.getInt("HST");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        aws2 = row.getInt("AS");
        awayOnTarget2 = row.getInt("AST");
        }
       totalShotsB = hs2 + aws2;
       onTargetB = homeOnTarget2 + awayOnTarget2;
      }
      ratio = onTargetB/totalShotsB;
  }
  println(ratio);
      return ratio;
      
}

void finesseTeamBRender() {
  
}
//NUMBER OF CORNERS & OFFSIDES
//0.0 - 50.0
float attackTeamA() {
  return 0;
}

void attackTeamARender() {
  
}
float attackTeamB() {
  return 0;
}

void attackTeamBRender() {
  
}
// NUMBER OF FOULS + CARDS
//0.0 - 100.0
float defenseTeamA() {
  return 0;
}

void defenseTeamARender() {
  
}
float defenseTeamB() {
  return 0;
}

void defenseTeamBRender() {
  
}
// NUMBER OF GOALS
//0.0 - 100.0
float entertainmentTeamA() {
  return 0;
}

void entertainmentTeamARender() {
  
}
float entertainmentTeamB() {
  return 0;
}

void entertainmentTeamBRender() {
  
}
// WIN LOSS RATIO
//0.0 - 100.0
float successTeamA() {
  return 0;
}

void successTeamARender() {
  
}
float successTeamB() {
  return 0;
}

void successTeamBRender() {
  
}

//0.0 - 100.0
float module6Update() {
  return 0;
}

void module6Render() {
  
}
