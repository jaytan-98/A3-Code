float sky;
float car;
float x;
PImage clouds;

int darkBlue = #0f3057;
int darkOrange = #db6400;
int darkGreen = #206a5d; 
int lightBlue = #00587a; 
int lightOrange = #ffa62b;
int lightGreen = #499B8B;

ArrayList<Snowflake> listOfFlakes = new ArrayList<Snowflake>(); 
int numberOfFlakes = 100;


void setup() {
  size(600, 600);
  
  clouds = loadImage("clouds.png");
  frameRate(60); //Animation frames per second
  x = width;
  
 
  for (int iter = 0; iter<numberOfFlakes; iter++) {
    listOfFlakes.add(new Snowflake());
  }
}


void draw() {
 background(#1ADBEA);
  
  
 //Changes Background Color
 sky = map(mouseX, 0, height, 255, 0);
 background(sky, 200, 200, 170);

  
 //Mountain Rings
 noFill();
 strokeWeight(5); 
 float ringSize = constrain(mouseX, -0, 280); // Restrict ring size
  
 //Outer Ring
 stroke(#6d597a); 
 ellipse(510, 369, ringSize/1.2, ringSize/1.2);
 ellipse(41, 278, ringSize/1.2, ringSize/1.2);
  
 //Middle Ring
 stroke(#b56576);
 ellipse(510, 369, ringSize/1.6, ringSize/1.6);
 ellipse(41, 278, ringSize/1.6, ringSize/1.6);
  
 //Inner Ring
 stroke(#e56b6f);
 ellipse(510, 369, ringSize/2, ringSize/2);
 ellipse(41, 278, ringSize/2, ringSize/2);
  
  
 //Sun
 noStroke(); 
 float sunConstrainX = constrain(mouseX, 80, 520); // Restrict Sun movement 
  
 fill(255);
 ellipse(sunConstrainX, 100, 100, 100);
 fill(255, 180);
 ellipse(sunConstrainX, 100, 110, 110);
 fill(255, 150);
 ellipse(sunConstrainX, 100, 120, 120);
  
  
 //Eclipsing Circle
 noStroke(); 
 float eclipseI = width - mouseX; // Inverse mouseX
  
 fill(sky, 200, 200);
 ellipse(eclipseI, 100, 115, 115);
  
  
 //Mountain1
 fill(darkOrange);
 triangle(41, 254, -13, 500, -150, 500);
 fill(lightOrange);
 triangle(41, 254, -13, 500, 275, 500);
  
 //Mountain5
 fill(lightGreen);
 triangle(510, 366, 456, 500, 396, 500);
 fill(darkGreen);
 triangle(510, 366, 456, 500, 600, 500);
  
 //LargeMountain2
 fill(darkBlue);
 triangle(248, 158, 154, 500, -111, 500);
 fill(lightBlue);
 triangle(248, 158, 154, 500, 591, 500);
  
 //Mountain3
 fill(darkGreen);
 triangle(108, 350, 93, 500, -30, 500);
 fill(lightGreen);
 triangle(108, 350, 93, 500, 253, 500);
  
 //Mountain4
 fill(darkOrange);
 triangle(295, 323, 229, 500, 153, 500);
 fill(lightOrange);
 triangle(295, 323, 229, 500, 420, 500);
  
  
 //Animate Clouds
 x = x+1; 
 if (x >= width+50) {
   x = -200;
 }
  
 image(clouds, x-100, 250, 100, 40);
 image(clouds, x-2, 150, 200, 100);
 image(clouds, x+100, 260, 150, 60);
 image(clouds, x+150, 130, 120, 40);
  
  
 //Animate Car
 car = car + 1.5;
  
 if (car >= width+200) {
  car = 0;
 }
  
 fill(169, 169, 169);
 rect(car, 445, 15, 10);
  
 //Bridge
 fill(255, 150);
 rect(0, 428, 600, 2);
 fill(0);
 rect(0, 430, 600, 2);
 rect(0, 450, 600, 15);
 rect(10, 430, 5, 20);
 rect(40, 430, 5, 20);
 rect(70, 430, 5, 20);
 rect(100, 430, 5, 20);
 rect(130, 430, 5, 20);
 rect(160, 430, 5, 20);
 rect(190, 430, 5, 20);
 rect(220, 430, 5, 20);
 rect(250, 430, 5, 20);
 rect(280, 430, 5, 20);
 rect(310, 430, 5, 20);
 rect(340, 430, 5, 20);
 rect(370, 430, 5, 20);
 rect(400, 430, 5, 20);
 rect(430, 430, 5, 20);
 rect(460, 430, 5, 20);
 rect(490, 430, 5, 20);
 rect(520, 430, 5, 20);
 rect(550, 430, 5, 20);
 rect(580, 430, 5, 20);
  
 //Reflections
 fill(0);
 rect(0, 505, 600, 15);
 fill(255, 150);
 ellipse(370, 500, 100, 1);
 ellipse(570, 510, 100, 1);
 ellipse(140, 500, 100, 1);
 ellipse(360, 550, 100, 3);
 ellipse(400, 560, 50, 1);
 ellipse(150, 530, 50, 1);
  
 //Ground
 fill(#EDEFF7);
 ellipse(0, 500, 150, 75);
 ellipse(100, 500, 100, 30);
 ellipse(570, 500, 150, 100);
 ellipse(500, 500, 90, 50);
 
 //Lake
 fill(#51adcf, 200); 
 rect(0, 500, 600, 200);
  
  
 //SNOW
 for (int iter = 0; iter<listOfFlakes.size(); iter++){
  listOfFlakes.get(iter).renderSnowflake();
      
  if (listOfFlakes.get(iter).yPos >height){
   listOfFlakes.remove(iter);
    iter--;
    listOfFlakes.add(new Snowflake());
   }
  }
}
  
class Snowflake {
 float xPos, yPos, driftSpeed, fallSpeed;
  
 Snowflake(){
  xPos = random(-height/4,width);
  yPos = 0;
  driftSpeed = random(1, 3);
  fallSpeed = random(1, 5);
 }
  
 void renderSnowflake(){
  if (mousePressed == true) {
   noStroke();
   fill (255);
   ellipse(xPos, yPos, 5,5);
   yPos += fallSpeed;
   xPos += driftSpeed;
   } else {
    fill (sky, 200, 200); } 
  }
}
