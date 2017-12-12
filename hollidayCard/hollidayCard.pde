ArrayList<light> lights;
ArrayList<snowflake> snowflakes;
PFont christmasfont1;
PFont christmasfont2;
sunMoonRotation smr;

void setup() {
  size(1000, 400);
  christmasfont1 = createFont("Miraculous&Christmas.ttf", 64);
  christmasfont2 = createFont("PWHappyChristmas.ttf", 64);

  lights = new ArrayList<light>();
  snowflakes = new ArrayList<snowflake>();
  smr = new sunMoonRotation();

  for (int i = 0; i<180; i++) {
    snowflakes.add(new snowflake());
  }

  lights.add(new light(207, 242));
  lights.add(new light(262, 250));
  lights.add(new light(277, 192));
  lights.add(new light(237, 204));
  lights.add(new light(254, 151));
  lights.add(new light(255, 101));
}

void draw() {
  changeBackground();
  christmasTree(250, 50);
  present(173, 305);
  snowman(400, 250);

  smr.displayPath();
  smr.drawSun();
  smr.drawMoon();
  smr.timeRotation();

  for (snowflake s : snowflakes) {
    s.display();
    s.fall();
    s.revert();
  }

  fill(255);
  textFont(christmasfont2);
  text(daysTillChristmas()+"", 517, 100);
  textFont(christmasfont1);
  text(" days & until Christmas!", 580, 100);
}

void mouseClicked() {
  System.out.println(hour());
}