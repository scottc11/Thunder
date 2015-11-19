class Droplet {
  int size;
  color shade;
  PVector location;
  float velocity;
  
  Droplet(int _size, color _shade, int _locX, int _locY, float _velocity) {
    size = _size;
    shade = _shade;
    location = new PVector(_locX, _locY);
    velocity = _velocity;
  }
  
  void update() {
    stroke(shade);
    line(location.x, location.y, location.x, location.y + size);
    location.y += velocity;
    
    // relocating droplet once it leaves bottom of screen
    if (location.y > height) {
      location.y = 0;
      location.x = random(0, width);
    }
    
  }
  
}