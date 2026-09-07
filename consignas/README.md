# Halloween

Queremos hacer un programa en objetos que modele el comportamiento de los chicos del vecindario (Rolo, Tito y Juanita) cuando salen a pedir caramelos y a hacer bullicio en Halloween. Este programa a su vez va a tener una interfaz gráfica que nos permitirá jugar con nuestros objetos.

## Cómo se juega

El tablero es el barrio de noche: 10 celdas de ancho por 10 de alto. Arriba a la derecha está la **casa** donde se piden los caramelos, y en el medio del barrio hay dos **vestidores** donde los chicos pueden cambiarse el disfraz. Los tres chicos arrancan abajo a la izquierda.

La gracia es pasear por el barrio, elegir con qué disfraz presentarse y pasar por la casa a pedir caramelos, hasta que se termine la diversión.

El juego ya tiene configuradas las siguientes teclas:
- **Flechas** arriba, abajo, izquierda y derecha: se usan para que el personaje controlado se mueva.
- Letra **t**: Tito pasa a ser el personaje controlado.
- Letra **r**: Rolo pasa a ser el personaje controlado.

> Juanita no se controla con el teclado: ella va siempre pegada a su hermano. Y no hay teclas para cambiarse de disfraz: eso pasa solo, cuando los chicos pisan un vestidor.

## Los personajes

Los chicos que tenemos que modelar para nuestro juego son:
- **Tito**, que cuando visita una casa pide caramelos y aumenta el caos de la misma en una unidad.
- **Juanita**, la hermana menor de Tito, que cuando visita una casa sólo pide caramelos.
- **Rolo**, que no está interesado en los caramelos por eso **ni se disfraza**; cuando visita una casa lo único que hace es aumentar el caos en 5 unidades.

La casa que vamos a usar para nuestro juego tiene 3 habitantes, que se van rotando para abrir la puerta y dar caramelos a los chicos que los pidan:
- **Azucena**, la única a la que le importa de qué viene disfrazado el chico.
- **Jorge**, que es medio manirroto cuando la despensa está llena.
- **Sandra**, que da según cómo esté la casa.

Inicialmente hay 100 caramelos en la casa, un nivel 0 de caos y es Azucena quien abre la puerta.

## Requerimientos

### 1. Movernos por el barrio

- Rolo y Tito deben poder moverse de forma independiente, pero Juanita siempre debe moverse a la par de Tito. Se espera que **siempre** se encuentre una celda a la izquierda de su hermano.
- Rolo y Tito no pueden bajar más allá del y = 0.
- Rolo y Tito no pueden subir más arriba del suelo, donde se encuentra la casa.
- Si un personaje que se encuentra en el borde derecho o izquierdo de la pantalla se mueve por fuera de la misma, tiene que aparecer del otro lado (porque dio la vuelta a la manzana). Esto también implica que si Tito se encuentra en el borde izquierdo, Juanita debería aparecer en el extremo derecho, a la misma altura que Tito.

> Ver el archivo `movimientos.wlk`: ahí cada dirección sabe cuál es la posición siguiente a una posición dada, y por ahora ninguna se hace cargo de su borde. Las pruebas están en `movimientosYUbicaciones.wtest`.

> Antes de resolver a mano lo de Juanita en el borde izquierdo, miren si no hay ya algún objeto en el proyecto que sepa hacer exactamente eso.

### 2. Los vestidores y los disfraces

Los disfraces que pueden usar Tito y/o Juanita son los siguientes. Cada uno sabe cuánta **ternura** y cuánto **terror** genera, y además sabe su **nombre**:
- el disfraz de `superheroe` tiene ternura 5 y terror 0,
- el disfraz de `venom` tiene 0 ternura y terror 8,
- el disfraz de `harleyQuinn` tiene ternura 9 y terror 2.

Tanto Tito como Juanita usan el disfraz de `superheroe` al iniciar el juego, y pueden cambiarlo mandándoles el mensaje `disfraz(nuevoDisfraz)`.

