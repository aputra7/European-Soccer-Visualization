void importData(String code) {
  seasons[0] = loadTable("data/" + code + "93-94.csv","header, csv");
  seasons[1] = loadTable("data/" + code + "94-95.csv","header, csv");
  seasons[2] = loadTable("data/" + code + "95-96.csv","header, csv");
  seasons[3] = loadTable("data/" + code + "96-97.csv","header, csv");
  seasons[4] = loadTable("data/" + code + "97-98.csv","header, csv");
  seasons[5] = loadTable("data/" + code + "98-99.csv","header, csv");
  seasons[6] = loadTable("data/" + code + "99-00.csv","header, csv");
  seasons[7] = loadTable("data/" + code + "00-01.csv","header, csv");
  seasons[8] = loadTable("data/" + code + "01-02.csv","header, csv");
  seasons[9] = loadTable("data/" + code + "02-03.csv","header, csv");
  seasons[10] = loadTable("data/" + code + "03-04.csv","header, csv");
  seasons[11] = loadTable("data/" + code + "04-05.csv","header, csv");
  seasons[12] = loadTable("data/" + code + "05-06.csv","header, csv");
  seasons[13] = loadTable("data/" + code + "06-07.csv","header, csv");
  seasons[14] = loadTable("data/" + code + "07-08.csv","header, csv");
  seasons[15] = loadTable("data/" + code + "08-09.csv","header, csv");
  seasons[16] = loadTable("data/" + code + "09-10.csv","header, csv");
  seasons[17] = loadTable("data/" + code + "10-11.csv","header, csv");
  seasons[18] = loadTable("data/" + code + "11-12.csv","header, csv");
  seasons[19] = loadTable("data/" + code + "12-13.csv","header, csv");
  seasons[20] = loadTable("data/" + code + "13-14.csv","header, csv");
  seasons[21] = loadTable("data/" + code + "14-15.csv","header, csv");
}

void refreshOverview() {
  for(int i = 0; i<seasons.length; i++) {
    int pointsforA = 0;
    int pointsforB = 0;
    for(TableRow row : seasons[i].rows()) {
      String homeName = row.getString("HomeTeam");
      String awayName = row.getString("AwayTeam");
      if(homeName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")) {
          pointsforA += 3;
        } else if(row.getInt("FTHG") == row.getInt("FTAG")) {
          pointsforA++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamA))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")) {
          pointsforA += 3;
        } else if(row.getInt("FTAG") == row.getInt("FTHG")) {
          pointsforA++;
        }
      }
      
      if(homeName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTHG") > row.getInt("FTAG")) {
          pointsforB += 3;
        } else if(row.getInt("FTHG") == row.getInt("FTAG")) {
          pointsforB++;
        }
      } else if(awayName.equals(teamList.get(selectedTeamB))) {
        if(row.getInt("FTAG") > row.getInt("FTHG")) {
          pointsforB += 3;
        } else if(row.getInt("FTAG") == row.getInt("FTHG")) {
          pointsforB++;
        }
      }
    }
    pointsA[i] = pointsforA;
    pointsB[i] = pointsforB;
  }
}

void overviewLineCharts() {
  int w = 400;
  int h = 150;
  int x1 = (width/6)-w/2;
  int y = 140;
  int x2 = (width*5/6)-w/2;

  stroke(0);
  for(int i = 0; i<21; i++) {
    //A
    int xPos1 = (int)((w/22.0*i) + x1);
    int yPos1 = (int)((1-(pointsA[i]/100.0))*h + y);
    int xPos2 = (int)((w/22.0*(i+1)) + x1);
    int yPos2 = (int)((1-(pointsA[(i+1)]/100.0))*h + y);
    fill(255, 0, 0);
    ellipse(xPos1, yPos1, 5, 5);
    ellipse(xPos2, yPos2, 5, 5);
    line(xPos1, yPos1, xPos2, yPos2);
    //B
    xPos1 = (int)((w/22.0*i) + x2);
    yPos1 = (int)((1-(pointsB[i]/100.0))*h + y);
    xPos2 = (int)((w/22.0*(i+1)) + x2);
    yPos2 = (int)((1-(pointsB[(i+1)]/100.0))*h + y);
    fill(0, 0, 255);
    ellipse(xPos1, yPos1, 5, 5);
    ellipse(xPos2, yPos2, 5, 5);
    line(xPos1, yPos1, xPos2, yPos2);
  }
  
  textAlign(RIGHT);
  textSize(9);
  fill(0);
  for(int i = 0; i<10; i++) {
    int yPos = (int)((1-(i/10.0))*h + y);
    text(""+(i*10), x1 - 5, yPos);
    text(""+(i*10), x2 - 5, yPos);
  }
  textAlign(CENTER);
  for(int i = 0; i<22; i++) {
    int xPos1 = (int)((w/22.0*i) + x1);
    int xPos2 = (int)((w/22.0*i) + x2);
    String year = ""+(93+i);
    year = year.substring(year.length()-2, year.length());
    text(year, xPos1, y + h + 10);
    text(year, xPos2, y + h+ 10);
  }
  noFill();
  rect(x1, y, w, h);
  rect(x2, y, w, h);
}

void renderLogos() {
  rect((width/6)-50, 30, 100, 100);
  rect((width*5/6)-50, 30, 100, 100);
}