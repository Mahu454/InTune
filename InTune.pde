//Setting up global variables
import processing.sound.*;
SoundFile correctFlute, wrongFlute, epicSax, sadSax;
boolean inputKey = false;
String screenMode = "homescreen";
String instrument = "none";
boolean cheatSheet = false;
String correct = "none";
Button homeButton, startButton, cheatSheetButton, fluteButton, saxButton, settingsButton, saxHotKeyResetButton, fluteHotKeyResetButton, masteryButton, skipButton;
String fluteString, saxString;
String[] saxFingerings = {"00000000000010001111111", "00000000000010001111111", "00000000001000001111111", "00000000000000001111111", "00000000000100001111111", "00000000000100001111111", "00000000000000000111111", "00000000000000010111111", "00000000000000010111111", "00000000000000000111110", "00000000000000000111100", "00000000000000000111010", "00000000000000000111010", "00000000000000000111000", "00000000010000000111000", "00000000010000000111000", "00000000000000000110000", "00000100000000000100000", "00000100000000000100000", "00000000000000000100000", "00000000000000000010000", "00000000000000000000000", "00000000000000000000000", "01000000000000000111111", "01000000000000010111111", "01000000000000010111111", "01000000000000000111110", "01000000000000000111100", "01000000000000000111010", "01000000000000000111010", "01000000000000000111000", "01000000010000000111000", "01000000010000000111000", "01000000000000000110000", "01000100000000000100000", "01000100000000000100000", "01000000000000000100000", "01000000000000000010000", "01000000000000000000000", "01000000000000000000000", "01010000000000000000000", "01110000000000000000000", "01110000000000000000000", "01110010000000000000000", "01111010000000000000000"};
String[] fluteFingerings = {"11110010101011", "11110010101001", "11110010101001", "11110010101000", "11110010101100", "11110010101100", "11110010100100", "11110010000100", "11110000001100", "11110000001100", "11110000000100", "11111000000100", "11111000000100", "11100000000100", "11000010000100", "11000010000100", "11000000000100", "01000000000100", "00000000000100", "00000000000100", "10110010101000", "10110010101100", "10110010101100", "11110010100100", "11110010000100", "11110000001100", "11110000001100", "11110000000100", "11111000000100", "11111000000100", "11100000000100", "11000010000100", "11000010000100", "11000000000100", "01000000000100", "00000000000100", "00000000000100", "10110000000100", "11111010101100", "11111010101100", "11100010100100", "11010010000100", "11010000001100", "11010000001100", "01110000000100", "00111000000100", "00111000000100", "10100010000100", "11000011000100", "11000011000100", "11010000010000", "01111010000000"};
SheetMusic fluteNotes, saxNotes;
String[] localFluteData, localSaxData, localFluteKeys, localSaxKeys;
PImage cleff, wholeNote, flute, saxophone, bflatlever, gflatlever, bflatrill, trillKey, eflatKey, csharpKey, cKey, flat, sharp, saxPad1, saxPad, saxPad234, saxPad678, saxPad911, saxPad10, saxPad102, saxPad13, saxPad14, saxPad15, fluteChart, saxChart, homeIcon, startIcon, settingsIcon, fluteIcon, saxIcon, logo, frame, star, menuIcon, resetIcon, skipIcon, pngBackground, mountain, fluteBg, chartIcon;
Flute fluteInstrument;
Saxophone saxInstrument;
PFont varela;
MasteryList fluteMasteryList, saxMasteryList;
float counter = 0;

