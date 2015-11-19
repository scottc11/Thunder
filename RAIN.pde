import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
FFT fft;



float dropletVelocity = 25.0;
float dropletSize;
color initialBackgroundColor = 63; // the set background color
color backgroundColor;

Droplet droplet1;
ArrayList<Droplet> rainDropsArray = new ArrayList<Droplet>();

void setup() {
  size(400, 400);
  background(55);
  
  // setting up the audio
  minim = new Minim(this);
  player = minim.loadFile("Thunder_Light_Rain.mp3");
  player.loop();
  
  
  // building the array of rain droplets
  for (int i = 0; i < 50; i++) {
    color shade = int(random(40, 80));
    int locX = int(random(0, width));
    int locY = int(random(0, height));
    int size = int(random(5, 30));
    rainDropsArray.add(new Droplet(size, shade, locX, locY, dropletVelocity));
  }
}



void draw() {
  
  background(backgroundColor);
  adjustBGColor(player.mix.level());
  
  
  println("LEFT: ", player.left.level());
  println("RIGHT: ", player.right.level());
  
  for (int i = 0; i < rainDropsArray.size(); i++) {
    rainDropsArray.get(i).update();
  }
}


void adjustBGColor(float amplitude) {
  
  if(amplitude < 0.1) {
    backgroundColor = int(map(amplitude, 0.0, 0.5, initialBackgroundColor, initialBackgroundColor + 20));
  } else {
    backgroundColor = int(map(amplitude, 0.0, 0.5, initialBackgroundColor, initialBackgroundColor + 50));
  }
}