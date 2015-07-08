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
  float attackScoreA = 0;
  int homeCorner1 = 0;
  int awayCorner1 = 0;
  int homeOffsides1 = 0;
  int awayOffsides1 = 0;
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
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
  }
    return attackScoreA;
}

void attackTeamARender() {
  
}
float attackTeamB() {
  float attackScoreB = 0;
  int homeCorner2 = 0;
  int awayCorner2 = 0;
  int homeOffsides2 = 0;
  int awayOffsides2 = 0;
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
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
  }
    return attackScoreB;
}

void attackTeamBRender() {
  
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
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
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
      defenceScoreA = 
    }
  }
    return attackScoreA;
}

void defenseTeamARender() {
  
}
float defenseTeamB() {
  float attackScoreB = 0;
  int homeCorner2 = 0;
  int awayCorner2 = 0;
  int homeOffsides2 = 0;
  int awayOffsides2 = 0;
  for(int i = 0; i<seasons.length; i++) {
    for(TableRow row : seasons[i].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamB))) {
         homeCorner2 = row.getInt("HC");
         homeOffsides2 = row.getInt("HF");
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
         awayCorner2 = row.getInt("AC");
         awayOffsides2 = row.getInt("AF");
      }
      attackScoreB = homeCorner2 + homeOffsides2 + awayCorner2 + awayOffsides2;
    }
  }
    return attackScoreB;
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
