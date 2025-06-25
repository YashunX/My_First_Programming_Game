import processing.sound.*;

int hd=4; //human direction 1=N,2=E,3=W,4=S
int zahyoux=6;
int zahyouy=6;
int scene;
int tc1;
int tc2;
int tc3;
int tc4;
int t;     //textnumber
int h;
int hy=3;
int score;
int click;  //
int current;//
int num;    //scene6

boolean tb = true;//toilet
boolean f =false;
boolean key1=false;
boolean key2=false;
boolean key3=false;
boolean key4=false;

SoundFile key_sound;
SoundFile door_sound;
SoundFile rock_sound;
SoundFile toilet_sound;
SoundFile fish_sound;
SoundFile toilet2_sound;
SoundFile start_sound;
void setup() {
  size(480, 480);
  smooth();
  PFont font = createFont("MS Gothic", 50);
  textFont (font);
  num=int(random(11));
  frameRate(10);

  key_sound = new SoundFile(this, "coin03.mp3");
  door_sound = new SoundFile(this, "door.mp3");
  rock_sound = new SoundFile(this, "rock.mp3");
  fish_sound = new SoundFile(this, "fish.mp3");
  toilet_sound = new SoundFile(this, "toilet.mp3");
  toilet2_sound = new SoundFile(this, "toilet2.mp3");
  start_sound = new SoundFile(this, "start.mp3");
}

void draw() {
  background(255);
  if (scene==0) {
    startdisplay();
  } else if (scene==1) {
    display1();
  } else if (scene==2) {
    displayclock();
  } else if (scene==3) {
    timeset();
  } else if (scene==4) {
    display2();
  } else if (scene==5) {
    display3();
  } else if (scene==6) {
    piggamedisplay();
  } else if (scene==7) {
    display4();
  } else if (scene==8) {
    creardisplay();
  }
  textbox();
  println(t);
}

void startdisplay() {
  stroke(200);
  fill(220);
  rect(80, 160, 320, 240);
  fill(255, 50, 50);
  triangle(0, 160, 480, 160, 240, 0);
  noStroke();
  fill(50);
  rect(210, 300, 60, 100);
  fill(150);
  circle(260, 350, 15);
  textSize(50);
  fill(10);
  text("館からの脱出", 120, 80);
  textSize(30);
  text("(WASD)で移動。(SPACE)で調べる。", 10, 160);
}

void creardisplay() {
  background(150, 240, 150);
  stroke(200);
  fill(220);
  rect(40, 40, 400, 200);
  fill(255, 50, 50);
  triangle(0, 40, 480, 40, 240, -80);
  door(6, 6);
  noStroke();
  fill(250, 250, 210);
  rect(200, 240, 40, 120);
  rect(0, 360, 480, 80);
  hd=4;
  human(6*40, 8*40);
  textSize(30);
  text("ゲームクリアおめでとう!", 40, 420);
  textSize(20);
  text("[SPACE]でタイトルに戻る", 40, 460);
}

void kanban(int kanbanx, int kanbany) {
  stroke(60, 40, 35);
  strokeWeight(1);
  fill(220, 190, 140);
  rect(kanbanx*40-21, kanbany*40-37, 2, 28);
  rect(kanbanx*40-33, kanbany*40-35, 26, 15);
  stroke(0);
  line(kanbanx*40-30, kanbany*40-32, kanbanx*40-10, kanbany*40-32);
  line(kanbanx*40-30, kanbany*40-29, kanbanx*40-10, kanbany*40-29);
  line(kanbanx*40-30, kanbany*40-26, kanbanx*40-10, kanbany*40-26);
  line(kanbanx*40-30, kanbany*40-23, kanbanx*40-10, kanbany*40-23);
}

void chair(int cx, int cy, int cd) {
  stroke(0);
  strokeWeight(1);
  if (cd==1) {
    fill(153, 51, 51);
    rect(cx*40-30, cy*40-18, 20, 11, 3);
    rect(cx*40-27, cy*40-25, 4, 15);
    rect(cx*40-17, cy*40-25, 4, 15);
    fill(204, 124, 96);
    rect(cx*40-30, cy*40-22, 20, 12, 2);
    rect(cx*40-30, cy*40-35, 20, 10, 3);
  }

  fill(153, 51, 51);
  rect(cx*40-30, cy*40-18, 20, 11, 3);
  rect(cx*40-29, cy*40-15, 4, 13, 2);
  rect(cx*40-15, cy*40-15, 4, 13, 2);
  fill(204, 124, 96);
  rect(cx*40-30, cy*40-22, 20, 12, 2);

  if (cd==2) {
    fill(204, 124, 96);
    rect(cx*40-13, cy*40-37, 4, 25, 3);
  } else if (cd==4) {
    fill(204, 124, 96);
    rect(cx*40-31, cy*40-37, 4, 25, 3);
  } else if (cd==3) {
    fill(153, 51, 51);
    rect(cx*40-29, cy*40-20, 3, 13, 2);
    rect(cx*40-14, cy*40-20, 3, 13, 2);
    rect(cx*40-30, cy*40-28, 20, 10, 3);
  }
}

void yuka(int yukax, int yukay) {
  noStroke();
  fill(180, 103, 0);
  rect(yukax*40-40, yukay*40-40, 40, 40);
  fill(165, 100, 0);
  rect(yukax*40-40, yukay*40-40, 40, 5);
  rect(yukax*40-40, yukay*40-32, 40, 5);
  rect(yukax*40-40, yukay*40-24, 40, 5);
  rect(yukax*40-40, yukay*40-16, 40, 5);
  rect(yukax*40-40, yukay*40-8, 40, 5);
  rect(yukax*40-38, yukay*40-40, 5, 8);
  rect(yukax*40-16, yukay*40-40, 5, 8);
  rect(yukax*40-26, yukay*40-32, 5, 8);
  rect(yukax*40-6, yukay*40-32, 5, 8);
  rect(yukax*40-34, yukay*40-24, 5, 8);
  rect(yukax*40-18, yukay*40-24, 5, 8);
  rect(yukax*40-40, yukay*40-16, 5, 8);
  rect(yukax*40-20, yukay*40-8, 5, 8);
}

