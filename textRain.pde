import processing.video.*;
Capture video;
int[] backgroundPixels;
int numPixels;
int numLetters = 100;
float threshold = 31;
ArrayList <Letter> rain;



void setup() {
  size(600, 450, P2D);
  smooth();
  video = new Capture(this, 160, 120);
  video.start();
  numPixels = video.width * video.height;
  backgroundPixels = new int[numPixels];
  loadPixels();

  rain = new ArrayList <Letter> ();
  for (int i = 0; i< numLetters;i++) {
    genRandLtr();
  }
}

void draw() {
  //background(0);
  if (video.available()) {
    video.read();
    video.filter(GRAY);
    image(video, 0, 0, width, height);
    //updatePixels();
  }
  loadPixels();
  for (int i =0;i<rain.size()-1;i++) {
    Letter l = (Letter) rain.get(i);
    l.updatePos();
    l.display();
    if (l.finished()) {
      rain.remove(i);
      genRandLtr();
    }
  }
  color pix = pixels[mouseY*width+mouseX];
  println(red(pix) +" "+ green(pix)+" "+ blue(pix));
  updatePixels();
}

void genRandLtr() {
  PVector pos = new PVector(random(0, width), 30);
  PVector vel = new PVector(0, random(0.5, 1));

  int lowerUpper = (int)random(2);
  int ascii;
  if (lowerUpper == 0) {
    ascii = (int) random(65, 90.1);
  }
  else {
    ascii = (int) random(97, 122.1);
  }

  char ltr = char(ascii);
  Letter letter = new Letter(pos, vel, ltr);
  rain.add(letter);
}