void setup(){
  background(255);
  size(700,600);
  
  //loading sound effects
  correctFlute = new SoundFile(this, "Audio/correctSoundEffect.wav");
  wrongFlute = new SoundFile(this, "Audio/incorrectSoundEffect.wav");
  epicSax = new SoundFile(this, "epicSax.wav");
  sadSax = new SoundFile(this, "Audio/sadSax.wav");

  epicSax.play();
  println(epicSax.isPlaying());
  delay(10000);
  
  //loading images
  cleff = loadImage("./images/treble.png");
  wholeNote = loadImage("./images/note.png");
  flute = loadImage("./images/flute.png");
  saxophone = loadImage("./images/saxophone.png");
  bflatlever = loadImage("./images/bflatlever.png");
  gflatlever = loadImage("./images/gflatlever.png");
  bflatrill = loadImage("./images/bflatrill.png");
  trillKey = loadImage("./images/trillkey31to54.png");
  eflatKey = loadImage("./images/eflatkey.png");
  csharpKey = loadImage("./images/csharpKey.png");
  cKey = loadImage("./images/cKey.png");
  flat = loadImage("./images/flat.png");
  sharp = loadImage("./images/sharp.png");
  saxPad = loadImage("./images/saxPad.png");
  saxPad1 = loadImage("./images/saxPad1.png");
  saxPad234 = loadImage("./images/saxPad234.png");
  saxPad678 = loadImage("./images/saxPad678.png");
  saxPad911 = loadImage("./images/saxPad911.png");
  saxPad10 = loadImage("./images/saxPad10.png");
  saxPad102 = loadImage("./images/saxPad102.png");
  saxPad13 = loadImage("./images/saxPad13.png");
  saxPad14 = loadImage("./images/saxPad14.png");
  saxPad15 = loadImage("./images/saxPad15.png");
  fluteChart = loadImage("./images/fluteChartHigh.jpg");
  saxChart = loadImage("./images/saxChart.png");
  homeIcon = loadImage("./images/homeIcon.png");
  fluteIcon = loadImage("./images/fluteIcon.png");
  saxIcon = loadImage("./images/saxophoneIcon.png");
  startIcon = loadImage("./images/startLogo.png");
  settingsIcon = loadImage("./images/settings2.png");
  logo = loadImage("./images/inTuneLogo.png");
  frame = loadImage("./images/framingBackground.jpg");
  star = loadImage("./images/star1.png");
  menuIcon = loadImage("./images/menuIcon1.png");
  resetIcon = loadImage("./images/reset.png");
  skipIcon = loadImage("./images/skipIcon1.png");
  pngBackground = loadImage("./images/pngBackground.png");
  mountain = loadImage("./images/mountain.png");
  fluteBg = loadImage("./images/floatIsland.png");
  chartIcon = loadImage("./images/fingeringListIcon.png");
  
  //buttons
  homeButton = new Button(width-50, 0, 50, 50, 135,206,250);
  startButton = new Button((width/2)-70, height/2+30, 140, 60, 255, 255, 255);
  cheatSheetButton = new Button(530, height-70, 150, 40, 255, 238, 240, chartIcon, "Note Chart");
  fluteButton = new Button(width/2-110, height/2-100, 100, 100, 192,192,200);
  saxButton = new Button(width/2+10, height/2-100, 100, 100, 255,215,0);
  settingsButton = new Button(width/2-65, height/2+125, 130, 45, 255, 238, 240, settingsIcon, "Settings");
  fluteHotKeyResetButton = new Button(width/2-60, height/2-100, 120, 50, 252,201,205, resetIcon, "Reset");
  saxHotKeyResetButton = new Button(width/2+75, height/2-100, 120, 50, 252,201,205, resetIcon, "Reset");
  masteryButton = new Button(width/2-85, height-100, 170, 45, 255, 238, 240, menuIcon, "View Mastery");
  skipButton = new Button(0, 0, 150, 50, 255, 238, 240, skipIcon, "Skip Note");
  
  //text files
  localFluteData = loadStrings("./data/flute.txt");
  localSaxData = loadStrings("./data/saxophone.txt");
  localFluteKeys = loadStrings("./data/fluteHotKeys.txt");
  localSaxKeys = loadStrings("./data/saxHotKeys.txt");
  
  //setting up arrays for each instrument
  String[] saxList = {"asharp1", "bflat1", "b1", "c1", "csharp1", "dflat1", "d1", "dsharp1", "eflat1", "e1", "f1", "fsharp1", "gflat1", "g1", "gsharp1", "aflat1", "a1", "asharp2", "bflat2", "b2", "c2", "csharp2", "dflat2", "d2", "dsharp2", "eflat2", "e2", "f2", "fsharp2", "gflat2", "g2", "gsharp2", "aflat2", "a2", "asharp2", "bflat3", "b3", "c3", "csharp3", "dflat3", "d3", "dsharp3", "eflat3", "e3", "f3"};
  String[] fluteList = {"c1", "csharp1", "dflat1", "d1", "dsharp1", "eflat1", "e1", "f1", "fsharp1", "gflat1", "g1", "gsharp1", "aflat1", "a1", "asharp2", "bflat2", "b2", "c2", "csharp2", "dflat2", "d2", "dsharp2", "eflat2", "e2", "f2", "fsharp2", "gflat2", "g2", "gsharp2", "aflat2", "a2", "asharp2", "bflat3", "b3", "c3", "csharp3", "dflat3", "d3", "dsharp3", "eflat3", "e3", "f3", "fsharp3", "gflat3", "g3", "gsharp3", "aflat3", "a3", "asharp3", "bflat4", "b4", "c4"};
  
  //sheetmusic
  fluteNotes = new SheetMusic(300, 200, 100, fluteList, localFluteData);
  saxNotes = new SheetMusic(400, 200, 100, saxList, localSaxData);
  SheetMusic fluteNotes2 = new SheetMusic(300, 150, 100, fluteList, localFluteData);
  SheetMusic saxNotes2 = new SheetMusic(400, 150, 100, saxList, localSaxData);
  
  //creating the instruments
  fluteInstrument = new Flute(50, 300, 600, 200, fluteNotes);
  saxInstrument = new Saxophone(30, 30, 275, 550, saxNotes);
    
  //uncomment to change mastery of notes on text file
  //setMastery("./data/saxophone.txt", localSaxData, 0);
  //setMastery("./data/flute.txt", localFluteData, 0);
  
  //creating other things
  varela = createFont("./data/VarelaRound-Regular.ttf", 20);
  fluteMasteryList = new MasteryList(100, 0, 500, 600, localFluteData, frame, fluteNotes2);
  saxMasteryList = new MasteryList(100, 0, 500, 600, localSaxData, frame, saxNotes2);
}