void door(int doorx, int doory) {
  strokeWeight(1);
  stroke(255);
  fill(73, 38, 0);
  rect(doorx*40-35, doory*40-38, 30, 38);
  fill(200);
  circle(doorx*40-10, doory*40-19, 3);
}

void heart(int hx, int hy) {
  noStroke();
  fill(255, 182, 193);
  circle(hx*40-25, hy*40-25, 11);
  circle(hx*40-15, hy*40-25, 11);
  triangle(hx*40-30, hy*40-24, hx*40-10, hy*40-24, hx*40-20, hy*40-11);
}

void toilet(int tx, int ty, int ta) {
  stroke(0);
  fill(240);
  rect(tx*40-30, ty*40-35, 20, 25, 5);
  fill(245);
  rect(tx*40-30, ty*40-40, 20, 10);
  fill(230);
  rect(tx*40-28, ty*40-38, 16, 6);
  rect(tx*40-25, ty*40, 10, 4);
  fill(200);
  rect(tx*40-21, ty*40-41, 2, 3, 2);
  fill(245);
  ellipse(tx*40-20, ty*40-10, 20, 22);
  noStroke();
  fill(176, 224, 230);
  ellipse(tx*40-20, ty*40-10, 12, 14);
  stroke(0);
  if (ta==1) {
    fill(245);
    ellipse(tx*40-20, ty*40-14, 20, 22);
    rect(tx*40-24, ty*40-26, 8, 4);
  } else if (ta==2) {
    fill(245);
    ellipse(tx*40-20, ty*40-25, 18, 19);
  }
}

void key1(int keyx, int keyy) { //REDKEY
  noStroke();
  fill(255, 215, 0);
  triangle(keyx*40-30, keyy*40-5, keyx*40-20, keyy*40-20, keyx*40-25, keyy*40);
  triangle(keyx*40-26, keyy*40, keyx*40-20, keyy*40-20, keyx*40-16, keyy*40-15);
  circle(keyx*40-13, keyy*40-23, 18);
  fill(220, 100, 100);
  circle(keyx*40-13, keyy*40-23, 10);
  stroke(255, 215, 0);
  strokeWeight(3);
  line(keyx*40-20, keyy*40-12, keyx*40-15, keyy*40-8);
  line(keyx*40-23, keyy*40-7, keyx*40-18, keyy*40-3);
}

void key2(int keyx, int keyy) { //GREENKEY
  noStroke();
  fill(255, 215, 0);
  triangle(keyx*40-30, keyy*40-5, keyx*40-20, keyy*40-20, keyx*40-25, keyy*40);
  triangle(keyx*40-26, keyy*40, keyx*40-20, keyy*40-20, keyx*40-16, keyy*40-15);
  circle(keyx*40-13, keyy*40-23, 18);
  fill(100, 220, 100);
  circle(keyx*40-13, keyy*40-23, 10);
  stroke(255, 215, 0);
  strokeWeight(3);
  line(keyx*40-20, keyy*40-12, keyx*40-15, keyy*40-8);
  line(keyx*40-23, keyy*40-7, keyx*40-18, keyy*40-3);
}

void key3(int keyx, int keyy) { //BLUEKEY
  noStroke();
  fill(255, 215, 0);
  triangle(keyx*40-30, keyy*40-5, keyx*40-20, keyy*40-20, keyx*40-25, keyy*40);
  triangle(keyx*40-26, keyy*40, keyx*40-20, keyy*40-20, keyx*40-16, keyy*40-15);
  circle(keyx*40-13, keyy*40-23, 18);
  fill(100, 100, 220);
  circle(keyx*40-13, keyy*40-23, 10);
  stroke(255, 215, 0);
  strokeWeight(3);
  line(keyx*40-20, keyy*40-12, keyx*40-15, keyy*40-8);
  line(keyx*40-23, keyy*40-7, keyx*40-18, keyy*40-3);
}

void key4(int keyx, int keyy) { //BLACKKEY
  noStroke();
  fill(255, 215, 0);
  triangle(keyx*40-30, keyy*40-5, keyx*40-20, keyy*40-20, keyx*40-25, keyy*40);
  triangle(keyx*40-26, keyy*40, keyx*40-20, keyy*40-20, keyx*40-16, keyy*40-15);
  circle(keyx*40-13, keyy*40-23, 18);
  fill(30);
  circle(keyx*40-13, keyy*40-23, 10);
  stroke(255, 215, 0);
  strokeWeight(3);
  line(keyx*40-20, keyy*40-12, keyx*40-15, keyy*40-8);
  line(keyx*40-23, keyy*40-7, keyx*40-18, keyy*40-3);
}

void TV(int tvx, int tvy) {
  noStroke();
  fill(230, 60, 30);
  rect(tvx*40-37, tvy*40-37, 34, 32, 5);
  fill(255, 165, 0);
  rect(tvx*40-38, tvy*40-5, 36, 6);
  rect(tvx*40-35, tvy*40-34, 30, 26, 5);
  fill(220);
  rect(tvx*40-34, tvy*40-33, 28, 24, 5);
  fill(0);
  textSize(12);
  text("GAME", tvx*40-35, tvy*40-18);
}

void fish(int fx, int fy) {
  if (f==false) {
    noStroke();

    fill(0);
    circle(fx*40-21, fy*40-28, 8);
    circle(fx*40-10, fy*40-27, 8);
    //circle(fx*40-21, fy*40-12, 8);
    circle(fx*40-10, fy*40-13, 8);

    fill(255, 140, 0);
    circle(fx*40-22, fy*40-26, 8);
    circle(fx*40-11, fy*40-25, 8);
    //circle(fx*40-22, fy*40-14, 8);
    circle(fx*40-11, fy*40-15, 8);
    ellipse(fx*40-20, fy*40-20, 25, 15);
    fill(240);
    rect(fx*40-26, fy*40-27, 2, 14);
    rect(fx*40-14, fy*40-27, 2, 13);
    fill(0);
    circle(fx*40-29, fy*40-21, 3);
    circle(fx*40-18, fy*40-21, 8);
    circle(fx*40-5, fy*40-21, 8);
    fill(255, 140, 0);
    circle(fx*40-21, fy*40-21, 8);
    circle(fx*40-8, fy*40-21, 8);
    fill(240);
    rect(fx*40-9, fy*40-25, 2, 9);
  }
}

