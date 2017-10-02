//circle dimensions
float ellipseX = 10;
float ellipseY = 10;
float ellipseDia = 20;

// circle speed
float[] ellipseXSpeed = new float [100]; 
float[] ellipseYSpeed = new float [100];

// 50+ circles array x and y position 
float[] xPos = new float[100];
float[] yPos = new float[100];


//display walls
float lineTop = 0;
float lineBottom = 400;
float lineLeft = 0;
float lineRight = 400;

void setup(){
  size(400,400);
  
  for( int i =0; i< 50; i++){
    xPos[i] = random(0,400);
    yPos[i] = random(0,400);
    ellipseXSpeed[i] = random(1, 10);
    ellipseYSpeed[i] = random(1, 10);
  }
}

void draw(){
  background(255);
  
  //rectangle
  fill(90, 10, 100);
  rect(150, 150, 80, 80);
  
  fill(219,112,147);
  
  for( int i = 0; i <50; i++){
    //making 50 circles appear and move about freely
    ellipse(xPos[i], yPos[i], ellipseDia, ellipseDia);
    xPos[i] += ellipseXSpeed[i];
    yPos[i] += ellipseYSpeed[i];
    
    //circle bouncing off walls
  if (yPos[i] > lineBottom) { // move up if you go passed the line
    ellipseYSpeed[i] *= -1;
    yPos[i] = lineBottom;
    }
  if( yPos[i] < lineTop){
    ellipseYSpeed[i] *= -1; // elyspeed multiply by -1 and asign it back to elyspeed
    yPos[i] = lineTop; 
    }
  if (xPos[i] > lineRight) { // move right if you go passed the line
    ellipseXSpeed[i] *= -1;
    xPos[i] = lineRight;
    }
  if( xPos[i] < lineLeft){
    ellipseXSpeed[i] *= -1;
    xPos[i] = lineLeft; 
    }
    
  // circles bounce off the inner box
    
  //top of box
  if(xPos[i] >= 150 && xPos[i] <= 230 && yPos[i]+10 >= 150){
    ellipseYSpeed[i] *= -1; 
  }
  //bottom of box
  if(xPos[i] <= 230 && xPos[i] >= 150 && yPos[i]-10 <= 230){
    ellipseYSpeed[i] *= -1;
  }
  //right of box
  if(yPos[i] >= 150 && yPos[i] <= 230 && xPos[i]-10 <= 230){
    ellipseXSpeed[i] *= -1;
  }
  //left of box
  if(yPos[i] >= 150 && yPos[i] <= 230 && xPos[i]+10 >= 150){
    ellipseXSpeed[i] *= -1;
  }
  
  }
  
}
//most of the 100 circles bounce off, but there is a glitch that I couldn't made some of the circles appear inside the square