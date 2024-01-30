class Saxophone extends Instrument{
  
  Saxophone(float x, float y, float l, float h, SheetMusic sheet){
    super(x, y, l, h, sheet, "saxophone", saxophone); 
    
    //absolutely cancerous code
    padList[0] = new Pad(xyPos.x+(Xlength/3.05555555556), xyPos.y-(Xlength/55), Xlength/5, Xlength/5, 0, this, saxPad);
    padList[1] = new Pad(xyPos.x+(Xlength/7.63888888889), xyPos.y+(Xlength/7.63888888889), Xlength/6, Xlength/4, 1, this, saxPad1);
    padList[2] = new Pad(xyPos.x+(Xlength/1.432291), xyPos.y+(Xlength/30), Xlength/7.8, Xlength/3.9, 2, this, saxPad234);
    padList[4] = new Pad(xyPos.x+(Xlength/1.555), xyPos.y+(Xlength/4.34), Xlength/7.8, Xlength/3.9, 4, this, saxPad234);
    padList[3] = new Pad(xyPos.x+(Xlength/1.205), xyPos.y+(Xlength/5.7), Xlength/7.8, Xlength/3.9, 3, this, saxPad234);
    padList[5] = new Pad(xyPos.x+(Xlength/1.78), xyPos.y+(Xlength/2.55), Xlength/9, 5, this);
    padList[6] = new Pad(xyPos.x+(Xlength/10), xyPos.y+(Xlength/1.40), Xlength/9, Xlength/6, 6, this, saxPad678);
    padList[7] = new Pad(xyPos.x+(Xlength/10), xyPos.y+(Xlength/1.125), Xlength/9, Xlength/6, 7, this, saxPad678);
    padList[8] = new Pad(xyPos.x+(Xlength/10), xyPos.y+(Xlength/0.947), Xlength/9, Xlength/6, 8, this, saxPad678);
    padList[9] = new Pad(xyPos.x+(Xlength/1.735), xyPos.y+(Xlength/1.292), Xlength/4.5, Xlength/8, 9, this, saxPad911);
    padList[10] = new Pad(xyPos.x+(Xlength/1.85), xyPos.y+(Xlength/1.138), Xlength/7, Xlength/10, 10, this, saxPad10);
    padList[11] = new Pad(xyPos.x+(Xlength/1.45), xyPos.y+(Xlength/1.138), Xlength/7, Xlength/10, 11, this, saxPad102);
    padList[12] = new Pad(xyPos.x+(Xlength/1.735), xyPos.y+(Xlength/1.0049), Xlength/4.5, Xlength/8, 12, this, saxPad911);
    padList[13] = new Pad(xyPos.x+(Xlength/4.8), xyPos.y+(Xlength*1.19), Xlength/8.5, Xlength/4.25, 13, this, saxPad13);
    padList[14] = new Pad(xyPos.x+(Xlength/4.8), xyPos.y+(Xlength*1.42), Xlength/8.5, Xlength/4.25, 14, this, saxPad14);
    padList[15] = new Pad(xyPos.x+(Xlength/3.19), xyPos.y+(Xlength*1.77), Xlength/4.5, Xlength/9, 15, this, saxPad15);
    padList[16] = new Pad(xyPos.x+(Xlength/1.87), xyPos.y+(Xlength*2), Xlength/4.5, Xlength/9, 16, this, saxPad15);
    padList[17] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength/3.71), Xlength/5.5, 17, this);
    padList[18] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength/1.92), Xlength/5.5, 18, this);
    padList[19] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength/1.3), Xlength/5.5, 19, this);
    padList[20] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength*1.15), Xlength/5.5, 20, this);
    padList[21] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength*1.4), Xlength/5.5, 21, this);
    padList[22] = new Pad(xyPos.x+(Xlength/2.36), xyPos.y+(Xlength*1.65), Xlength/5.5, 22, this);
    //adds hot keys from text file
    for(int i = 0; i<padList.length; i++){
      if(localSaxKeys[i].equals("null") == false){
        padList[i].hotKey = localSaxKeys[i];
      }
    }
  }

  //adds hotkey to pad that is clicked
  void addHotKey(String key1){
    for(int i = 0; i<padList.length; i++){
      if(padList[i].clicked == true){
        padList[i].hotKey = key1;
        break;
      }
    }
    hotKeysToFile("./data/saxHotKeys.txt");
  }
  
  //resets hot keys; includes text file as well
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