void itemfish(int fx, int fy) {
  noStroke();

  fill(0);
  circle(fx*40-21, fy*40-28, 8);
  circle(fx*40-10, fy*40-27, 8);
  //circle(fx*40-21, fy*40-12, 8);
  circle(fx*40-10, fy*40-13, 8);

  fill(255, 140, 0);
  circle(fx*40-22, fy*40-26, 8);
  circle(fx*40-11, fy*40-25, 8);
  //circle(fx*40-22, fy*40-14, 8);
  circle(fx*40-11, fy*40-15, 8);
  ellipse(fx*40-20, fy*40-20, 25, 15);
  fill(240);
  rect(fx*40-26, fy*40-27, 2, 14);
  rect(fx*40-14, fy*40-27, 2, 13);
  fill(0);
  circle(fx*40-29, fy*40-21, 3);
  circle(fx*40-18, fy*40-21, 8);
  circle(fx*40-5, fy*40-21, 8);
  fill(255, 140, 0);
  circle(fx*40-21, fy*40-21, 8);
  circle(fx*40-8, fy*40-21, 8);
  fill(240);
  rect(fx*40-9, fy*40-25, 2, 9);
}

void pig(int x, int y) {
  strokeWeight(1);
  noStroke();
  fill(255, 192, 203);           //ganmen no color
  circle(x-40, y-35, 10);        //Right ear
  circle(x, y-35, 10);           //Left ear
  circle(x-20, y-20, 45);        //Face
  fill(255, 108, 133);           //hana no color
  circle(x-20, y-20, 13);        //hana
  fill(255, 0, 0);               //kuti no color
  circle(x-20, y-5, 8);          //kuti
  stroke(100);
  line(x-23, y-24, x-23, y-16);  //migihana
  line(x-18, y-24, x-18, y-16);  //hidarihana
  stroke(50);
  line(x-30, y-35, x-30, y-25);  //migime
  line(x-10, y-35, x-10, y-25);        //hidarime
}



void clock(int clockx, int clocky) {
  noStroke();
  fill(80);
  rect(clockx*40-29, clocky*40-33, 18, 25);
  fill(10);
  rect(clockx*40-32, clocky*40-36, 24, 3);
  rect(clockx*40-32, clocky*40-10, 24, 3);
  fill(150);
  rect(clockx*40-25, clocky*40-19, 10, 10);
  fill(200, 200, 60);
  circle(clockx*40-20, clocky*40-12, 5);
  fill(240);
  circle(clockx*40-20, clocky*40-26, 13);
  stroke(10);
  strokeWeight(1);
  line(clockx*40-20, clocky*40-32, clockx*40-20, clocky*40-26);
  line(clockx*40-16, clocky*40-26, clockx*40-20, clocky*40-26);
  strokeWeight(2);
  point(clockx*40-20, clocky*40-26);
  stroke(62, 46, 40);
  strokeWeight(2);
  line(clockx*40-20, clocky*40-18, clockx*40-20, clocky*40-16);
}

void timeset() {
  noStroke();
  fill(0);
  textSize(40);
  text(tc1, 140, 240);
  text(tc2, 200, 240);
  text(tc3, 260, 240);
  text(tc4, 320, 240);
  fill(255, 0, 0);
  triangle(150, 170, 140, 190, 160, 190);
  triangle(210, 170, 200, 190, 220, 190);
  triangle(270, 170, 260, 190, 280, 190);
  triangle(330, 170, 320, 190, 340, 190);
  triangle(150, 280, 140, 260, 160, 260);
  triangle(210, 280, 200, 260, 220, 260);
  triangle(270, 280, 260, 260, 280, 260);
  triangle(330, 280, 320, 260, 340, 260);

  if (tc1==1 && tc2==1 && tc3==3 && tc4==4) {
    if (key1==false) {
      key_sound.play();
      t=8;
    }
    scene=1;
    key1=true;
  }
}

void displayclock() {
  stroke(0);
  fill(80);
  rect(0, 0, 480, 480);
  strokeWeight(1);
  fill(255);
  circle(240, 240, 480);
  strokeWeight(20);
  point(240, 240);
  strokeWeight(10);
  fill(0);
  textSize(30);
  point(240, 10); //12
  text(12, 225, 40);
  point(360, 40); //1
  text(1, 340, 70);
  point(440, 120); //2
  text(2, 410, 150);
  point(470, 240); //3
  text(3, 440, 250);
  point(440, 360); //4
  text(4, 410, 355);
  point(360, 440); //5
  text(5, 340, 430);
  point(240, 470); //6
  text(6, 235, 460);
  point(120, 440); //7
  text(7, 130, 430);
  point(40, 360); //8
  text(8, 55, 355);
  point(10, 240); //9
  text(9, 30, 250);
  point(40, 120); //10
  text(10, 60, 150);
  point(120, 40); //11
  text(11, 135, 70);
  strokeWeight(8);
  line(200, 120, 240, 240);
  strokeWeight(5);
  line(165, 400, 240, 240);
}

