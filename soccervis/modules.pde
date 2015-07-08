//NUMBER OF SHOTS ON TARGET RATIO
//0.0 - 1.0
float finesseTeamA() {
  float ratio = 0;
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
       totalShotsB = hs2 + aws2;
       onTargetB = homeOnTarget2 + awayOnTarget2;
      }
      ratio = onTargetB/totalShotsB;
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
      defenceScoreA = homeFouls1 + homeYC1 + homeRC1 + awayFouls1 + awayYC1 + awayRC1;
    }
    return defenceScoreA;
}

void defenseTeamARender() {
  
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
      if(homeName.equals(teamList.get(selectedTeamA))) {
         homeFouls2 = row.getInt("HF");
         homeYC2 = row.getInt("HY");
         homeRC2 = row.getInt("HR");
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
         awayFouls2 = row.getInt("AF");
         awayYC2 = row.getInt("AY");
         awayRC2 = row.getInt("AR");
      }
      defenceScoreB = homeFouls2 + homeYC2 + homeRC2 + awayFouls2 + awayYC2 + awayRC2;
    }
    return defenceScoreB;
}

void defenseTeamBRender() {
  
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
    return numGoalsA;
}

void entertainmentTeamARender() {
  
}
float entertainmentTeamB() {
  //JOHN TODO
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
      numGoalsB = awayGoals2 + homeGoalS2;
    }
    return numGoalsA;
}

void entertainmentTeamBRender() {
  
}
// WIN LOSS RATIO
//0.0 - 100.0
float successTeamA() {
  float WLratio = 0;
  int w = 0;
  int l = 0;
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
    return numGoalsA;
}

void successTeamARender() {
  
}
float successTeamB() {
  
}

void successTeamBRender() {
  
}

//0.0 - 100.0
float module6Update() {
  return 0;
}

void module6Render() {
  
}
