# Control de un grupo de botones adyacentes [Processing 3]
_Método para controlar de manera independiente un grupo de botones adyacentes entre sí sin necesidad de designar un área de detección para cada uno de ellos._

![Grupo de botones alineados al origen en X](https://raw.githubusercontent.com/BakuKurae/Grupo_adyacente_botones/master/preview/inicio_origen.PNG "Grupo de botones alineados al origen en X")
![Grupo de botones desfasados](https://raw.githubusercontent.com/BakuKurae/Grupo_adyacente_botones/master/preview/inicio_desfase.PNG "Grupo de botones desfasados")


## Generación de los botones.

El código (para fines prácticos) genera una serie de circulos sobre el mismo eje del mismo color dado que los estados iniciales asi lo dictaminan. Los estados de cada uno de los botones son almacenados en un array y verificados con cada ciclo del programa.

```Processing
int[] stock = new int[5]; //La cantidad de botones determina la longitud del array de estados
```
**Es necesario que cada botón tenga las mismas dimensiones para el correcto funcionamiento de la fórmula**

## Función de control (Núcleo)

La parte importante del programa es la cual determina que botón es presionado y almacena el estado consecuente. Para conseguir la información sobre que botón es con quien se interactua nos basaremos de la siguiente formula la cual tendrá como resultado el número con el que fué almacenado en el array de estados.

![Formula](https://raw.githubusercontent.com/BakuKurae/Grupo_adyacente_botones/master/preview/Formula.PNG)

![Grupo de botones](https://raw.githubusercontent.com/BakuKurae/Grupo_adyacente_botones/master/preview/grafico_botones.PNG)

_Ejemplo: Si mouseX nos devuelve el valor 23, obtendremos como resultado de la fórmula_

```Processing
floor(0.71); //Resultado: 0
```
De esta manera sabremos sobre que botón esta actualmente el cursor y al hacer click modificaremos su estado y almacenaremos su valor  en el array usando el espacio determinado por la fórmula. 
El código de detección de colisiones entre los botones y el cursor se almacena dentro un `mouseRealesed` y una condición de colisión entre el cursor y el bloque entero de botones, de esta manera la verificación solo sucedera, si y solo si, el cursor se encuentra sobre un botón y unicamente luego de haber sido presionado.

```Processing
void mouseReleased() {
  
  //Determina si el cursor se encuentra dentro del grupo de botones
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
```
En caso de que los botones no inicien en el origen del eje X, es necesario restar la cantidad de px que fue desplazado respecto al origen al valor de `mouseX` en la formula.

![Grupo de botones alineados al origen en X](https://raw.githubusercontent.com/BakuKurae/Grupo_adyacente_botones/master/preview/px_desfase.png)

Usando la imagen anterior como ejemplo, el código para una situación asi es el siguiente:

```Processing
void mouseReleased() {
  
  //Determina si el cursor se encuentra deltro del grupo de botones
  if (mouseX>32 && mouseX<192 && mouseY>0 && mouseY<32) {
    
    //verifica el estado actual de dicho boton
    if (stock[floor((mouseX-32)/32)] == 1) { 
      stock[floor((mouseX-32)/32)] = 0;
      println("off "+floor((mouseX-32)/32));
    } else {
      stock[floor((mouseX-32)/32)] = 1;
      println("on "+floor((mouseX-32)/32));
    }
    
  }
  
}
```