void human(int hx, int hy) {
  if (hd==1) {
    noStroke();
    fill(252, 226, 196);         //hada iro
    circle(hx-20, hy-30, 11);    //hada

    fill(100);                    //hair
    circle(hx-20, hy-32, 13);
    rect(hx-27, hy-32, 14, 7);

    noStroke();                  //body arm hand
    fill(252, 226, 196);
    circle(hx-28, hy-15, 5);//right hand
    circle(hx-12, hy-15, 5);//lrft hand
    fill(200, 144, 106);
    rect(hx-25, hy-25, 11, 12);
    rect(hx-30, hy-23, 5, 7);
    rect(hx-15, hy-23, 5, 7);

    stroke(0);                //kutu
    fill(0);
    ellipse(hx-23, hy-3, 5, 3);
    ellipse(hx-16, hy-3, 5, 3);

    noStroke();
    fill(0, 84, 56);            //pants
    rect(hx-25, hy-13, 4, 12);
    rect(hx-18, hy-13, 4, 12);
    rect(hx-25, hy-13, 10, 5);
  } else if (hd==2) {
    noStroke();
    fill(100);                    //hair
    circle(hx-20, hy-32, 13);
    rect(hx-27, hy-32, 14, 7);

    noStroke();
    fill(252, 226, 196);         //hada iro
    circle(hx-20, hy-30, 11);    //hada

    stroke(0);
    strokeWeight(1);
    fill(0);
    line(hx-21, hy-33, hx-21, hy-30);   //migi me
    line(hx-17, hy-33, hx-17, hy-30);   //hidari me

    noStroke();
    fill(100);                        //hair
    ellipse(hx-20, hy-36, 10, 5);
    ellipse(hx-25, hy-32, 2, 8);
    ellipse(hx-15, hy-32, 2, 8);
    //fill(0);
    ellipse(hx-24, hy-34, 5, 4);    //wake
    //ellipse(hx-16,hy-34,5,4);

    stroke(255, 100, 100);
    fill(255, 100, 100);
    line(hx-21, hy-28, hx-19, hy-28);

    noStroke();                  //body arm
    fill(200, 144, 106);
    rect(hx-25, hy-25, 10, 12);
    rect(hx-30, hy-23, 5, 7);
    rect(hx-15, hy-23, 5, 7);

    fill(0, 84, 56);            //pants
    rect(hx-25, hy-13, 4, 12);
    rect(hx-18, hy-13, 4, 12);
    rect(hx-25, hy-13, 10, 5);

    fill(252, 226, 196);
    circle(hx-28, hy-15, 5);//right hand
    circle(hx-12, hy-15, 5);//lrft hand

    stroke(0);                //kutu
    fill(0);
    ellipse(hx-23, hy-3, 5, 3);
    ellipse(hx-16, hy-3, 5, 3);
  } else if (hd==3) {
    noStroke();
    fill(100);                    //hair
    circle(hx-20, hy-32, 13);
    rect(hx-27, hy-32, 14, 7);

    noStroke();
    fill(252, 226, 196);         //hada iro
    circle(hx-20, hy-30, 11);    //hada

    stroke(0);
    strokeWeight(1);
    fill(0);
    line(hx-23, hy-33, hx-23, hy-30);   //migi me
    line(hx-19, hy-33, hx-19, hy-30);   //hidari me

    noStroke();
    fill(100);                        //hair
    ellipse(hx-20, hy-36, 10, 5);
    ellipse(hx-25, hy-32, 2, 8);
    ellipse(hx-15, hy-32, 2, 8);
    //fill(0);
    //ellipse(hx-24,hy-34,5,4);    //wake
    ellipse(hx-16, hy-34, 5, 4);

    stroke(255, 100, 100);
    fill(255, 100, 100);
    line(hx-21, hy-28, hx-19, hy-28);

    noStroke();                  //body arm
    fill(200, 144, 106);
    rect(hx-25, hy-25, 10, 12);
    rect(hx-30, hy-23, 5, 7);
    rect(hx-15, hy-23, 5, 7);

    fill(0, 84, 56);            //pants
    rect(hx-25, hy-13, 4, 12);
    rect(hx-18, hy-13, 4, 12);
    rect(hx-25, hy-13, 10, 5);

    fill(252, 226, 196);
    circle(hx-28, hy-15, 5);//right hand
    circle(hx-12, hy-15, 5);//lrft hand

    stroke(0);                //kutu
    fill(0);
    ellipse(hx-23, hy-3, 5, 3);
    ellipse(hx-16, hy-3, 5, 3);
  } else if (hd==4) {
    noStroke();
    fill(100);                    //hair
    circle(hx-20, hy-32, 13);
    rect(hx-27, hy-32, 14, 7);

    noStroke();
    fill(252, 226, 196);         //hada iro
    circle(hx-20, hy-30, 11);    //hada

    stroke(0);
    strokeWeight(1);
    fill(0);
    line(hx-22, hy-33, hx-22, hy-30);   //migi me
    line(hx-18, hy-33, hx-18, hy-30);   //hidari me

    noStroke();
    fill(100);                        //hair
    ellipse(hx-20, hy-36, 10, 5);
    ellipse(hx-25, hy-32, 2, 8);
    ellipse(hx-15, hy-32, 2, 8);
    //fill(0);
    ellipse(hx-24, hy-34, 5, 4);    //wake
    ellipse(hx-16, hy-34, 5, 4);

    stroke(255, 100, 100);
    fill(255, 100, 100);
    line(hx-21, hy-28, hx-19, hy-28);

    noStroke();                  //body arm
    fill(200, 144, 106);
    rect(hx-25, hy-25, 10, 12);
    rect(hx-30, hy-23, 5, 7);
    rect(hx-15, hy-23, 5, 7);

    fill(0, 84, 56);            //pants
    rect(hx-25, hy-13, 4, 12);
    rect(hx-18, hy-13, 4, 12);
    rect(hx-25, hy-13, 10, 5);

    fill(252, 226, 196);
    circle(hx-28, hy-15, 5);//right hand
    circle(hx-12, hy-15, 5);//lrft hand

    stroke(0);                //kutu
    fill(0);
    ellipse(hx-23, hy-3, 5, 3);
    ellipse(hx-16, hy-3, 5, 3);
  }
}

void border() {
  stroke(0);
  strokeWeight(0);
  line(0, 40, 480, 40);
  line(0, 80, 480, 80);
  line(0, 120, 480, 120);
  line(0, 160, 480, 160);
  line(0, 200, 480, 200);
  line(0, 240, 480, 240);
  line(0, 280, 480, 280);
  line(0, 320, 480, 320);
  line(0, 360, 480, 360);
  line(0, 400, 480, 400);
  line(0, 440, 480, 440);
  line(40, 0, 40, 480);
  line(80, 0, 80, 480);
  line(120, 0, 120, 480);
  line(160, 0, 160, 480);
  line(160, 0, 160, 480);
  line(160, 0, 160, 480);
  line(200, 0, 200, 480);
  line(240, 0, 240, 480);
  line(280, 0, 280, 480);
  line(320, 0, 320, 480);
  line(360, 0, 360, 480);
  line(400, 0, 400, 480);
  line(440, 0, 440, 480);
}