//draw procedure
void draw(){
  background(230, 245, 255);
  counter++;
  
  image(pngBackground, 0, 0, 700, 600);
  if(screenMode.equals("homescreen")){
    drawHome();
  }
  else if(screenMode.equals("start")){
    startMode();
  }
  else if(screenMode.equals("settings")){
    settingsMode();
  }
  else if(screenMode.equals("mastery")){
    masteryMode();
  }
}

//draws the homepage
void drawHome(){
  //draws logo
  imageMode(CENTER);
  image(logo, width/2, 90, 305, 130);
  imageMode(CORNER);
  
  //draws buttons
  startButton.drawMe();
  fluteButton.drawOtherButton();
  saxButton.drawOtherButton();
  strokeWeight(6);
  stroke(252,151,157);
  settingsButton.drawIconButton();
  masteryButton.drawIconButton();
  noStroke();
  
  //draws icons, text and takes care of tinting when mouse hovers
  imageMode(CORNER);
  image(fluteIcon, fluteButton.xyPos.x+5, fluteButton.xyPos.y+5, 90, 90);
  image(saxIcon, saxButton.xyPos.x+5, saxButton.xyPos.y+5, 90, 90);
  if(startButton.isMouse() == true){
    tint(200,172,169, 255);
  }
  image(startIcon, width/2-75, startButton.xyPos.y-(saxButton.Xheight/2.5), 150, 150);
  tint(255, 255);

  if(instrument.equals("none")){
    textSize(30);
    fill(100, 100, 100);
    textAlign(CENTER);
    text("Please select an instrument", width/2, height*0.275);
  }
}

