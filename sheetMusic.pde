class SheetMusic{
  //fields
  String instrument;
  String [] noteList;
  IntList indexList;
  IntList masteredNotes;
  PVector xyPos;
  float size;
  int noteIndex;
  int C1Index;
  
  SheetMusic(float x, float y, float s, String[] list, String[] localData){
    xyPos = new PVector(x, y);
    size = s;
    noteList = new String[list.length];
    arrayCopy(list, noteList);
    
    //finds index of c1, used for ledgerlines calculating
    for(int i = 0; i<noteList.length; i++){
      if(noteList[i].equals("c1")){
        C1Index = i;
        break;
      }
    }
    //gets the indexList and masteredNotes based on text file
    indexList = new IntList();
    masteredNotes = new IntList();
    int counter = 0;
    for(int i = 0; i<noteList.length; i++){
      if(str(localData[i].charAt(localData[i].length()-1)).equals("3")){
        counter++;
        masteredNotes.append(i);
      }
      else{
        indexList.append(counter);
        counter++;
      }
    }
    randomNote();
  }
  
  //generates random note
  void randomNote(){
    if(indexList.size() == 0){
      println("EMPTY ARRAY");
       //doesn't do anything if all notes are mastered
    }
    else{
      //gets index from indexList, not indexes from masteredNotes
      int tempIndex = round(random(0,indexList.size()-1));
      noteIndex = indexList.get(tempIndex);
      println(noteList[noteIndex]);
    }
  }
  
  void drawMe(){
    float divisor = (size/2)/5;
    float ypos = 0;
    
    //draws the staff lines
    for(int i = 0; i<5; i++){
      stroke(0);
      strokeWeight(divisor/5);
      line(xyPos.x, xyPos.y-ypos, xyPos.x+size, xyPos.y-ypos);
      ypos += divisor;
    }
    //draws cleff and note
    image(cleff, xyPos.x, xyPos.y-(size/2),size/3,size/1.5);
    float tempY = xyPos.y + divisor; //this is coordinate of middle C
    
    //finds coordinates of the lowest note
    for(int i = 0; i<C1Index; i++){
      if(noteList[i].substring(1, noteList[i].length()-1).equals("flat") == true || noteList[i].substring(1, noteList[i].length()-1).equals("sharp")){
        //flat and sharp notes don't affect y value
      }
      else{
        //move downwards
        tempY += divisor/2;
      }
    }
    //draws the whole note
    image(wholeNote, xyPos.x+size/2, noteDraw(tempY, noteIndex, divisor), 2*divisor, divisor);
    
    //draws calls ledgerline method
    if(noteDraw(tempY, noteIndex, divisor) > xyPos.y){
      if(noteDraw(tempY, noteIndex, divisor) > xyPos.y+divisor){
        drawLedgerLines(2, false, xyPos.x+size/2, xyPos.y, divisor); 
      }
      else{
        drawLedgerLines(1, false, xyPos.x+size/2, xyPos.y, divisor);
      }
    }
    else if(noteDraw(tempY, noteIndex, divisor) <= xyPos.y-divisor){
      drawLedgerLines(noteDraw(tempY, noteIndex, divisor), true, xyPos.x+size/2, xyPos.y, divisor);
    }
    
    //draws sharps and flats
    if(noteList[noteIndex].substring(1, noteList[noteIndex].length()-1).equals("flat") == true){
      image(flat, xyPos.x+size/2.7, noteDraw(tempY, noteIndex, divisor)-divisor*1.1, divisor*2.5, divisor*2.5);
    }
    else if(noteList[noteIndex].substring(1, noteList[noteIndex].length()-1).equals("sharp") == true){
      image(sharp, xyPos.x+size/2.7, noteDraw(tempY, noteIndex, divisor)-divisor*0.7, divisor*1.2, divisor*2.4);
    }
  }
  
  //calculates the y value of the note based on lowest coordinate
  float noteDraw(float yPos, int maxIndex, float divisor){
   for(int i = 0; i<=maxIndex; i++){
     //decrease Y value if its NOT a flat or sharp
     if(noteList[i].substring(1, noteList[i].length()-1).equals("flat") != true && noteList[i].substring(1, noteList[i].length()-1).equals("sharp") != true){
       yPos -= divisor/2;
     }
   }
   if(noteList[maxIndex].substring(1, noteList[maxIndex].length()-1).equals("flat") == true){
     return yPos - divisor/2; //small adjustment so note is in center of line
   }
   else{
     return yPos;
   }
  }
  
  //draws ledger lines
  void drawLedgerLines(float max, boolean above, float x, float y, float divisor){
    //draws ledgerlines above staff
    if(above == true){
      y -= size/2;
      while(y > max+1){
        fill(0);
        strokeWeight(divisor/5);
        line(x-divisor/5, y, x+(2*divisor)+divisor/5, y);
        y -= divisor;
      }
    }
    //draws ledgerlines below staff
    else{
      for(int i = 0; i<max; i++){
        y += divisor;
        fill(0);
        strokeWeight(divisor/5);
        line(x-divisor/5, y, x+(2*divisor)+divisor/5, y);
      }
    }
  }
  
  //adds the current note index to the masteredNotes arrayList
  void addMasteredNote(){
    masteredNotes.append(noteIndex);
    println("appended", noteIndex);
    IntList tempList = new IntList();
    for(int i = 0; i<indexList.size(); i++){
        if(masteredNotes.hasValue(indexList.get(i)) == true){
          //if the index is not in mastered notes
        }
        else{
          tempList.append(indexList.get(i));
        }
    }
    indexList = new IntList();
    //fills indexList
    for(int i = 0; i<tempList.size(); i++){
      indexList.append(tempList.get(i));
    }
    println(indexList);
    println("masteredNotes below");
    println(masteredNotes);
  }
}