void textbox() {
  if (scene==0||scene==2||scene==3||scene==6||scene==8) {   //シーンで表示しない
  } else {
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(0, 400, 479, 78, 20);

    if (f==true) {      //持ち物表示
      if (scene==4&&zahyoux==3&&zahyouy==3&&hd==1&&tb==false) {
        noStroke();
        fill(255, 255, 0);
        rect(40, 440, 40, 40);
      }
      itemfish(2, 12);
    }
    if (key1==true) {
      key1(1, 12);
    }
    if (key2==true) {
      key2(3, 12);
    }
    if (key3==true) {
      key3(4, 12);
    }
    if (key4==true) {
      key4(5, 12);
    }
  }
  textSize(20);
  fill(0);
  if (scene==0||scene==2||scene==3||scene==6||scene==8) {
  } else {
    if (t==0) {
      text("どうにかしてこの家から脱出する方法を探そう!", 5, 420);
    } else if (t==2) {
      text("「ほったいもいじんな」とかかれている", 5, 420);
    } else if (t==3) {
      text("鍵がかかっている(赤)", 5, 420);
    } else if (t==4) {
      text("鍵がかかっている(緑)", 5, 420);
    } else if (t==5) {
      text("鍵がかかっている(青)", 5, 420);
    } else if (t==6) {
      text("時計だ!", 5, 420);
    } else if (t==7) {
      text("どういう意味だ?", 5, 420);
    } else if (t==8) {
      text("赤い鍵を手に入れた!", 5, 420);
    } else if (t==9) {
      text("カクレクマノミ「タ　ス　ケ　テ」", 5, 420);
    } else if (t==10) {
      text("トイレだ!", 5, 420);
    } else if (t==11) {
      text("カクレクマノミ「ありがとう♡」緑の鍵を手に入れた!", 5, 420);
    } else if (t==12) {
      text("玄関には鍵がかかっている(黒)", 5, 420);
    } else if (t==13) {
      text("青い鍵を手に入れた", 5, 420);
    } else if (t==14) {
      text("黒い鍵を手に入れた。これで外にでられる!", 5, 420);
    }
  }
}

void piggamedisplay() {
  background(230, 60, 30);
  noStroke();
  fill(255, 165, 0);
  rect(9, 9, 462, 462);
  fill(220);
  rect(10, 10, 460, 460);
  if (scene==6) {
    fill(0);
    textSize(30);
    text(score, 230, 30);
    text("/20", 265, 30);
    text("PUSH THE PIG", 8, 35);
  }
  if (scene==6 && millis()-current>=800) {
    current=millis();
    num = int(random(12))+1;
  }

  if (scene==6 ) {       //豚の場合分け
    if (num==1) {
      pig(55, 195);
    } else if (num==2) {
      pig(125, 195);
    } else if (num==3) {
      pig(195, 195);
    } else if (num==4) {
      pig(265, 195);
    } else if (num==5) {
      pig(335, 195);
    } else if (num==6) {
      pig(405, 195);
    } else if (num==7) {
      pig(55, 265);
    } else if (num==8) {
      pig(125, 265);
    } else if (num==9) {
      pig(195, 265);
    } else if (num==10) {
      pig(265, 265);
    } else if (num==11) {
      pig(335, 265);
    } else if (num==12) {
      pig(405, 265);
    }
  }

  if (scene==6 && (click==1||click==2||click==3||click==4||click==5||click==6||click==7||click==8||click==9||click==10||click==11||click==12)) {
    if (click==1 && num==1) {
      score++;
    } else if (click==2 && num==2) {
      score++;
    } else if (click==3 && num==3) {
      score++;
    } else if (click==4 && num==4) {
      score++;
    } else if (click==5 && num==5) {
      score++;
    } else if (click==6 && num==6) {
      score++;
    } else if (click==7 && num==7) {
      score++;
    } else if (click==8 && num==8) {
      score++;
    } else if (click==9 && num==9) {
      score++;
    } else if (click==10 && num==10) {
      score++;
    } else if (click==11 && num==11) {
      score++;
    } else if (click==12 && num==12) {
      score++;
    }
    click=0;
  }
  if (scene==6 && score>=20) {
    key3=true;
    scene=5;
    t=13;
    key_sound.play();
  }
}

void display1() {
  noStroke();
  fill(180);
  rect(0, 0, 480, 40);
  fill(10);
  rect(0, 0, 40, 480);
  rect(440, 0, 40, 480);
  rect(0, 360, 480, 120);
  door(6, 1);
  yuka(2, 2);
  yuka(3, 2);
  yuka(4, 2);
  yuka(5, 2);
  yuka(6, 2);
  yuka(7, 2);
  yuka(8, 2);
  yuka(9, 2);
  yuka(10, 2);
  yuka(11, 2);
  yuka(2, 3);
  yuka(3, 3);
  yuka(4, 3);
  yuka(5, 3);
  yuka(6, 3);
  yuka(7, 3);
  yuka(8, 3);
  yuka(9, 3);
  yuka(10, 3);
  yuka(11, 3);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(5, 4);
  yuka(6, 4);
  yuka(7, 4);
  yuka(8, 4);
  yuka(9, 4);
  yuka(10, 4);
  yuka(11, 4);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(5, 4);
  yuka(6, 4);
  yuka(7, 4);
  yuka(8, 4);
  yuka(9, 4);
  yuka(10, 4);
  yuka(11, 4);
  yuka(2, 5);
  yuka(3, 5);
  yuka(4, 5);
  yuka(5, 5);
  yuka(6, 5);
  yuka(7, 5);
  yuka(8, 5);
  yuka(9, 5);
  yuka(10, 5);
  yuka(11, 5);
  yuka(2, 6);
  yuka(3, 6);
  yuka(4, 6);
  yuka(5, 6);
  yuka(6, 6);
  yuka(7, 6);
  yuka(8, 6);
  yuka(9, 6);
  yuka(10, 6);
  yuka(11, 6);
  yuka(2, 7);
  yuka(3, 7);
  yuka(4, 7);
  yuka(5, 7);
  yuka(6, 7);
  yuka(7, 7);
  yuka(8, 7);
  yuka(9, 7);
  yuka(10, 7);
  yuka(11, 7);
  yuka(2, 8);
  yuka(3, 8);
  yuka(4, 8);
  yuka(5, 8);
  yuka(6, 8);
  yuka(7, 8);
  yuka(8, 8);
  yuka(9, 8);
  yuka(10, 8);
  yuka(11, 8);
  yuka(2, 9);
  yuka(3, 9);
  yuka(4, 9);
  yuka(5, 9);
  yuka(6, 9);
  yuka(7, 9);
  yuka(8, 9);
  yuka(9, 9);
  yuka(10, 9);
  yuka(11, 9);

  yuka(6, 10);
  yuka(1, 6);
  yuka(12, 6);
  fill(10);
  rect(200, 380, 40, 20);
  rect(0, 200, 20, 40);
  rect(460, 200, 20, 40);
  fill(255);
  rect(35, 170, 8, 20);

  chair(5, 7, 3);
  chair(5, 6, 4);
  chair(9, 6, 3);
  chair(9, 3, 2);
  chair(7, 3, 1);
  chair(7, 4, 2);
  chair(5, 4, 3);

  kanban(2, 4);
  clock(10, 2);
  human(zahyoux*40, zahyouy*40);
}

