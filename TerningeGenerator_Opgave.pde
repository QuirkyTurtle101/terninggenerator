//NY NØDVENDIG VIDEN:
//1.) random
//2.) array's
//3.) funktioner med og uden returtype
//4.) funktioner med og uden input

//OPGAVE: lav arrays, variabler til at gemme terningkast og fordeling af terningekast
int[] rolls = {};
int[] rollCounts = {0, 0, 0, 0, 0, 0};

void setup() {
  size(600, 800);
  clear();
  text("TRYK på 'k' FOR AT KASTE", 50, 50);
}

void draw() {
}

void keyPressed() {
  clear();
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if (key=='k') {
    //OPGAVE:  lav manglende funktion der laver 'terningekast'. 
    int roll = rollDice(1, 6);
    text("DIT KAST BLEV:" + roll, 50, 75);
  }

  if (key == 's') {
    //OPGAVE:  lav manglende funktion til at et terningekast
    deleteLastRoll();
  }
  
  //OPGAVE: lav manglende funktion til at fordelingen af terningekast. 
  drawGraph();
  //OPGAVE: lav manglende funktion der kan udskrive alle terningekast som tekst ...
  printRolls();
}

int rollDice(int top, int bottom){
  int result = round(random(top, bottom));
  
  rolls = append(rolls, result);
  rollCounts[result-1]++;
  
  return result;
}

void deleteLastRoll(){
  if(rolls.length==0){return;}
  
  rollCounts[rolls[rolls.length-1]-1]--;
  rolls = shorten(rolls);
}

void drawGraph(){
  if(rolls.length==0){return;}
  
  for(int i = 0; i < 6; i++){
    for(int j = 0; j < rollCounts[i]; j++){
      rectMode(CENTER);
      fill(255, 255, 255);
      rect(100+60*i, 650-50*j, 50, 50);
      if(rollCounts[i] != 0){
        text(rollCounts[i], 100+60*i, 700);
      }
    }
  }
}

void printRolls(){
  for(int i = 0; i < rolls.length; i++){
    text("Roll " + (i+1) + " result: " + rolls[i], 500, 50+15*i);
  }
  
  /*debug stuff for now
  println("");
  println("");
  for(int i = 0; i < rolls.length; i++){
    print(rolls[i]);
  }
  println("");
  for(int i = 0; i < 6; i++){
    print(rollCounts[i]);
  }
  */
}
