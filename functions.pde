void mouseClicked(){
  //home button is clicked
  if(homeButton.isMouse() == true && homeButton.mouseClicked == false){
    startButton.mouseClicked = false;
    settingsButton.mouseClicked = false;
    homeButton.mouseClicked = true;
    screenMode = "homescreen";
    correct = "none";
    fluteInstrument.clearMe();
    saxInstrument.clearMe();
    fluteMasteryList.yAdjust = 0;
    saxMasteryList.yAdjust = 0;
  }
  //settings mode
  if(screenMode.equals("settings")){
    if(instrument.equals("flute")){
      //hot key reset
      if(fluteHotKeyResetButton.isMouse() == true){
        fluteInstrument.resetHotKeys("./data/fluteHotKeys.txt");
      }
      //finds clicked pad
      for(int i = 0; i<fluteInstrument.padList.length; i++){
        if(fluteInstrument.padList[i].isMouse() == true){
          fluteInstrument.padList[i].clickMe();
          inputKey = true;
        }
        else{
          //only 1 pad at a time for settings
          fluteInstrument.padList[i].clicked = false;
        }
      }
    }
    else if(instrument.equals("saxophone")){
      //hot key reset
      if(saxHotKeyResetButton.isMouse() == true){
        saxInstrument.resetHotKeys("./data/saxHotKeys.txt");
      }
      //finds clicked pad
      for(int i = 0; i<saxInstrument.padList.length; i++){
        if(saxInstrument.padList[i].isMouse() == true){
          saxInstrument.padList[i].clickMe();
          inputKey = true;
        }
        else{
          //1 pad at a time only for settings
          saxInstrument.padList[i].clicked = false;
        }
      }
    }
  }
  else{
    //if skip button is clicked
    if(skipButton.isMouse() == true && screenMode.equals("start")){
      if(instrument.equals("flute")){
        fluteNotes.randomNote();
      }
      else if(instrument.equals("saxophone")){
        saxNotes.randomNote();
      }
    }
    //if mastery button is clicked
    if(masteryButton.isMouse() == true && instrument.equals("none") == false && screenMode.equals("homescreen")){
      screenMode = "mastery";
      homeButton.mouseClicked = false;
    }
    //chart button is clicked
    if(cheatSheetButton.isMouse() == true){
      cheatSheetClicked();
    }
    //settings button is clicked
    if(settingsButton.isMouse() == true && screenMode.equals("homescreen") && instrument.equals("none") == false){
      screenMode = "settings";
      homeButton.mouseClicked = false;
      settingsButton.mouseClicked = true;
    }
    //if fluteButton is clicked
    if(fluteButton.isMouse() == true && screenMode.equals("homescreen")){
      instrument = "flute";
      fluteButton.clickMe();
      saxButton.mouseClicked = false;
    }
    //if saxbutton is clicked
    if(saxButton.isMouse() == true && screenMode.equals("homescreen")){
      instrument = "saxophone";
      saxButton.clickMe();
      fluteButton.mouseClicked = false;
    }
    //startButton is clicked
    if(startButton.isMouse() == true && screenMode.equals("homescreen")){
      if(instrument.equals("none")){
        //don't run if no instrument is selected
      }
      else{ //if there is an instrument selected
        screenMode = "start";
        startButton.mouseClicked = true;
        homeButton.mouseClicked = false;
        settingsButton.mouseClicked = false;
        fluteInstrument.clearMe();
        saxInstrument.clearMe();
      }
    }
    //turns on flute pad if its clicked
    else if(instrument.equals("flute")){
      for(int i = 0; i<fluteInstrument.padList.length; i++){
        if(fluteInstrument.padList[i].isMouse() == true){
          fluteInstrument.padList[i].clickMe();
        }
      }
    }
    //turns on saxophone pad if clicked
    else if(instrument.equals("saxophone")){
      for(int i = 0; i<saxInstrument.padList.length; i++){
        if(saxInstrument.padList[i].isMouse() == true){
          saxInstrument.padList[i].clickMe();
        }
      }
    }
  }
}

//toggles on and off the fingering charts
void cheatSheetClicked(){
  if(cheatSheet == false){
      cheatSheet = true;
  }
  else{
    cheatSheet = false;
  }
}