void display2() {
  noStroke();
  fill(180);
  rect(0, 0, 480, 40);
  fill(10);
  rect(0, 0, 40, 480);
  rect(440, 0, 40, 480);
  rect(0, 360, 480, 120);
  rect(40, 280, 400, 80);
  rect(160, 0, 80, 160);
  yuka(2, 2);
  yuka(3, 2);
  yuka(4, 2);
  yuka(2, 3);
  yuka(3, 3);
  yuka(4, 3);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(7, 2);
  yuka(8, 2);
  yuka(9, 2);
  yuka(10, 2);
  yuka(11, 2);
  yuka(7, 3);
  yuka(8, 3);
  yuka(9, 3);
  yuka(10, 3);
  yuka(11, 3);
  yuka(7, 4);
  yuka(8, 4);
  yuka(9, 4);
  yuka(10, 4);
  yuka(11, 4);
  yuka(3, 5);
  yuka(10, 5);
  yuka(2, 6);
  yuka(3, 6);
  yuka(4, 6);
  yuka(5, 6);
  yuka(6, 6);
  yuka(7, 6);
  yuka(8, 6);
  yuka(9, 6);
  yuka(10, 6);
  yuka(11, 6);
  yuka(2, 7);
  yuka(3, 7);
  yuka(4, 7);
  yuka(5, 7);
  yuka(6, 7);
  yuka(7, 7);
  yuka(8, 7);
  yuka(9, 7);
  yuka(10, 7);
  yuka(11, 7);
  yuka(12, 6);
  fill(180);
  rect(40, 160, 400, 40);
  yuka(3, 5);
  yuka(10, 5);

  fill(230, 230, 250);
  rect(240, 40, 80, 120);
  fill(250);
  stroke(0);
  rect(240, 40, 80, 60, 10);
  noStroke();
  fill(64, 224, 208);
  rect(245, 45, 70, 30, 5);
  fill(139, 69, 19);
  rect(320, 40, 20, 80);

  if (f==false) {
    fish(7, 2);
  }

  if (tb==true) {
    toilet(3, 2, 1);
  } else if (tb==false) {
    toilet(3, 2, 2);
  }
  human(zahyoux*40, zahyouy*40);
  if (h==1) {
    heart(3, hy);
    hy=hy-1;
  }
}

void display3() {
  noStroke();
  fill(180);
  rect(40, 80, 200, 40);
  fill(10);
  rect(0, 0, 40, 480);
  rect(440, 0, 40, 480);
  rect(0, 360, 480, 120);
  rect(0, 0, 480, 80);
  rect(240, 80, 200, 280);
  rect(40, 280, 200, 80);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(5, 4);
  yuka(6, 4);
  yuka(2, 5);
  yuka(3, 5);
  yuka(4, 5);
  yuka(5, 5);
  yuka(6, 5);
  yuka(2, 6);
  yuka(3, 6);
  yuka(4, 6);
  yuka(5, 6);
  yuka(6, 6);
  yuka(2, 7);
  yuka(3, 7);
  yuka(4, 7);
  yuka(5, 7);
  yuka(6, 7);
  yuka(1, 6);
  chair(2, 7, 3);
  chair(3, 7, 3);
  chair(4, 7, 3);
  chair(5, 7, 3);
  chair(6, 7, 3);
  TV(4, 3);
  human(zahyoux*40, zahyouy*40);
}

void display4() {
  noStroke();
  fill(180);
  rect(0, 0, 480, 40);
  fill(10);
  rect(0, 0, 40, 480);
  rect(440, 0, 40, 480);
  rect(0, 360, 480, 120);
  yuka(2, 2);
  yuka(3, 2);
  yuka(4, 2);
  yuka(5, 2);
  yuka(6, 2);
  yuka(7, 2);
  yuka(8, 2);
  yuka(9, 2);
  yuka(10, 2);
  yuka(11, 2);
  yuka(2, 3);
  yuka(3, 3);
  yuka(4, 3);
  yuka(5, 3);
  yuka(6, 3);
  yuka(7, 3);
  yuka(8, 3);
  yuka(9, 3);
  yuka(10, 3);
  yuka(11, 3);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(5, 4);
  yuka(6, 4);
  yuka(7, 4);
  yuka(8, 4);
  yuka(9, 4);
  yuka(10, 4);
  yuka(11, 4);
  yuka(2, 4);
  yuka(3, 4);
  yuka(4, 4);
  yuka(5, 4);
  yuka(6, 4);
  yuka(7, 4);
  yuka(8, 4);
  yuka(9, 4);
  yuka(10, 4);
  yuka(11, 4);
  yuka(2, 5);
  yuka(3, 5);
  yuka(4, 5);
  yuka(5, 5);
  yuka(6, 5);
  yuka(7, 5);
  yuka(8, 5);
  yuka(9, 5);
  yuka(10, 5);
  yuka(11, 5);
  yuka(2, 6);
  yuka(3, 6);
  yuka(4, 6);
  yuka(5, 6);
  yuka(6, 6);
  yuka(7, 6);
  yuka(8, 6);
  yuka(9, 6);
  yuka(10, 6);
  yuka(11, 6);
  yuka(2, 7);
  yuka(3, 7);
  yuka(4, 7);
  yuka(5, 7);
  yuka(6, 7);
  yuka(7, 7);
  yuka(8, 7);
  yuka(9, 7);
  yuka(10, 7);
  yuka(11, 7);
  yuka(2, 8);
  yuka(3, 8);
  yuka(4, 8);
  yuka(5, 8);
  yuka(6, 8);
  yuka(7, 8);
  yuka(8, 8);
  yuka(9, 8);
  yuka(10, 8);
  yuka(11, 8);
  yuka(2, 9);
  yuka(3, 9);
  yuka(4, 9);
  yuka(5, 9);
  yuka(6, 9);
  yuka(7, 9);
  yuka(8, 9);
  yuka(9, 9);
  yuka(10, 9);
  yuka(11, 9);
  yuka(6, 10);
  human(zahyoux*40, zahyouy*40);
  if (zahyoux<=4||zahyoux>=10||zahyoux>=6&&zahyoux<=9&&zahyouy==2||zahyoux==6&&zahyouy==3||zahyoux>=5&&zahyoux<=8&&zahyouy==5||zahyoux==8&&zahyouy==4||zahyoux>=6&&zahyoux<=9&&zahyouy==7||zahyoux>=8&&zahyoux<=9&&zahyouy>=8&&zahyouy<=9) {
    zahyoux=6;
    zahyouy=8;
    hd=1;
  }
  if (zahyoux==5&&zahyouy==2) {    //key4GET
    if (key4==false) {
      key_sound.play();
    }
    key4=true;
    t=14;
  }
  if (key4==false) {
    key4(5, 2);
  }
}

