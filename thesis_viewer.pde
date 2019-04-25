import processing.video.*;

Capture video;
PImage img;
PVector v1, origin;

int windowsize = 1000;

int Xposition = 0, Yposition = 0;
float scaleFactor = .01;

boolean scaleState = false;
boolean scaleDir = false;
boolean cursor = false;

void captureEvent(Capture video) {
  video.read();
}

void setup() {

  size(1000,1000);
  frameRate(60);
  video = new Capture(this, 640, 480);
  video.start();
  
  img = loadImage("bigthesis.png");
  loadPixels();
  
  origin = new PVector(windowsize/2, windowsize/2);
  v1 = new PVector(windowsize/2, windowsize/2); 

}

void draw(){

   println(mouseX,mouseY, scaleFactor);
  
   background(0);
   scaleFactor = constrain(scaleFactor,0.03,3.5);

    
        if (scaleFactor < 1.42){
     Xposition = constrain(Xposition,460,520);
     Yposition = constrain(Yposition,460,520);      
     }    
    
     if (scaleState == true){
   float n = .1*scaleFactor;
    
          if (scaleDir == false){
          scaleFactor-=n;
              }
              
          if (scaleDir == true){
          scaleFactor+=n;
              }
    }
  
    if (cursor == false){
  noCursor();
  }

   render();

}  

void render(){

  
  v1.set(mouseX, mouseY);
  v1.dist(origin);
  
  float shiftX = v1.x - origin.x; 
  float shiftY = v1.y - origin.y; 
  
  scale(scaleFactor);
  translate(shiftX*6, shiftY*6);
  
  Xposition = int((mouseX/scaleFactor-(img.height/2)));
  Yposition = int((mouseY/scaleFactor-(img.width/2)));

    image(video, Xposition+1080, Yposition+4500);
    image(img, Xposition, Yposition);

 
  
}
 
void mousePressed(){ 
  
    if(mousePressed && (mouseButton == RIGHT)){        
    scaleState = true;
    scaleDir = false;
  }
    
    if(mousePressed && (mouseButton == LEFT)){
    scaleState = true;
    scaleDir = true; 
    }
    
  }

void mouseReleased(){
  scaleState = false;
    }
