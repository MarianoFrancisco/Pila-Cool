class Pila_Lista inherits A2I{
   start:Pila<-new Pila;
   size:Int<-new Int;
   --verificamos si esta vacio o no
   pila_vacia():Bool{
      isvoid start
   };
   --agregamos nodo
   agregar_nodo(i:String):SELF_TYPE{
      let nuevo:Pila<-new Pila, null:Pila<-new Pila in {
         nuevo.setear_elemento(i);
         nuevo.setear_siguiente(start);
         start<-nuevo;
         size<-size+1;
         self;
      }
   };
   --eliminamos nodo
   delete_nodo():SELF_TYPE{
      let nuevo:Pila<-new Pila, null:Pila<-new Pila  in {
         start<-start.obtener_siguiente();
         size<-size-1;
         self;
      }
   };
   --hacemos intercambio de valores en la pila
   reordenar():SELF_TYPE{
      let primerdato:String, segundoDato:String in {
         primerdato<-start.obtener_siguiente().obtener_siguiente().obtener_elemento();
         segundoDato<-start.obtener_siguiente().obtener_elemento();
         delete_nodo();
         delete_nodo();
         delete_nodo();
         agregar_nodo(segundoDato);
         agregar_nodo(primerdato);
         self;
      }
   };
   --devolvemos pila inicio
   devolver_start():Pila{
      start
   };--obtenemos el elemento que posee start
   conseguir_start():String{
      start.obtener_elemento()
   };--obtenemos cuantos elementos hay en la pila
   cantidad_pila():Int{
      size
   };--hacemos un listado de caracteres
   obtener_listado():String{
      let route:Pila<-start, null:Pila<-new Pila,list:String<-new String in {
         while(not(isvoid route))loop
            let dato:String<-new String in {
               dato<-route.obtener_elemento();
               list<-list.concat(dato);
               route<-route.obtener_siguiente();
            }
         pool;
         list;
      }
   };--imprimimos lista
   imprimir_lista():SELF_TYPE{
      let route:Pila<-start, null:Pila<-new Pila in {
         while(not(isvoid route))loop
            let dato:String<-new String in {
               dato<-route.obtener_elemento();
               if(isvoid route.obtener_siguiente())then (new IO).out_string(dato)
               else (new IO).out_string(dato.concat("\n")) fi;
               route<-route.obtener_siguiente();
            }
         pool;
         self;
      }
   };
};

class Pila inherits A2I {
    elemento: String; 
    siguiente: Pila;
    --incializar variables
    agregar_pila(i: String, n: Pila): Pila{
        {
            elemento <- i;--nuestro elemento insertado
            siguiente <- n;--nuestra pila
            self;
        }
    };
    --metodo set para siguiente y elemento
    setear_siguiente(nuevo:Pila):SELF_TYPE{
      {
         siguiente<-nuevo;
         self;
      } 
    };
    setear_elemento(nuevo:String):SELF_TYPE{
      {
         elemento<-nuevo;
         self;
      } 
    };
    --metodo get para siguiente y elemento
    obtener_siguiente():Pila{
      siguiente
    };
    obtener_elemento():String{
      elemento
    };
};
class Main inherits IO {--creamos variables
   cadenaRecibida: String;
   nuevaPila:Pila_Lista<-new Pila_Lista;
   main() : Object {
      {
         out_string(">");
         cadenaRecibida<-in_string();--ciclo para repitencia de instrucciones
         while(not(cadenaRecibida="x"))loop
            {
               if(cadenaRecibida="+") then{--enviamos push(x)
                  nuevaPila.agregar_nodo(cadenaRecibida);
               }else {
                  if(cadenaRecibida="s") then{--enviamos push(s)
                     nuevaPila.agregar_nodo(cadenaRecibida);
                  }else{
                     if(cadenaRecibida="d")then{--enviamos comando obtener elementos
                        nuevaPila.imprimir_lista();
                     }else{
                        if(cadenaRecibida="e")then{--solicitamos acciones en el usuario
                           if(2<nuevaPila.obtener_listado().length()) then {
                              if(nuevaPila.conseguir_start()="+")then--si es +, hacemos sumatoria
                                 let primero:String, segundo:String in {
                                    primero<-nuevaPila.devolver_start().obtener_siguiente().obtener_elemento();
                                    segundo<-nuevaPila.devolver_start().obtener_siguiente().obtener_siguiente().obtener_elemento();
                                    if((new A2I).c2i(primero) < 10)then{
                                       if((new A2I).c2i(segundo) < 10)then
                                          (
                                             let operacion:Int in{
                                                operacion<-(new A2I).c2i(primero)+(new A2I).c2i(segundo);
                                                nuevaPila.delete_nodo();
                                                nuevaPila.delete_nodo();
                                                nuevaPila.delete_nodo();
                                                nuevaPila.agregar_nodo((new A2I).i2a(operacion));
                                             }
                                          )
                                          else out_string("")--no venia numero
                                          fi;
                                    }else out_string("")--no venia numero
                                    fi;}
                              else{--si es s, hacemos intercambio de valores ultimos en la pila
                                 if(nuevaPila.conseguir_start()="s") then nuevaPila.reordenar()
                                 else out_string("")--no pasa nada
                                 fi;
                              }fi;
                           }else out_string("")--no habria 3 datos
                           fi;
                        }else{
                           if((new A2I).c2i(cadenaRecibida) < 10)then{
                              nuevaPila.agregar_nodo(cadenaRecibida);
                              out_string("");   
                           }else out_string("error")--aqui iria algun error
                           fi;
                        }fi;
                     }fi;
                  }fi;
               } fi;
               out_string(">");
               cadenaRecibida<-in_string();
         }pool;
      }
   };
};