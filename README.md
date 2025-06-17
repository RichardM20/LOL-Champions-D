# LOL Champions D

Aplicacion mobile desarollada bajo `clean architecture` junto con `bloc` `cubit` e inyeccion de dependencias con el plugin `get_it`.  

En ella se podra ver los campones del juego League of Legends (PC)
y su informacion tal como posicion, tipo de campeon, skins y habilides.

## Preview

🔗 [Watch demo](https://drive.google.com/file/d/15Dn1JWXPD_3JxRDXjwHIC4ZQ3ZgULAKq/view?usp=sharing)

## Informacion

Los datos obtenidos por medio de la api son de Riot Games, por lo que la informacion mostrada sera obtenida tal cual los datos se obtengan.

Las pocisiones de los campones asignadas seran dependiendo de su tipo, para el filtro del tipo de campeon me base en los datos de internet sobre el tipo de campeon que destacada en una posicion.

## Utilides

- Riot Games [Pagina oficial](https://developer.riotgames.com/docs/lol)
Ahi indican el paso a paso para poder utilizar la api sin ningun problema en la aplicacion.
- EndPoints [APIS](https://developer.riotgames.com/apis)  
En el anterior estan las apis para el consumo de datos.

- Plugins usados principalmente: [flutter_bloc](https://pub.dev/packages/flutter_bloc), [get_it](https://pub.dev/packages/get_it), [screen_util](https://pub.dev/packages/flutter_screenutil), [go_router](https://pub.dev/packages/go_router), [http](https://pub.dev/packages/http)

Pense en implementar algo mas grande y compacto para traer los detalles de la cuenta del jugador, sus campeones con mayor maestria, ultimas partidas ganadas, rango, etc...
Para facilitar la visualizacion de datos del jugador y que no sea necesario abrir el juego y esperar todo para ello.

Pero de momento no lo hare ya que debo admitir que en su momento pense que esto seriviria para `League of Legends PC` como `League of legends Mobile` o bien sea `League of Legends:Wild Rift`
Pero tarde descubri que a diferencia de pc la api del juego mobile no esta disponible para uso publico.

> Recuerda que si te interesa mejorar algun proyecto eres bienvenido/a para colaborar, en mi perfil estan mis redes para contactarme.
