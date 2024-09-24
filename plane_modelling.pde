import processing.serial.*;
PShape airplane;  // Uçak modelini tanımlama
PImage cloudImg;

float backgroundX = 0;  // Arka planın X eksenindeki konumu
float backgroundY = 0;  // Arka planın Y eksenindeki konumu
float sensitivity = 2.0;  // Arka plan hareketinin hassasiyeti

Serial myPort;
float x, y, z;

void setup() {
  size(1920, 1080, P3D);  // 3D desteğini aktif hale getirme
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  // Uçak modelini yükleme
  airplane = loadShape("akincii.obj");
  //cloudImg = loadImage("bulut.jpg");
  airplane.scale(40);  // Modeli uygun boyutta ölçekleme
}

void draw() {
  background(200);
  
  
  
  pushMatrix();
  //translate(width/2, height/2);  // Bulut resmini ekranın ortasına koy
  //imageMode(CENTER);
  //image(cloudImg, 0, 0, 800, 600);  // Bulut resmini ekran boyutuna uygun şekilde çiz
  popMatrix();
  
  lights();  // Işık ekleyerek 3D objelerin daha iyi görünmesini sağlama
  translate(width/2, height/2);
  rotateX(radians(y));
  rotateY(radians(z));
  rotateZ(radians(x));
  
  shape(airplane);  // Uçak modelini ekrana çizme
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    println(inString);
    String[] values = split(trim(inString), ',');
    if (values.length == 3) {
      x = float(values[0]) * 45;
      y = float(values[1]) * 45;
      z = float(values[2]) * -0.9;
    }
  }
} 
