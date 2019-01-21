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



  Planet(float r, float d, int c, float x, float y) {
    // THE SUN
    distance = d;
    radius = r;
    angle = 0;
    fillColor = c;
    originX = x;
    originY = y;
    angle = random(0, PI);
  }
  
  Planet() {
    distance = 0;
    radius = 25;
    angle = 0;
    fillColor = 255;
    originX = 0;
    originY = 0;
  }

  void show(float x, float y) {
    noStroke();
    fill(fillColor);
    rotate(angle);
    ellipse(originX, originY, radius * 2, radius * 2);

    if (moons == null) return;    
    for (Planet m : moons) {
      m.show(m.originX, m.originY);      
    }
 
    rotate (2 * PI - angle);
    angle += 0.01;
    
  }
  
  void spawnMoons(int n) {
    Planet[] spawned = new Planet[n];
    int spawnedColor = color(random(150, 255), random(150, 255), random(150, 255));
    float prevDistance = radius;
    for (int i = 0; i < n; i++) {
      float newDistance = prevDistance + random(0.6 * radius, 3 * radius);
      spawned[i] = new Planet(
       radius/3,
       radius + 100 * (i + 1),
       spawnedColor,
       originX + newDistance,
       originY
      );
      prevDistance = newDistance;
    }
    moons = spawned;
  }
}
