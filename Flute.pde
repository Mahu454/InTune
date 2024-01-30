class Flute extends Instrument {
  
   Flute(float x, float y, float l, float h, SheetMusic sheet){
    super(x, y, l, h, sheet, "flute", flute); 
    
    //creating the 14 flute pads; the numbers are trial and error-ed lol
    padList[0] = new Pad(xyPos.x+Xlength/10.5, xyPos.y+(Xheight/1.42857142857), Xheight/2.05, Xheight/4.1, 0, this, bflatlever);
    padList[1] = new Pad(xyPos.x+(Xlength/20), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 1, this);
    padList[2] = new Pad(xyPos.x+(Xlength/5.50458715596), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 2, this);
    padList[3] = new Pad(xyPos.x+(Xlength/3.1914893617), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 3, this);
    padList[4] = new Pad(xyPos.x+(Xlength/3.63636363636), xyPos.y+(Xheight/50), Xheight/3, Xheight/3.2, 4, this, gflatlever);
    padList[5] = new Pad(xyPos.x+(Xlength/2.37154150198), xyPos.y+(Xheight/1.53846153846), Xheight/5.5, Xheight/5.5, 5, this, bflatrill);
    padList[6] = new Pad(xyPos.x+(Xlength/2.04778156997), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 6, this);
    padList[7] = new Pad(xyPos.x+(Xlength/1.86335403727), xyPos.y+(Xheight/1.69491525424), Xheight/10, Xheight/5.5, 7, this, trillKey);
    padList[8] = new Pad(xyPos.x+(Xlength/1.61290322581), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 8, this);
    padList[9] = new Pad(xyPos.x+(Xlength/1.49253731343), xyPos.y+(Xheight/1.69491525424), Xheight/10, Xheight/5.5, 9, this, trillKey);
    padList[10] = new Pad(xyPos.x+(Xlength/1.33333333333), xyPos.y+(Xheight/2.15053763441), Xheight/3.5, 10, this);
    padList[11] = new Pad(xyPos.x+(Xlength/1.2), xyPos.y+(Xheight/3.63636363636), Xheight/5, Xheight/2.5, 11, this, eflatKey);
    padList[12] = new Pad(xyPos.x+(Xlength/1.103), xyPos.y+(Xheight/2.5), Xheight/4, Xheight/12, 12, this, csharpKey);
    padList[13] = new Pad(xyPos.x+(Xlength/1.103), xyPos.y+(Xheight/2), Xheight/3, Xheight/6, 13, this, cKey);
    //adds hot keys from text file
    for(int i = 0; i<padList.length; i++){
      if(localFluteKeys[i].equals("null") == false){
        padList[i].hotKey = localFluteKeys[i];
      }
    }
  }
  
  //adds a hotkey to the pad that is clicked
  void addHotKey(String key1){
    for(int i = 0; i<padList.length; i++){
      if(padList[i].clicked == true){
        padList[i].hotKey = key1;
        break;
      }
    }
    hotKeysToFile("./data/fluteHotKeys.txt");
  }
  
  //resets text file and hot keys
  void resetHotKeys(String fileName){
    String[] data = new String[padList.length];
    for(int i = 0; i<padList.length; i++){
      data[i] = "null";
      localFluteKeys[i] = "null";
      padList[i].hotKey = null;
    }
    saveStrings(fileName, data);
  }
}