void keyPressed(){
  //adds hot key to flute
  if(inputKey == true){
    if(instrument.equals("flute")){
      fluteInstrument.addHotKey(str(key));
      inputKey = false;
      fluteInstrument.clearMe();
    }
    //adds hot key to saxophone
    else if(instrument.equals("saxophone")){
      saxInstrument.addHotKey(str(key));
      inputKey = false;
      saxInstrument.clearMe();
    }
  }
  //this key resets all of the pads
  if(key == 'R'){
    if(instrument.equals("flute")){
      fluteInstrument.clearMe();
    }
    else if (instrument.equals("saxophone")){
      saxInstrument.clearMe();
    }
  }
  //this key selects all of the pads
  if(key == 'E'){
    if(instrument.equals("flute")){
      for(int i = 0; i<fluteInstrument.padList.length; i++){
        fluteInstrument.padList[i].clicked = true;
      }
    }
    else if(instrument.equals("saxophone")){
      for(int i = 0; i<saxInstrument.padList.length; i++){
        saxInstrument.padList[i].clicked = true;
      }
    }
  }
  //this key enters the clicked pads to see if its correct fingering
  if(key == ENTER){
    if(instrument.equals("flute")){
      //if flute fingering is correct, increase mastery and new note
      if(fluteInstrument.getFingeringString().equals(fluteFingerings[fluteNotes.noteIndex])){
        increaseMastery("./data/flute.txt", localFluteData, fluteNotes);
        fluteNotes.randomNote();
        fluteInstrument.clearMe();
        correct = "true";
        correctFlute.play();
      }
      else{ //incorrect fingering inputed
        correct = "false";
        wrongFlute.play();
      }
    }
    else if(instrument.equals("saxophone")){
      //if saxophone fingering is correct, increase mastery and new note
      if(saxInstrument.getFingeringString().equals(saxFingerings[saxNotes.noteIndex])){
        increaseMastery("./data/saxophone.txt", localSaxData, saxNotes);
        saxNotes.randomNote();
        saxInstrument.clearMe();
        correct = "true";
        epicSax.play();
      }
      else{
        correct = "false";
        sadSax.play();
      }
    }
  }
  //handles keyboard controls/key binds for flute pads
  if(instrument.equals("flute")){
    for(int i = 0; i<fluteInstrument.padList.length; i++){
      try{
        if(str(key).equals(fluteInstrument.padList[i].hotKey)){
          fluteInstrument.padList[i].clickMe();
        }
      }
      catch(Exception e){
      }
    }
  }
  //handles keyboard controls for saxophone
  else if(instrument.equals("saxophone")){
    for(int i = 0; i<saxInstrument.padList.length; i++){
      try{
        if(str(key).equals(saxInstrument.padList[i].hotKey)){
          saxInstrument.padList[i].clickMe();
        }
      }
      catch(Exception e){
      }
    }
  }
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  float y = pow(e, 7);
  //handles positive cases
  if(e > 0){
    if(y > 1000){ //max scroll
      y = 1000;
    }
    else if(y < 20 && e != 0){ //min scroll
      y = 20; 
    }
  }
  else{ //negative cases
    if(y < -1000){ //max scroll
      y = -1000;
    }
    else if(y > -20 && e != 0){
      y = -20; //min scroll
    }
  }
  //controls the limits of how far up/down you can scroll
  if(instrument.equals("flute")){
     if(fluteMasteryList.yAdjust <= 0 || e > 0){
      if(fluteMasteryList.yAdjust > -2660 || e < 0){
        if(fluteMasteryList.yAdjust - y > 0){
          fluteMasteryList.yAdjust = 0;
        }
        else if(fluteMasteryList.yAdjust-y < -2660){
          fluteMasteryList.yAdjust = -2660;
        }
        else{
          fluteMasteryList.yAdjust -= y;
        }
      }
    }
  }
  else if(instrument.equals("saxophone")){
    if(saxMasteryList.yAdjust <= 0 || e > 0){
      if(saxMasteryList.yAdjust > -2660 || e < 0){
        if(saxMasteryList.yAdjust - y > 0){
          saxMasteryList.yAdjust = 0;
        }
        else if(saxMasteryList.yAdjust-y < -2230){
          saxMasteryList.yAdjust = -2230;
        }
        else{
          saxMasteryList.yAdjust -= y;
        }
      }
    }
  }
}

//increases the mastery of the note by 1 on the text file
void increaseMastery(String fileName, String[] localData, SheetMusic Notes){
  //gets the last character of string on text file and increases by 1
  String mastery = str(localData[Notes.noteIndex].charAt(localData[Notes.noteIndex].length()-1));
  int noteMastery = int(mastery);
  
  //if the mastery is a certain amount, it becomes mastered
  if(noteMastery == 2){
    Notes.addMasteredNote();
  }
    localData[Notes.noteIndex] = localData[Notes.noteIndex].substring(0, localData[Notes.noteIndex].length()-1) +str(noteMastery+1);
  
  //saves changes to the files
  if(instrument.equals("flute")){
    saveStrings(fileName, localData);
  }
  else if(instrument.equals("saxophone")){
    saveStrings(fileName, localData);
  }
  return;
}

void setMastery(String textFileName, String[] data, int mastery){
  //setting localdata to set mastery
  for(int i = 0; i<data.length; i++){
    data[i] = data[i].substring(0, data[i].length()-1)+str(mastery);
  }
  //saves data onto text file
  saveStrings(textFileName, data);
}
