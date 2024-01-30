class Button {
  //fields
  Boolean mouseClicked;
  PVector xyPos;
  float Xlength, Xheight;
  float r, g, b;
  PImage icon;
  String text;
  
  Button(float posX, float posY, float l, float h, float red, float green, float blue){
    xyPos = new PVector(posX, posY);
    Xlength = l;
    Xheight = h;
    r = red;
    g = green;
    b = blue;
    mouseClicked = false;
  }
  
  Button(float posX, float posY, float l, float h, float red, float green, float blue, PImage pic, String t){
    xyPos = new PVector(posX, posY);
    Xlength = l;
    Xheight = h;
    r = red;
    g = green;
    b = blue;
    mouseClicked = false;
    text = t;
    icon = pic;
  }
  
  //used for buttons that disappear when clicked
  void drawMe(){
    if(r == 255 && g == 255 && b == 255){
      //don't draw, used for hitboxes only
    }
    else{
      if(mouseClicked == true){ 
        //disappears when clicked
      }
      else{
        if(isMouse() == true){
          fill(r*0.8, g*0.8, b*0.8);
        }
        else{
          fill(r, g, b);
        }
        rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
      }
    }
  }
  
  //used for buttons that don't disappear when clicked
  void drawOtherButton(){
    if(mouseClicked == true || isMouse() == true){
      fill(r*0.8, g*0.8, b*0.8);
      stroke(124,83,79);
      strokeWeight(5);
      rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
    }
    else{
      fill(r, g, b);
      noStroke();
      rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
    }
  }
  
  void drawIconButton(){
    drawMe();
    imageMode(CENTER);
    image(icon, xyPos.x+Xheight*0.6, xyPos.y+Xheight*0.52, Xheight*0.65, Xheight*0.65);
    textAlign(LEFT, CENTER);
    textFont(varela);
    fill(100, 100, 100);
    textSize(17);
    text(text, xyPos.x+Xheight*1.1, xyPos.y+Xheight*0.49);
  }
  
  //detects if mouse is on it or not
  boolean isMouse(){
    if(mouseX > xyPos.x && mouseX < xyPos.x+Xlength){
      if(mouseY > xyPos.y && mouseY < xyPos.y+Xheight){
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false; 
    }
  }
  
  //toggles mouseclicked variable
  void clickMe(){
    if(mouseClicked == false){
      mouseClicked = true;
    }
    else{
      mouseClicked = false;
    }
  }
}
