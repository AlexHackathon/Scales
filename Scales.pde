import processing.serial.*;
int shifted;
void setup(){
  size(500,500);
  shifted = 0;
}
void draw(){
  background(44,255,169);
  if(shifted == 0){
    drawScaleShifted(10);
  } else if(shifted == 1){
    drawScaleNotShifted(10);
  } else {
    noLoop();
    drawScaleRandom(10);
  }
}
void mouseClicked(){
  System.out.println("Hi");
  if(shifted <= 1){
    shifted += 1;
  } else {
    shifted = 0;
  }
  loop();
}
void drawScaleShifted(int baseUnit){
  for(int y = 0; y< 26; y++){
    for(int x = 0; x< 13; x++){
      if(y%2 == 0){
        drawScale(x*4*baseUnit + 2*baseUnit,y*4*baseUnit,baseUnit);
      } else {
        drawScale(x*4*baseUnit, y*4*baseUnit, baseUnit);
      }
    }
  }
}
void drawScaleNotShifted(int baseUnit){
  for(int y = 0; y< 13; y++){
    for(int x = 0; x< 13; x++){
      if(y%2 == 0){
        drawScale(x*4*baseUnit,y*8*baseUnit,baseUnit);
      } else {
        drawScale(x*4*baseUnit, y*8*baseUnit, baseUnit);
      }
    }
  }
}
void drawScaleRandom(int baseUnitPos){
  float baseUnitScale;
  for(int y = 0; y< 26; y++){
    for(int x = 0; x< 13; x++){
      baseUnitScale = (float)(7 + Math.random()*6);
      if(y%2 == 0){
        drawScale(x*4*baseUnitPos + 2*baseUnitPos,y*4*baseUnitPos,baseUnitScale);
      } else {
        drawScale(x*4*baseUnitPos, y*4*baseUnitPos, baseUnitScale);
      }
    }
  }
}
void drawScale(int x, int y, float baseUnit){
  noFill();
  bezier(x,y-4*baseUnit, x, y-1.5*baseUnit, x+2*baseUnit, y-2.5*baseUnit, x+2*baseUnit, y);
  bezier(x,y-4*baseUnit, x, y-1.5*baseUnit, x-2*baseUnit, y-2.5*baseUnit, x-2*baseUnit, y);
  bezier(x,y+4*baseUnit, x, y+1.5*baseUnit, x-2*baseUnit, y+2.5*baseUnit, x-2*baseUnit, y);
  bezier(x,y+4*baseUnit, x, y+1.5*baseUnit, x+2*baseUnit, y+2.5*baseUnit, x+2*baseUnit, y);
  fill(255,255,0);
  quad(x, y-2.5*baseUnit, x + 1.75 * baseUnit, y, x, y+ 2.5*baseUnit, x - 1.75*baseUnit, y);
  fill(44,255,169);
  ellipse(x,y, 2*baseUnit, 3.5*baseUnit);
}
