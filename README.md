# Práctica grupal - PdeP MiT 2026

## Objetivos

- Trabajar en equipo usando un repositorio compartido.
- Poner en práctica las ideas principales de objetos: **encapsulamiento, delegación y polimorfismo**.
- Trabajar iterativamente con testeo unitario para validar problemas complejos.
- Entender las bases de cómo funciona Wollok Game.
- Divertirse :tada:

## Modalidad de trabajo

Luego de importar el proyecto en el IDE, cada integrante debería...
- Correr todos los tests del proyecto, para conocer la situación actual
- Elegir un problemita chico para resolver (incluyendo los tests asociados en caso de no estar ya implementados)
- Resolverlo asegurando que las pruebas para ese problema den verde y no haber roto nada de lo demás que andaba
- **Commitear** los cambios con una descripción representativa
- Antes de intentar pushear (en caso de que se hayan hecho cambios en el repo que no estén localmente, el push va a fallar), asegurate de hacer **Pull** para que se actualice tu repo local con lo más nuevo.
- Si al hacer pull se incorporaron cambios, volver a correr los tests
  - Si no hubieron conflictos, deberían seguir dando verde las pruebas de la funcionalidad desarrollada
  - Si hubo un conflicto, arreglarlo, correr los tests y commitear nuevamente
- **Pushear** los cambios, elegir un nuevo problemita chico y repetir el ciclo.

> Luego de cualquier pausa post push, antes de arrancar el ciclo, hacer pull otra vez para tener el repo local al día.

Tips para evitar conflictos durante la práctica:
  1. ¡Hablarse! coordinen qué problemita agarrar a continuación, avisen al resto cuando suben cambios al repo
  2. Asegurar que las iteraciones sean lo más cortas posibles. Commits chicos -> menos chances de pisarse.
  
> Las consignas se encuentran en el archivo `consignas/README.md`. No son fáciles de "repartir", están interconectadas. Pónganse de acuerdo en cómo encarar los requerimientos, y trabajen en conjunto en pos de completarlos gradualmente. Es más fácil repartirse objetos a implementar luego de decidir la interfaz que requerimientos completos.   

## Cómo probar el programa

Lo que más nos va a interesar inicialmente es el **testeo automático**, podés encontrar todas las pruebas en varios archivos dentro de la carpeta `test`. Se pueden correr todos los tests de un archivo .wtest (abriendo ese archivo, con las opciones "Ejecutar todos los tests" y "Ejecutar describre" integradas al IDE), así como también todos los tests del proyecto (usando el comando "Wollok: Run all tests" desde la paleta de comandos del VSCode). Se recomienda correr todos los tests del proyecto para esta ejercitación.

Una vez que avancen lo suficiente con lo que se pide desarrollar, la idea es que empiecen a ver el resultado de su trabajo mediante la interfaz gráfica de Wollok Game.

Para iniciar el juego hay que correr desde el IDE el archivo `halloween.wpgm` que se encuentra en la raíz del proyecto con la opción "Ejecutar programa" que vas a encontrar integrada en el editor de VSCode. Para más información de cómo interactuar con sus personajes dentro del juego, ver la explicación completa en las consignas de la práctica.