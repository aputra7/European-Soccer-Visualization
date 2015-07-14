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

  if(selectedSeason == 21) {
    stroke(255, 255, 0);
    fill(255, 0, 0);
    textSize(11);
    text(str(pointsA[21]), 421+10, y);
    line(421, y, 421, y+h);
    fill(0, 0, 255);
    textSize(11);
    text(str(pointsB[21]), 1381+10, y);
    line(1381, y, 1381, y+h);
  }
  stroke(0);
  for(int i = 0; i<21; i++) {
    //A
    int xPos1 = (int)((w/22.0*i) + x1);
    int yPos1 = (int)((1-(pointsA[i]/100.0))*h + y);
    int xPos2 = (int)((w/22.0*(i+1)) + x1);
    int yPos2 = (int)((1-(pointsA[(i+1)]/100.0))*h + y);
    if(i == selectedSeason) {
      stroke(255, 255, 0);
      line(xPos1, y, xPos1, y+h);
      stroke(0);
      fill(255, 0, 0);
      textSize(11);
      text(str(pointsA[i]), xPos1+10, max(yPos1-25, y));
    }
    fill(255, 0, 0);
    line(xPos1, yPos1, xPos2, yPos2);
    ellipse(xPos1, yPos1, 5, 5);
    ellipse(xPos2, yPos2, 5, 5);
    

    //B
    xPos1 = (int)((w/22.0*i) + x2);
    yPos1 = (int)((1-(pointsB[i]/100.0))*h + y);
    xPos2 = (int)((w/22.0*(i+1)) + x2);
    yPos2 = (int)((1-(pointsB[(i+1)]/100.0))*h + y);
    if(i == selectedSeason) {
      stroke(255, 255, 0);
      line(xPos1, y, xPos1, y+h);
      stroke(0);
      fill(0, 0, 255);
      textSize(10);
      text(str(pointsB[i]), xPos1+10, max(yPos1-25, y));
    }
    fill(0, 0, 255);
    line(xPos1, yPos1, xPos2, yPos2);
    ellipse(xPos1, yPos1, 5, 5);
    ellipse(xPos2, yPos2, 5, 5);
    
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

void renderPentagon() {
  pushMatrix();
  stroke(0);
  float lineLength = 125;
  float pentagonAngle = -(2*PI)/5.0; //Counter clockwise
  translate(width/2.0, (height*2/5)/2.0 + 10);

  pushMatrix();
  rotate(-PI/2.0);
  noFill();
  line(0, 0, lineLength, 0);
  rotate(pentagonAngle);
  line(0, 0, lineLength, 0);
  rotate(pentagonAngle);
  line(0, 0, lineLength, 0);
  rotate(pentagonAngle);
  line(0, 0, lineLength, 0);
  rotate(pentagonAngle);
  line(0, 0, lineLength, 0);
  popMatrix();
  
  beginShape();
  vertex(sin(PI)*lineLength, cos(PI)*lineLength);
  vertex(sin(PI - pentagonAngle)*lineLength, cos(PI - pentagonAngle)*lineLength);
  vertex(sin(PI - pentagonAngle*2)*lineLength, cos(PI - pentagonAngle*2)*lineLength);
  vertex(sin(PI - pentagonAngle*3)*lineLength, cos(PI - pentagonAngle*3)*lineLength);
  vertex(sin(PI - pentagonAngle*4)*lineLength, cos(PI - pentagonAngle*4)*lineLength);
  endShape(CLOSE);
  
  noStroke();
  fill(255, 0, 0, 0.5);
  //TEAM A
  beginShape();
  vertex(sin(PI)*lineLength*pentagonValues[0], cos(PI)*lineLength*pentagonValues[0]);
  vertex(sin(PI - pentagonAngle)*lineLength*pentagonValues[2], cos(PI - pentagonAngle)*lineLength*pentagonValues[2]);
  vertex(sin(PI - pentagonAngle*2)*lineLength*pentagonValues[4], cos(PI - pentagonAngle*2)*lineLength*pentagonValues[4]);
  vertex(sin(PI - pentagonAngle*3)*lineLength*pentagonValues[6], cos(PI - pentagonAngle*3)*lineLength*pentagonValues[6]);
  vertex(sin(PI - pentagonAngle*4)*lineLength*pentagonValues[8], cos(PI - pentagonAngle*4)*lineLength*pentagonValues[8]);
  endShape(CLOSE);
  //TEAM B
  fill(0, 0, 255, 0.5);
  beginShape();
  vertex(sin(PI)*lineLength*pentagonValues[1], cos(PI)*lineLength*pentagonValues[1]);
  vertex(sin(PI - pentagonAngle)*lineLength*pentagonValues[3], cos(PI - pentagonAngle)*lineLength*pentagonValues[3]);
  vertex(sin(PI - pentagonAngle*2)*lineLength*pentagonValues[5], cos(PI - pentagonAngle*2)*lineLength*pentagonValues[5]);
  vertex(sin(PI - pentagonAngle*3)*lineLength*pentagonValues[7], cos(PI - pentagonAngle*3)*lineLength*pentagonValues[7]);
  vertex(sin(PI - pentagonAngle*4)*lineLength*pentagonValues[9], cos(PI - pentagonAngle*4)*lineLength*pentagonValues[9]);
  endShape(CLOSE);
  noFill();
  stroke(0);
  popMatrix();
}

void renderLogos() {
  rect((width/6)-50, 30, 100, 100);
  rect((width*5/6)-50, 30, 100, 100);
}
