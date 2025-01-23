import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;

float angleWhiteStar = 0;  
int Rotation = 0; 
int Color = 0;        
int Stroke = 1; 
float Width = 1.0;  

boolean record_pdf = false; 

void setup() {
  size(1090, 800);
  colorMode(HSB, 360, 100, 100);  

  cp5 = new ControlP5(this);

  // Slider para controlar la rotación de la estrella blanca
  cp5.addSlider("Rotation")
     .setPosition(50, 50)  
     .setRange(0, 360)      
     .setValue(0)           
     .setSize(20, 200)     
     .setColorForeground(color(#0000ff)) 
     .setColorBackground(color(#ff1493))         
     .setColorActive(color(255));    

  // Slider para controlar el color de la estrella roja (tono)
  cp5.addSlider("Color")
     .setPosition(830, 50)   
     .setRange(0, 360)      
     .setValue(0)          
     .setSize(200, 20)    
     .setColorForeground(color(#ffff00))    
     .setColorBackground(color(#ff1493))          
     .setColorActive(color(255));     

  // Slider para controlar el grosor del trazo de la estrella roja
  cp5.addSlider("Stroke")
     .setPosition(830, 85)  
     .setRange(1, 50)       
     .setValue(1)           
     .setSize(200, 20)     
     .setColorForeground(color(#ffff00))   
     .setColorBackground(color(#ff1493))           
     .setColorActive(color(255));    

  // Slider para controlar el ancho de la estrella roja
  cp5.addSlider("Width")
     .setPosition(830, 120) 
     .setRange(0.5, 2.0)    
     .setValue(1.0)         
     .setSize(200, 20)      
     .setColorForeground(color(#ffff00))  
     .setColorBackground(color(#ff1493))      
     .setColorActive(color(255));   

  // Botón para guardar en PDF
  cp5.addBang("guarda_pdf")
     .setPosition(30, 590)
     .setSize(200, 30)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("Guardar PDF");

  // Botón para guardar en PNG
  cp5.addBang("guarda_png")
     .setPosition(30, 530)
     .setSize(100, 30)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("Guardar PNG");
}

void draw() {
  if (record_pdf) {
    beginRecord(PDF, "star_design-####.pdf");
  }

  background(0);

  // Dibujar estrella roja
  push();
  translate(width / 2, height / 2);
  scale(Width, 1); 
  stroke(Color, 100, 100);  
  strokeWeight(Stroke);
  noFill();
  beginShape();
  vertex(96, -218);
  vertex(-206, 151);
  vertex(296, -111);
  vertex(-216, -88);
  vertex(51, 209);
  vertex(96, -218);
  endShape(CLOSE);
  pop();

  // Dibujar estrella blanca
  push();
  translate(width / 2, height / 2);
  rotate(radians(Rotation)); 
  stroke(255);
  noFill();
  strokeWeight(4);
  beginShape();
  vertex(-20, -262);
  vertex(-180, 252);
  vertex(235, -51);
  vertex(-277, -176);
  vertex(149, 239);
  vertex(-20, -262);
  endShape(CLOSE);
  pop();

  if (record_pdf) {
    endRecord();
    record_pdf = false;
  }
}

// Función para guardar en PDF
public void guarda_pdf() {
  record_pdf = true;
}

// Función para guardar en PNG
public void guarda_png() {
  save("star_design-" + frameCount + ".png");
}
