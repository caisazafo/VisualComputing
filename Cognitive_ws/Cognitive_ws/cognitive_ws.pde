int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    circles();
    break;
  case 3:
    rounder();
    break;
  case 4:
    spiral();
    break;
  case 5:
    hypno();
    break;
  case 6:
    steps();
    break;
  case 7:
    gradiente();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion
 
/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}

int posX = 400, posY = 400;
//ILUSION 1
float r = 40, rd;
void circles(){
background(200);
rd = dist(0,0,mouseX,mouseY)/200;
for(int i =40; i > 0; i--){
if(i%2 == 0){
fill(255);
ellipse(posX - rd, posY, i*r, i*r);
}else{
fill(0);
ellipse(posX + rd, posY, i*r, i*r);
}
}
}

//ILUSION 2

void circle(int i){
  if(i == 15) return;
  fill(255, 255, 0);
  if(i%2==0){fill(0, 0, 255);}
  int j = (i > 7) ? -10 : 10;
  translate(j, 0);
  ellipse(0, 0, 260 - (i*20), 260 - (i*20));
  circle(i+1);
}

void rounder(){
  background(0);
  translate(width/2, height/2);
  rotate(frameCount/50.0f);
  circle(0);
}

//ILUSION 3
int c = 255;
float angle = 0;


void spiral() {
    background(0);
    translate(width / 2, height / 2);
    c = 255;
    float rSub = map(mouseX, 0, width, 5, 20);
    float aAdd = map(mouseY, 0, height, PI / 2.0, PI / 48.0);
    cic(width / 2, rSub, angle, aAdd); 
    angle += PI / 23.0;
}

void cic(float radius, float rSub, float angle, float aAdd) {
    pushMatrix();
    do {
        fill(c);
        c = 255 - c;
        ellipse(0, 0, radius * 2, radius * 2);
        radius -= rSub;
        angle += aAdd;
        float r = rSub * 0.6;
        float x = cos(angle + aAdd) * r;
        float y = sin(angle + aAdd) * r;
        translate(x, y);
    } while(radius >= 1);
    popMatrix();
}

//ILUSION 4


void hypno()
{
  background(0);
  noStroke();
  smooth();
  
  int layers = 80;
  
  for(int i=layers; i>0; i--)
  {
    if(i%2 == 0)
      fill(255);
    else
      fill(0);
      
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(0.1 * frameCount*(layers+1-i)));
    
    float delta = 10;
    polygon(3, 0, 0, i*delta);
    
    popMatrix();
  }
}

void polygon(int sides, float x, float y, float rad)
{
  beginShape();
  PVector orig = new PVector(x, y);
  for(int i=0; i<sides; i++)
  {
    float angle = i*360.0 / sides;
    PVector newPt = new PVector(orig.x + rad*sin(radians(angle)), orig.y + rad*cos(radians(angle)));
    vertex(newPt.x, newPt.y);
  }
  endShape();
}

//ILUSION 5


int a=80;
int b=40;
int s=0;

void steps() {
  background(255);
  if (b>=height-a/2) {
    s=1;
  }
  if (b==a/2) {
    s=0;
  }
  if (s==0) {
    b++;
  }
  else {
    b--;
  }
  //Stripes
  rectMode(CORNER);
  noStroke();
  fill(0);
  if(mousePressed == false) {
  for (int y=0; y<800; y=y+40) {
    rect(0, y, 800, 20);
  }
  }
  //Squares
  rectMode(CENTER);
  fill(0, 0, 30);
  rect(320, b, a, a);
  rect(640, b, a, a);
  fill(255, 255, 0);
  rect(160, b, a, a);
  rect(480, b, a, a);
}


//ILUSION 6


void gradiente() {
  float c = (cos(angle + PI/2) * width/2) + width/2;
  angle += 0.02;
  for (int i=0; i<510; i++) {
    stroke(i/2);
    line(i, 0, i, 800);
  }
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, c, 600);
  fill(150);
  rectMode(CENTER);
  rect(width/2, height/2, 300, 40);
}