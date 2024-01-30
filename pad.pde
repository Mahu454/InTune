class Pad{
  //fields
  PVector xyPos;
  float xheight, xwidth;
  int number; //which pad it is, varies for different instruments
  boolean clicked; //on or off
  Instrument instrument;
  PImage picture;
  String hotKey;
  color colour = color(0,0,0);
  
  Pad(float x, float y, float w, float h, int n, Instrument ins, PImage pic){
    xyPos = new PVector(x, y);
    xheight = h;
    xwidth = w;
    number = n;
    instrument = ins;
    clicked = false;
    picture = pic;
    hotKey = null;
  }
  
  Pad(float x, float y, float w, int n, Instrument ins){
    xyPos = new PVector(x, y);
    xheight = w;
    xwidth = w;
    number = n;
    instrument = ins;
    clicked = false;
  }
  
  //draws the pad based on which number it is
  void drawMe(){
    if(instrument.name.equals("flute")){
      fill(colour);
      if(number == 1 || number == 2 || number == 3 || number == 6 || number == 8 || number == 10){
        circle(xyPos.x, xyPos.y, xwidth);
      }
      else{
        image(picture, xyPos.x, xyPos.y, xwidth, xheight);
      }
    }
    else if(instrument.name.equals("saxophone")){
      fill(colour);
      if(number == 16){
        //rotating image by 180 degrees
        pushMatrix();
        translate(xyPos.x, xyPos.y);
        rotate(PI);
        image(picture, 0,0, xwidth, xheight);
        popMatrix();
      }
      else if(number == 5 || number > 16){
        circle(xyPos.x, xyPos.y, xwidth);
      }
      else{
        image(picture, xyPos.x, xyPos.y, xwidth, xheight);
      }
    }
  }
  
  //draws the hot key on the pads
  void drawHotKey(){
    if(instrument.name.equals("flute")){
      if(hotKey == null){
        //doesn't draw anything if null
      }
      else{
        fill(0, 150, 255);
        textSize(20);
        if(number == 1 || number == 2 || number == 3 || number == 6 || number == 8 || number == 10){
          text(hotKey, xyPos.x, xyPos.y);
        }
        else{
          text(hotKey, xyPos.x+xwidth/2, xyPos.y+xheight/2);
        }
      }
    }
    else if(instrument.name.equals("saxophone")){
      if(hotKey != null){
        fill(0, 150, 255);
        textSize(20);
        if(number == 16){
          text(hotKey, xyPos.x-xwidth/2, xyPos.y-xheight/2);
        }
        else if(number == 5 || number > 16){
          text(hotKey, xyPos.x, xyPos.y);
        }
        else{
          text(hotKey, xyPos.x+xwidth/2, xyPos.y+xheight/2);
        }
      }

    }
  }
  
  //detects if mouse is hovering above the pad
  boolean isMouse(){
    if(screenMode.equals("homescreen")){
      return false; //skip function if its in home screen
    }
    if(instrument.name.equals("flute")){
      //circle cases use dist() function
      if(number == 1 || number == 2 || number == 3 || number == 6 || number == 8 || number == 10){
        if(dist(mouseX, mouseY, xyPos.x, xyPos.y) < xwidth/2){
          return true;
        }
      }
      //irregular shapes
      else if(mouseX > xyPos.x && mouseX < xyPos.x+xwidth && mouseY > xyPos.y && mouseY < xyPos.y+xheight){
        return true;
      }
    }
    else if(instrument.name.equals("saxophone")){
      //circle cases use dist() function
      if(number == 5 || number > 16){
        if(dist(mouseX, mouseY, xyPos.x, xyPos.y) < xwidth/2){
          return true;
        }
      }
      else if(number == 2 && mouseX > xyPos.x && mouseX < xyPos.x+xwidth && mouseY > xyPos.y && mouseY < xyPos.y+(0.7*xheight)){
        return true;
      }
      else if(number == 16 && mouseX < xyPos.x && mouseX > xyPos.x-xwidth && mouseY > xyPos.y-xheight && mouseY < xyPos.y){
        return true;
      }
      //iregular shape cases
      else if(mouseX > xyPos.x && mouseX < xyPos.x+xwidth && mouseY > xyPos.y && mouseY < xyPos.y+xheight){
        return true;
      }
    }
  return false;
  }
  
  //toggles on and off the pad
  void clickMe(){
    if(clicked == true){
      clicked = false;
    }
    else{
      clicked = true;
    }
  }
}
