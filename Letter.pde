class Letter {
  //GLOBAL VARIABLES
  PVector pos;
  PVector vel;
  char ltr;
  int aboveCheck = 4;
  //CONTRUCTOR
  Letter(PVector _pos, PVector _vel, char _ltr){
    pos = _pos;
    vel = _vel;
    ltr = _ltr;
    
  }
  
  //FUNCTIONS
  void display(){
    textAlign(CENTER,BOTTOM);
    text(ltr, pos.x,pos.y);
    noFill();
    //ellipse(pos.x,pos.y,5,5);
  }
  
  
  void setRandPos(){
    pos = new PVector(random(0,width), 0);
  }
  
  void updatePos(){
    float xPos = pos.x;
    float yPos = pos.y;
    int indexAhead = int(xPos)+int(yPos)*width;
    int indexAbove = int(xPos)+int(yPos-aboveCheck)*width;
    float aheadCol = red(pixels[indexAhead]);
    float aboveCol = red(pixels[indexAbove]);
    if(aheadCol>threshold){
      pos.set(xPos+vel.x, yPos+vel.y,0);
    } else if(aboveCol<=threshold){
      pos.set(xPos, yPos-aboveCheck,0);
    }
    
  }
  
  boolean finished(){
    return(pos.y>=height-1 || pos.y<=aboveCheck);
  }
  
  
  
  
  
}