void keyPressed() {
  if (scene==0) {
    if (key==' ') {
      scene=1;
      start_sound.play();
    }
  }
  if (scene==1||scene==2||scene==3) {     //entrance
    if (key=='w') {
      if (scene==1) {
        if (zahyouy==2||zahyoux==10&&zahyouy==3||zahyoux==2&&zahyouy==5) {
          hd=1;
        } else {
          hd=1;
          zahyouy--;
        }
        if (key3==true&&zahyoux==6&&zahyouy==2&&hd==1) {
          scene=7;
          zahyoux=6;
          zahyouy=9;
          door_sound.play();
        }
      }
      if (zahyoux==6&&zahyouy==2) {  //key3
        t=5;
        rock_sound.play();
      }
    } else if (key=='d') {
      if (scene==1) {
        if (zahyoux==11||zahyoux==9&&zahyouy==2) {
          hd=2;
        } else {
          hd=2;
          zahyoux++;
        }
        if (key2==true) {
          if (zahyoux==11&&zahyouy==6&&hd==2) {
            scene=5;
            zahyoux=2;
            zahyouy=6;
            door_sound.play();
          }
        }
        if (zahyoux==11&&zahyouy==6&&hd==2) {   //key2
          t=4;
          rock_sound.play();
        }
      }
    } else if (key=='a') {
      if (scene==1) {
        if (zahyoux==2||zahyoux==11&&zahyouy==2||zahyoux==3&&zahyouy==4) {
          hd=3;
        } else {
          hd=3;
          zahyoux--;
        }
        if (key1==true) {
          if (zahyoux==2&&zahyouy==6&&hd==3) {
            scene=4;
            zahyoux=11;
            zahyouy=6;
            door_sound.play();
          }
        }
        if (zahyoux==2&&zahyouy==6&&hd==3) {   //key2
          t=3;
          rock_sound.play();
        }
      }
    } else if (key=='s') {
      if (scene==1) {
        if (zahyouy==9||zahyoux==2&&zahyouy==3) {
          hd=4;
        } else {
          hd=4;
          zahyouy++;
        }
        if (zahyoux==6&&zahyouy==9&&key4==true&&hd==4) {
          scene=8;
          door_sound.play();
        }
        if (zahyoux==6&&zahyouy==9&&key4==false) {
          t=12;
          rock_sound.play();
        }
      }
    } else if  (key==' ') {
      if (zahyoux==10&&zahyouy==3&&hd==1&&scene==1) {
        t=6;
        scene=2;
      } else if (zahyoux==2&&zahyouy==5&&hd==3&&scene==1) {
        t=7;
        scene=3;
      } else {
        scene=1;
      }
      if (zahyoux==2&&zahyouy==5&&hd==1) {  //かんばん
        t=2;
      }
    }
  } else if (scene==4) {           //left room シーン４
    if (key=='w') {
      if (zahyouy==2||zahyoux==3&&zahyouy==3||zahyoux>=7&&zahyoux<=8&&zahyouy==3||zahyoux==2&&zahyouy==6||zahyoux>=4&&zahyoux<=9&&zahyouy==6||zahyoux==11&&zahyouy==6||zahyoux==9&&zahyouy==4) {
        hd=1;
      } else {
        hd=1;
        zahyouy--;
      }
    } else if (key=='d') {
      if (zahyoux==11||zahyoux==3&&zahyouy==5||zahyoux==2&&zahyouy==2||zahyoux==4&&zahyouy>=2&&zahyouy<=4||zahyoux==8&&zahyouy==3||zahyoux==10&&zahyouy==5) {
        hd=2;
      } else {
        hd=2;
        zahyoux++;
      }
      if (zahyoux==11&&zahyouy==6&&hd==2) {
        scene=1;
        zahyoux=2;
        zahyouy=6;
        door_sound.play();
      }
    } else if (key=='a') {
      if (zahyoux==2||zahyoux==4&&zahyouy==2||zahyoux==3&&zahyouy==5||zahyoux==7&&zahyouy>=3&&zahyouy<=4||zahyoux==10&&zahyouy==5||zahyoux==10&&zahyouy>=2&&zahyouy<=3) {
        hd=3;
      } else {
        hd=3;
        zahyoux--;
      }
    } else if (key=='s') {
      if (zahyouy==7||zahyoux==2&&zahyouy==4||zahyoux==4&&zahyouy==4||zahyoux>=7&&zahyoux<=9&&zahyouy==4||zahyoux==11&&zahyouy==4) {
        hd=4;
      } else {
        hd=4;
        zahyouy++;
      }
    } else if  (key==' ') {
      if (zahyoux==7&&zahyouy==3&&hd==1) {
        f=true;
        t=9;
        fish_sound.play();
      }
      if (zahyoux==3&&zahyouy==3&&hd==1) {
        t=10;
        if (tb ==true) {
          tb=false;
          toilet2_sound.play();
        } else if (tb==false) {
          tb=true;
          toilet2_sound.play();
        }
      }
    }
  }

  if (scene==5||scene==6) {     //RIGHTROOM
    if (key=='w') {
      if (scene==5) {
        if (zahyouy==4) {
          hd=1;
        } else {
          hd=1;
          zahyouy--;
        }
      }
    } else if (key=='d') {
      if (scene==5) {
        if (zahyoux==6) {
          hd=2;
        } else {
          hd=2;
          zahyoux++;
        }
      }
    } else if (key=='a') {
      if (scene==5) {
        if (zahyoux==2||zahyoux==11&&zahyouy==2||zahyoux==3&&zahyouy==4) {
          hd=3;
        } else {
          hd=3;
          zahyoux--;
        }
        if (zahyoux==2&&zahyouy==6&&hd==3) {
          scene=1;
          zahyoux=11;
          zahyouy=6;
          door_sound.play();
        }
      }
    } else if (key=='s') {
      if (scene==5) {
        if (zahyouy==6) {
          hd=4;
        } else {
          hd=4;
          zahyouy++;
        }
      }
    } else if  (key==' ') {
      if (zahyoux==4&&zahyouy==4&&hd==1&&scene==5) {
        scene=6;
        score=0;
      } else {
        scene=5;
      }
    }
  }


  if (scene==7) {     //BACKROOM
    if (key=='w') {
      if (zahyouy==2) {
        hd=1;
      } else {
        hd=1;
        zahyouy--;
      }
    } else if (key=='d') {

      if (zahyoux==11) {
        hd=2;
      } else {
        hd=2;
        zahyoux++;
      }
    } else if (key=='a') {
      if (zahyoux==2) {
        hd=3;
      } else {
        hd=3;
        zahyoux--;
      }
    } else if (key=='s') {
      if (zahyouy==9) {
        hd=4;
      } else {
        hd=4;
        zahyouy++;
      }
      if (zahyoux==6&&zahyouy==9&&hd==4) {
        scene=1;
        zahyouy=2;
        door_sound.play();
      }
    }
  }
  if (keyCode==SHIFT) {
    border();
  }
  if (scene==8&&key==' ') {
    scene=0;
    key1=false;
    key2=false;
    key3=false;
    key4=false;
    f=false;
    tb=true;
    hd=4;
    zahyoux=6;
    zahyouy=6;
    tc1=0;
    tc2=0;
    tc3=0;
    tc4=0;
    hy=3;
    score=0;
    h=0;
    key_sound.play();
  }
}

