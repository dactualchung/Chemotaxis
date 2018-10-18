Hooman[] zombie;
Hooman[] human;
void setup() {
  size(500, 500);
  //spawns the zombies and humans in; zombies with a greenish color and humans with a white color
  zombie = new Hooman[2];
  for (int i = 0; i < zombie.length; i++) {
    zombie[i] = new Hooman(250,250,color(167, 169, 136),true);
  }
  human = new Hooman[25];
  for (int i = 0; i < human.length; i++) {
    human[i] = new Hooman((int)(Math.random()*501),(int)(Math.random()*501),color(255),false);
  }
}
void draw() {
  background(0);
  for (int i = 0; i < zombie.length; i++) {
    zombie[i].show();
    zombie[i].walk();
  }
  //checks zombie touching human
  for (int i = 0; i < human.length; i++) {
    human[i].show();
    human[i].walk();
    for (int b = 0; b < zombie.length; b++) {
      //if the distance between a original zombie and a human is less than or equal to 30 then infect the human
      if (dist(zombie[b].myX, zombie[b].myY, human[i].myX, human[i].myY) <= 30){
        human[i].infect();
      }
    }
    //checks again for the infected human and a human is less than or equal to 30 then infect the human
    for (int b = 0; b < human.length; b++){
      if(human[i].myInfected == true && dist(human[i].myX, human[i].myY, human[b].myX, human[b].myY) <= 30){
        human[b].infect();
      }
      if(human[b].myInfected == true && dist(human[b].myX, human[b].myY, human[i].myX, human[i].myY) <= 30){
        human[i].infect();
      }
    }
  }
}
class Hooman {
  int myX, myY;
  color myColor;
  boolean myInfected;
  Hooman(int x, int y, color co, boolean infect)
  {
    myX = x;
    myY = y;
    myColor = co;
    myInfected = infect;
  }
  //show the circle
  void show() {
    stroke(0);
    fill(myColor);
    ellipse(myX, myY, 50, 50);
  }
  //infects the human
  void infect() {
    myColor = color(167, 169, 136);
    myInfected = true;
  }
  void walk() { 
    if(myX > 25 && myX < 475 && myY > 25 && myY < 475){
     //if infected then x2 speed
     if(myInfected == true){
       myX = myX + (int)(Math.random()*13)-6;
       myY = myY + (int)(Math.random()*13)-6;
     }else{
       myX = myX + (int)(Math.random()*7)-3;
       myY = myY + (int)(Math.random()*7)-3;
     }
    }else {
      //if near out of bounds then direct towards in bounds
      if(myX <= 25){
        myX = myX + (int)(Math.random()*20);
      }
      if(myY <= 25){
        myY = myY + (int)(Math.random()*20);
      }
      if(myX >= 475){
        myX = myX + (int)(Math.random()*20)-20;
      }
      if(myY >= 475){
        myY = myY + (int)(Math.random()*20)-20;
      }
    }
  }
}
void mouseClicked() {
  //resets
  zombie = new Hooman[2];
  for (int i = 0; i < zombie.length; i++) {
    zombie[i] = new Hooman(250,250,color(167, 169, 136),true);
  }
  human = new Hooman[25];
  for (int i = 0; i < human.length; i++) {
    human[i] = new Hooman((int)(Math.random()*501),(int)(Math.random()*501),color(255),false);
  }
}
