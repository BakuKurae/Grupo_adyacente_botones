/**
 * Grupo de botones adyacentes entre sí. 
 * 
 * Este metodo fue utilizado para controlar de manera independiente
 * un grupo de botones sin establecer una area determinada para
 * cada uno de ellos. Se realiza una unica area de coordenadas
 * dinamicas que ira comprobando el estado de cada uno de ellos.
 */
 
int coordX=16; 
color inside = color(204, 102, 0);
color outside = color(153, 51, 0);
int[] stock = new int[6];

void setup() {
  size(192, 130);
  background(225);
}

void draw() {
  background(225);

  for (int i=0; i<=5; i++) {
    if (stock[i]==1) {
      fill(inside);
    } else {
      fill(outside);
    }
    circle(coordX, 16, 32);
    coordX+=32;
  }
  coordX=16;
}

void mouseReleased() {
  
  //Determina si el cursor se encuentra deltro del grupo de botones
  if (mouseX>0 && mouseX<192 && mouseY>0 && mouseY<32) {
    
    //verifica el estado actual de dicho boton
    if (stock[floor((mouseX)/32)] == 1) { 
      stock[floor((mouseX)/32)] = 0;
      println("off "+floor((mouseX)/32));
    } else {
      stock[floor((mouseX)/32)] = 1;
      println("on "+floor((mouseX)/32));
    }
    
  }
  
}

/*
 *Nota: en caso de que sea necesario desplazar
 horizontalmente el grupo de botones (no inicie en cero),
 lo unico que debe hacerse es restale la diferencia
 a MouseX en la funcion: floor((mouseX)/32)
 ejemplo: floor((mouseX-16)/32) 
 si es que hay una distancia de 16 pixeles entre el cero
 en X y el incio del boton.
 */