//draws when user has started
void startMode(){
  float xCoor = 0;
  float yCoor = height/2;
  //draws the flute notes and instrument and text
  if(instrument.equals("flute")){
    xCoor = width/2;
    yCoor -= 50;
    textSize(23);
    fill(255);
    rect(30, 90, 210, 190, 20);
    fill(135,206,250);
    textAlign(CENTER);
    text("Press ENTER \nto check fingering", 570, 160);
    text("Press R to \nde-select all keys", 135, 210);
    fill(252,151,157);
    text("Press E to \nselect all keys", 135, 130);
    image(fluteBg, 420, 130, 300, 300);
    fluteNotes.drawMe();
    fluteInstrument.drawMe();
    fluteInstrument.drawHotKeys();
    imageMode(CENTER);
    image(logo, width/2, 40, 150, 65);
    stroke(252,151,157);
    strokeWeight(5);
    skipButton.xyPos = new PVector(width/2-75, height*0.85);
    skipButton.drawIconButton();
    imageMode(CORNER);
  }
  //draws the saxophone notes and instrument
  else if(instrument == "saxophone"){
    xCoor = width/2+250;
    yCoor -= 120;
    fill(255);
    rect(310, 240, 300, 280, 20);
    textSize(22);
    fill(252,151,157);
    textAlign(CENTER);
    text("Press ENTER \nto check fingering", width/2+110, 275);
    fill(135,206,250);
    text("Press E and R to select \nand de-select all the keys", width/2+110, 350);
    saxNotes.drawMe();
    saxInstrument.drawMe();
    saxInstrument.drawHotKeys();
    imageMode(CENTER);
    image(logo, width/2+100, 40, 150, 65);
    image(mountain, width/1.5, 450, 533, 300);
    skipButton.xyPos = new PVector(width/2+35, height*0.7);
    stroke(252,151,157);
    strokeWeight(5);
    skipButton.drawIconButton();
  }
  cheatSheetButton.drawIconButton();
  imageMode(CORNER);
  noStroke();
  homeButton.drawMe();
  image(homeIcon, homeButton.xyPos.x+5, homeButton.xyPos.y+5, 40, 40);
  
  //lets user know if fingering is correct or not
  if(correct.equals("none") == false){
   if(correct.equals("true")){
      fill(0,255,0);
      textSize(30);
      textAlign(CENTER);
      text("Correct!", xCoor, yCoor);
    }
    else if(correct.equals("false")){
      fill(255,0,0);
      textSize(30);
      textAlign(CENTER);
      text("Incorrect!", xCoor, yCoor);
     }  
   }
  //answer text disappears after a bit
  if(counter%100 == 0){
    counter = 0;
    correct = "none";
  }
  //draws fingering chart
  if(cheatSheet == true){
    if(instrument.equals("flute")){
      image(fluteChart, 110, 0, 480, 600);
    }
    else if(instrument.equals("saxophone")){
      image(saxChart, 135, 0, 450, 600);
    }
  }
}

//draws settings menu
void settingsMode(){
  //flute mode
  if(instrument.equals("flute")){
    fluteInstrument.drawMe();
    fluteInstrument.drawHotKeys();
    stroke(252,151,157);
    strokeWeight(5);
    fluteHotKeyResetButton.drawIconButton();
    imageMode(CENTER);
    image(logo, width/2, 90, 305, 130);
    fill(100,100,100);
    textFont(varela);
    textSize(35);
    textAlign(CENTER);
    text("KeyBind Selector", width/2, 170);
    //has text prompt to tell user to bind key
    if(inputKey == true){
      fill(0);
      textSize(30);
      text("Press key to bind", width/2, height*0.9);
    }
  }
  //saxophone mode
  else if(instrument.equals("saxophone")){
    saxInstrument.drawMe();
    saxInstrument.drawHotKeys();
    stroke(252,151,157);
    strokeWeight(5);
    saxHotKeyResetButton.drawIconButton();
    imageMode(CENTER);
    image(logo, width/2+135, 90, 305, 130);
    textAlign(CENTER);
    fill(100,100,100);
    textFont(varela);
    textSize(35);
    text("KeyBind Selector", width/2+135, 170);
    //text prompt
    if(inputKey == true){
      fill(0);
      textSize(30);
      text("Press key to bind", width/2+135, height*0.6);
    }
  }
  imageMode(CORNER);
  noStroke();
  homeButton.drawMe();
  image(homeIcon, homeButton.xyPos.x+5, homeButton.xyPos.y+5, 40, 40);
}

//draws the note mastery list
void masteryMode(){
  if(instrument.equals("flute")){
    fluteMasteryList.drawMe();
  }
  else if(instrument.equals("saxophone")){
    saxMasteryList.drawMe();
  }
  noStroke();
  homeButton.drawMe();
  image(homeIcon, homeButton.xyPos.x+5, homeButton.xyPos.y+5, 40, 40);
}