void mousePressed() {
  if (scene==3) {
    if (mouseX>=140 && mouseX<=160 && mouseY>=170 && mouseY<=190) {
      tc1++;
      if (tc1>=10) {
        tc1=0;
      }
    } else if (mouseX>=200 && mouseX<=220 && mouseY>=170 && mouseY<=190) {
      tc2++;
      if (tc2>=10) {
        tc2=0;
      }
    } else if (mouseX>=260 && mouseX<=280 && mouseY>=170 && mouseY<=190) {
      tc3++;
      if (tc3>=10) {
        tc3=0;
      }
    } else if (mouseX>=320 && mouseX<=340 && mouseY>=170 && mouseY<=190) {
      tc4++;
      if (tc4>=10) {
        tc4=0;
      }
    } else if (mouseX>=140 && mouseX<=160 && mouseY>=260 && mouseY<=280) {
      tc1--;
      if (tc1<=-1) {
        tc1=9;
      }
    } else if (mouseX>=200 && mouseX<=220 && mouseY>=260 && mouseY<=280) {
      tc2--;
      if (tc2<=-1) {
        tc2=9;
      }
    } else if (mouseX>=260 && mouseX<=280 && mouseY>=260 && mouseY<=280) {
      tc3--;
      if (tc3<=-1) {
        tc3=9;
      }
    } else if (mouseX>=320 && mouseX<=340 && mouseY>=260 && mouseY<=280) {
      tc4--;
      if (tc4<=-1) {
        tc4=9;
      }
    }
  }
  if (scene==4&&mouseX>=40&&mouseX<=80&&mouseY>=440&&mouseY<=480&&tb==false&&f==true&&zahyoux==3&&zahyouy==3&&hd==1) {
    h=1;
    t=11;
    key2=true;
    key_sound.play();
    toilet_sound.play();
  }
  if (scene==6) {
    if (mouseX>=10 && mouseX<=60 && mouseY>=150 && mouseY<=200) {
      click=1;
    } else if (mouseX>=80 && mouseX<=130 && mouseY>=150 && mouseY<=200) {
      click=2;
    } else if (mouseX>=150 && mouseX<=200 && mouseY>=150 && mouseY<=200) {
      click=3;
    } else if (mouseX>=220 && mouseX<=270 && mouseY>=150 && mouseY<=200) {
      click=4;
    } else if (mouseX>=290 && mouseX<=340 && mouseY>=150 && mouseY<=200) {
      click=5;
    } else if (mouseX>=360 && mouseX<=410 && mouseY>=150 && mouseY<=200) {
      click=6;
    } else if (mouseX>=10 && mouseX<=60 && mouseY>=220 && mouseY<=270) {
      click=7;
    } else if (mouseX>=80 && mouseX<=180 && mouseY>=220 && mouseY<=270) {
      click=8;
    } else if (mouseX>=150 && mouseX<=200 && mouseY>=220 && mouseY<=270) {
      click=9;
    } else if (mouseX>=220 && mouseX<=270 && mouseY>=220 && mouseY<=270) {
      click= 10;
    } else if (mouseX>=290 && mouseX<=340 && mouseY>=220 && mouseY<=270) {
      click=11;
    } else if (mouseX>=360 && mouseX<=410 && mouseY>=220 && mouseY<=270) {
      click=12;
    }
  }
}