En el barrio hay dos vestidores: `vestidorDeSuperheroes` y `vestidorDeAntiheroes`. Cuando un chico pasa por encima de uno, el vestidor lo viste (`vestir(unChico)`), y lo que pasa entonces depende de a quién le tocó:
- En el vestidor de superhéroes, tanto Tito como Juanita salen disfrazados de `superheroe`.
- En el vestidor de antihéroes, Tito sale disfrazado de `venom` y Juanita de `harleyQuinn`.
- Rolo puede pasar por cualquiera de los dos, pero él no se disfraza, así que sale igual que como entró.

> Ojo con la tentación de que el vestidor pregunte quién es el chico que pasó. El vestidor sabe qué **tipo** de disfraz ofrece; cada chico sabe cuál es *su* disfraz de ese tipo, o que directamente no se disfraza. Ya se propone una interfaz para los chicos y para los vestidores que debería facilitarles resolver este problema difícil 😉

Como Juanita va siempre una celda a la izquierda de Tito, cada hermano pisa el vestidor en un momento distinto: se cambian por separado, no juntos.

Por último, al cambiar el disfraz que usan Tito y Juanita, la imagen de cada personaje debe cambiar adecuadamente, siguiendo la convención `personaje-disfraz.png`. Ver las imágenes disponibles en la carpeta **assets** en caso de dudas.

> Ver `disfraces.wlk`, `chicos.wlk` y `vestidores.wlk`. Las pruebas están en `cambiarseDeDisfraz.wtest` y `comoSeVenLosDisfraces.wtest`; las de los disfraces deben completarse acorde a lo indicado en el nombre del test.

### 3. Cuántos caramelos quiere dar cada habitante

Todos los habitantes entienden `quiereDarleA(unChico)`, pero cada uno lo decide a su manera:

- **Azucena** da el equivalente a la ternura del disfraz del chico si le gusta ese disfraz, o 5 si no le gusta. Le gustan los disfraces adorables (aquellos que tienen ternura mayor a 6 y terror menor a 4).
- **Jorge** da un número al azar entre 5 y 15 cuando hay al menos 50 caramelos en la casa; de lo contrario baja su ración a 4.
- **Sandra** da 8 caramelos cuando la casa está en orden (si su nivel de caos es menor a 3), caso contrario da 2 caramelos.

> Notar que **la única que necesita mirar al chico es Azucena**: a Jorge y a Sandra les da exactamente lo mismo quién les toque y de qué venga disfrazado. Así y todo, **los tres entienden el mismo mensaje**.

Sobre el azar de Jorge: él no tira los dados por su cuenta, se lo pide a un colaborador que sabe dar números al azar. Y ese colaborador **se le puede cambiar** (es su `generadorDeAzar`), justamente para que en las pruebas podamos ponerle uno que sea predecible y así saber contra qué comparar.

> Definir las pruebas necesarias en `leGusta.wtest` y `cuantosCaramelosDarian.wtest`. **Antes de arrancar con los tests de Jorge, leer el comentario que está arriba del describe en `cuantosCaramelosDarian.wtest`**: explica la técnica y ya les deja armado el colaborador predecible que van a necesitar. Uno de los tests de Jorge viene resuelto como ejemplo.

#### Caso para pensar: combinación Rolo y Azucena

Como ya se explicó, la respuesta de **Azucena** depende del disfraz del chico, y **Rolo no se disfraza**.

En teoría no debería suceder que se ejecute `azucena.quiereDarleA(rolo)` en el contexto del juego, porque Rolo no va a pedir caramelos al visitar la casa (ver punto siguiente). La pregunta es: ¿qué sería esperable que pase si se evalúa esa consulta?

### 4. La visita a la casa

Cada vez que la casa recibe la visita de un chico debería pasar lo siguiente:
- Se abre la puerta, y en consecuencia el chico pide caramelos y/o hace bullicio.
- Se muestra un saludo saliendo de la casa, que depende de quién fue que abrió la puerta.
- Le pasa el turno al siguiente habitante: una vez que los 3 hayan atendido a las visitas (primero Azucena, luego Jorge y luego Sandra), le debería tocar nuevamente a Azucena.

