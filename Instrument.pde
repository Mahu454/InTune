class Instrument{
  //fields
  SheetMusic sheetMusic;
  PImage picture;
  PVector xyPos;
  float Xlength, Xheight;
  String name;
  Pad[] padList;
  
  Instrument(float x, float y, float l, float h, SheetMusic sheet, String n, PImage pic){
    xyPos = new PVector(x, y);
    Xlength = l;
    Xheight = h;
    sheetMusic = sheet;
    name = n;
    picture = pic;
    if(name.equals("flute")){
      padList = new Pad[14];
    }
    else if(name.equals("saxophone")){
      padList = new Pad[23];
    }
  }
  
  //draws the pads if they are on or clicked
  void drawMe(){
    image(picture, xyPos.x, xyPos.y, Xlength, Xheight);
    for(int i = 0; i<padList.length; i++){
      if(padList[i].isMouse() == true || padList[i].clicked == true){
        padList[i].drawMe();
      }
    }
  }
  
  //returns a string of 1s or 0s based on clicked pads
  String getFingeringString(){
   String string = "";
    for(int i = 0; i<padList.length; i++){
      if(padList[i].clicked == true){
        string += "1";
      }
      else{
        string += "0";
      }
    }
    return string;
  }
  
  void clearMe(){   //turns all the pads off
    for(int i = 0; i<padList.length; i++){
      padList[i].clicked = false;
    }
  }
  
  //adds a hotkey to selected pad
  void addHotKey(String key1){
    for(int i = 0; i<padList.length; i++){
      if(padList[i].clicked == true){
        padList[i].hotKey = key1;
        break;
      }
    }
    hotKeysToFile("./data/saxHotKeys.txt");
  }
  
  //saves hotkeys to data file
  void hotKeysToFile(String fileName){
    String[] data = new String[padList.length];
    for(int i = 0; i<padList.length; i++){
      if(padList[i].hotKey != null){
        data[i] = padList[i].hotKey;
      }
    }
    saveStrings(fileName, data);
  }
  
  //draws all of the hotkeys
  void drawHotKeys(){
    textAlign(CENTER);
    for(int i = 0; i<padList.length; i++){
      padList[i].drawHotKey();
    }
  }
  
  //resets all of the hot keys to "null"
  void resetHotKeys(String fileName){
    String[] data = new String[padList.length];
    for(int i = 0; i<padList.length; i++){
      data[i] = "null";
      localSaxKeys[i] = "null";
      padList[i].hotKey = null;
    }
    saveStrings(fileName, data);
  }
}
