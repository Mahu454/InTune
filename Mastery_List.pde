class MasteryList {
  //fields
  PVector xyPos;
  float Xheight, Xlength, yAdjust, yCoor;
  String[] textFile;
  PImage picture;
  SheetMusic sheet;
  
  MasteryList(float x, float y, float l, float h, String[] text, PImage p, SheetMusic m){
    xyPos = new PVector(x, y);
    Xheight = h;
    Xlength = l;
    textFile = text;
    picture = p;
    sheet = m;
    sheet.size = Xheight/15;
    yAdjust = 0;
  }
  
  //draw procedure
  void drawMe(){
    imageMode(CORNER);
    image(picture, xyPos.x, xyPos.y, Xlength, Xheight);
    //calculates where the pictures disappear/re-enter to frame
    yCoor = xyPos.y + Xheight*0.15 +yAdjust;
    float maxY = xyPos.y+Xheight*0.85-(Xheight/30);
    float xCoor = xyPos.x + Xlength*0.25;
    
    //draws the scrolling line indicator
    float yScroll;
    if(instrument.equals("flute")){
      yScroll = map(yAdjust, -2660, 0, maxY*1.05, xyPos.y+Xheight*0.1);
    }
    else{
      yScroll = map(yAdjust, -2230, 0, maxY*1.05, xyPos.y+Xheight*0.1);
    }
    strokeWeight(10);
    stroke(124,83,79);
    line(xyPos.x+Xlength*0.85, yScroll, xyPos.x+Xlength*0.85, yScroll+Xheight/30);
    
    //draws each line of text and stars
    for(int i = 0; i<textFile.length; i++){
      fill(0);
      textAlign(LEFT, CENTER);
      textSize(Xheight/35);
      //draw if its within the set y boundaries
      if(yCoor > xyPos.y + Xheight*0.1 && yCoor < maxY*1.1){
        text(textFile[i].substring(0, textFile[i].length()-1), xCoor, yCoor);
        sheet.noteIndex = i;
        sheet.xyPos = new PVector(xyPos.x + Xlength*0.15, yCoor+sheet.size/3);
        sheet.drawMe();
        float tempX = xCoor*1.69;
        String counter = str(textFile[i].charAt(textFile[i].length()-1));
        //nested for loop that draws the stars according to mastery
        for(int j = 0; j < int(counter); j++){
          image(star, tempX, yCoor-Xheight/36, sheet.size, sheet.size);
          tempX += sheet.size;
        }
      }
      yCoor += Xheight/10;
    }
  }
}