Cuando un chico **pide caramelos**, la casa le entrega lo que el habitante que abrió la puerta quiera darle... salvo que no le alcance. Si el habitante quiere darle 10 caramelos y en la casa quedan sólo 3, el chico se lleva esos 3 y la casa se queda sin nada. Nunca se puede entregar más de lo que hay.

Los saludos que se muestran son:
- Azucena siempre se hace la asustada y dice "¡Ay, qué miedo! Jaja".
- Sandra saluda con un "¡Pasalo lindo y no hagas lío!" cuando la casa está en orden, y con un "¬¬" cuando no lo está.
- Jorge saluda con un "¡Feliz Navidad!".

En el caso de que luego de esta visita se termine la diversión, se espera un saludo que es independiente de quién abrió la puerta: "¡Suficiente por hoy! Nos vamos a dormir."

En el juego, la visita se dispara sola cuando un chico pasa por la puerta de la casa; eso ya está configurado.

> Las pruebas ya están armadas en `visitasALaCasa.wtest` y `saludos.wtest`.

### 5. La casa en pantalla

Toda la información del estado de la casa está hoy escondida en los objetos. Queremos poder verla mientras jugamos:

- Los caramelos que quedan en la casa se muestran arriba a la izquierda de la pantalla, como un texto que dice `Caramelos: 100`, y que va bajando a medida que los chicos se los llevan. Para eso está el objeto `contadorDeCaramelos`: es un componente visual que no tiene imagen, lo único que muestra es su texto.
- La imagen de la casa cambia según cuánto caos tenga:
  - `casa.png` mientras la casa está en orden,
  - `casa-desordenada.png` cuando el caos llegó a 3 pero todavía es menor a 10,
  - `casa-embrujada.png` de 10 para arriba.

> Las pruebas están en `comoSeVeLaCasa.wtest`.

> Las imágenes de la casa desordenada y embrujada son provisorias, están para que el juego arranque. Si les pinta dibujar unas mejores, adelante.

### 6. Se terminó la diversión

Saber si se terminó la diversión, que se cumple si no hay más caramelos en la casa o si su nivel de caos es mayor a 20. Esto determina el fin del juego. ¿Qué implica que termine el juego?
- Se espera que se muestre un cartel explicando que el juego terminó.
- Además cambia el saludo de la casa, como se explicó en el punto anterior.

> Las pruebas de cuándo se termina la diversión están en `saludos.wtest`. El cartel hay que armarlo en el método `mostrarFinDelJuego()` de `gameConfiguration.wlk`.

## BONUS: Requerimientos adicionales por si quedaron manija

### La despedida de los habitantes

Después de saludar y antes de que le toque al siguiente, el habitante que abrió la puerta podría hacer algo más:
  - Si quien abrió fue Azucena y quedan al menos 5 caramelos en la casa, se come uno.
  - Si quien abrió fue Jorge, acomoda un poco la casa bajando en 2 unidades el nivel de caos.
  - Sandra no hace nada en particular.

> Ver el describe BONUS en `visitasALaCasa.wtest`.

### Reinicio de juego

El juego de base no tiene forma de reiniciar el estado para arrancar nuevamente de cero. Agregar una configuración más de teclado, eligiendo la tecla que prefieran para este objetivo, que si se presiona, vuelva a configurar el juego con los objetos en su estado inicial.

### Sonidos

Pueden agregar un sonido asociado a cada habitante de la casa, para ayudar a distinguir quién fue que abrió la puerta en cada oportunidad, más allá de lo que se pueda deducir por el texto del saludo.

### Más elementos visuales

Ya mostramos los caramelos y el caos, pero hay mucho más para hacer. Por ejemplo, el nivel de caos también podría traducirse en basura tirada cerca de la casa, y a mayor nivel de caos, más basura podría mostrarse en escena. O los vestidores podrían avisar algo cuando alguien se cambia. Lo que les genere curiosidad para tratar de resolver, háganlo, suena como un planazo!
