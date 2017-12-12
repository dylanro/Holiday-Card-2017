int daysTillChristmas() {
  if (month()==12) {
    return 25-day();
  }
  return 0;
}

class sunMoonRotation {
  float angle, sunx, suny, moonx, moony;
  int pathrad, sunrad, moonrad, hour;

  sunMoonRotation() {
    pathrad = 100;
    sunrad = 20;
    moonrad = 20;
    hour = hour();
  }

  void displayPath() {
    pushMatrix();
    translate(width/2, height/2);
    noFill();
    stroke(51, 51, 51, 100);
    strokeWeight(2);
    ellipse(0, 0, pathrad*2, pathrad*2);
    popMatrix();
  }

  void drawMoon() {
    pushMatrix();
    translate(width/2, height/2);
    fill(140);
    noStroke();
    moonx = pathrad*cos(radians(angle+180));//+180 moves it to the other side
    moony = pathrad*sin(radians(angle+180));
    ellipse(moonx, moony, moonrad*2, moonrad*2);
    fill(160);
    ellipse(moonx+6, moony, moonrad/2, moonrad/2);
    ellipse(moonx-6, moony-9, moonrad/2.5, moonrad/2.5);
    ellipse(moonx-7, moony+6, moonrad/3, moonrad/3);
    ellipse(moonx+2, moony+12, moonrad/5, moonrad/5);
    popMatrix();
  }

  void drawSun() {
    pushMatrix();
    translate(width/2, height/2);
    fill(#F7B633);
    noStroke();
    sunx = pathrad*cos(radians(angle));
    suny = pathrad*sin(radians(angle));
    ellipse(sunx, suny, sunrad*2, sunrad*2);
    translate(sunx, suny);
    for (int ang = 0; ang<360; ang+=45) {
      stroke(#F7B633);
      line(0, 0, (sunrad+10)*cos(radians(ang)), (sunrad+10)*sin(radians(ang)));
    }
    popMatrix();
  }

  void timeRotation() {
    angle = map(hour, 0, 21, 90, 360+45);
  }
}

void changeBackground() {
  int h = smr.hour;
  if (h == 1 || h == 2) {
    background(0, 57, 76);
  } else if (h == 3 || h == 4) {
    background(0, 76, 102);
  } else if (h == 5 || h == 6) {
    background(0, 114, 153);
  } else if (h == 7 || h == 8) {
    background(0, 152, 204);
  } else if (h == 9 || h == 10) {
    background(0, 171, 229);
  } else if (h == 11 || h == 12) {
    background(0, 191, 255);
  } else if (h == 13 || h == 14) {
    background(0, 171, 229);
  } else if (h == 15 || h == 16) {
    background(0, 152, 204);
  } else if (h == 17 || h == 18) {
    background(0, 114, 153);
  } else if (h == 19 || h == 20) {
    background(0, 76, 102);
  } else if (h == 21 || h == 0) {
    background(0, 38, 51);
  } else background(0);
}