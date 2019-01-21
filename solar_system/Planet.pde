/*
  a thing that orbits another thing
 uses polar geometry
 */

class Planet {
  float radius;
  float angle;
  float distance;
  float originX;
  float originY;
  Planet[] moons;
  int fillColor;
  float orbitSpeed;



  Planet(float r, float d, float x, float y) {
    distance = d;
    radius = r;
    angle = 0;
    fillColor = color(random(150, 255), random(150, 255), random(150, 255));
    originX = x;
    originY = y;
    angle = random(0, PI);
    orbitSpeed = random(0.01, 0.03);
  }
  
  Planet() {
    // THE SUN
    distance = 0;
    radius = 25;
    angle = 0;
    fillColor = 255;
    originX = 0;
    originY = 0;
    orbitSpeed = 0;
  }

  void show() {
    noStroke();
    fill(fillColor);
    rotate(angle);
    ellipse(originX, originY, radius * 2, radius * 2);
    if (orbitSpeed > 0) {
      noFill();
      strokeWeight(1);
      stroke(255);
      noFill();
      arc(0, 0, distance - radius, distance - radius, angle, angle + 0.7 * PI);
    }

    rotate (2 * PI - angle);
    orbit();

    if (moons == null) return;    
    for (Planet m : moons) {
      m.show();      
    }
 
    
    
    
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
  }
  
  void spawnMoons(int n) {
    Planet[] spawned = new Planet[n];
    float prevDistance = radius;
    for (int i = 0; i < n; i++) {
      float newDistance = prevDistance + random(0.6 * radius, 3 * radius);
      spawned[i] = new Planet(
       radius/3,
       radius + 100 * (i + 1),
       originX + newDistance,
       originY
      );
      prevDistance = newDistance;
    }
    moons = spawned;
  }
}
