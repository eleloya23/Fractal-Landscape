/********************************************************************
POV-Ray 3.6 Include File
File:         house.inc

Author: Rafael Hinojosa
*********************************************************************/

#ifndef (House_Version)

#declare House_Version = 1.0;
#declare House_Temp = version;

#version 3.7;
global_settings { assumed_gamma 1.2 } 

#include "colors.inc"
#include "textures.inc"     
#include "woods.inc"
#include "glass.inc"                                                                                    
                                                                                   
#macro CUBE(P1,P2,T1,T2,T3,T4,T5,T6)
  #local X1=min(P1.x,P2.x);
  #local X2=max(P1.x,P2.x);
  #local Y1=min(P1.y,P2.y);
  #local Y2=max(P1.y,P2.y);
  #local Z1=min(P1.z,P2.z);
  #local Z2=max(P1.z,P2.z);
  intersection {
    plane { x, X2 texture {T1}}
    plane {-x,-X1 texture {T2}}
    plane { y, Y2 texture {T3}}
    plane {-y,-Y1 texture {T4}}
    plane { z, Z2 texture {T5}}
    plane {-z,-Z1 texture {T6}}
  }
#end

//Invoke the macro, passing it the points at opposite corners
//and six textures


camera {
    location <5,5,-20>
    look_at <1,1,-1>
    angle 30

}        
  
background {color <0.1,0.1,.1>}  
    
    

#declare O_House = merge{ 
torus { 0.25, 0.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <90,0,0>
        }
        scale 2   
        } 
        
        rotate <90,0,0> 
        translate <0.5,1.8,-1.12>  
        }    
        
 
difference {        

sphere { <0.5,1.8,-1.12>, .25 }

plane { z, -1.12}


       finish { reflection {0.3} ambient 0 diffuse 0 }
      
}         


merge {
 sphere {<1.7,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        }   
    
 sphere {<1.7,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 sphere {<1,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 sphere {<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 cylinder {<1.7,1,-1.001>,<1.7,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        }   
    
 cylinder {<1.7,1,-1.001>,<1,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
                       
 cylinder {<1.7,0.5,-1.001>,<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 

 cylinder {<1,1,-1.001>,<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 

}
     
merge {
 sphere {<1.7,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        }   
    
 sphere {<1.7,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 sphere {<1,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 sphere {<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
    
 cylinder {<1.7,1,-1.001>,<1.7,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        }   
    
 cylinder {<1.7,1,-1.001>,<1,1,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
                       
 cylinder {<1.7,0.5,-1.001>,<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 

 cylinder {<1,1,-1.001>,<1,0.5,-1.001>,.01 
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
        } 
      translate <-1.7,0,0>
}


       
box { <1.7,1,-1.001>,<1, 0.5,-1.001> 
    finish { reflection {0.3} ambient 0 diffuse 0 }} 
       
box { <0,1,-1.001>,<-0.7, 0.5,-1.001> 
    finish { reflection {0.3} ambient 0 diffuse 0 }}   


merge {  
triangle {  <-1.1,1.3, -1.101>,
            < 2.10, 1.3 ,-1.101, >,
            < 0.50,2.60,-1.101>     
              pigment {Black}
            
            }        

triangle {  <-1.05,1.32, -1.11>,
            < 2.05, 1.32 ,-1.11, >,
            < 0.50,2.58,-1.11>     
              texture { pigment
        { image_map
        { png "wood1.png"
           map_type 0
         }     
         rotate <0,0,90>
        }
        scale 2   
        }
            
            }   
            
            }
   
   
merge {                                                                         
                                                                                             
prism { -1.1, 1.1, 3
    <-1.1, 0>,
    < 2.10, -0.00>,
   < 0.50, 1.30>
                 //techo
   texture { pigment
        { image_map
        { png "shingles1.png"
           map_type 0
         }     
         rotate <90,0,90>
        }
        scale 1   
        }
     rotate <-90,0,0>  
     translate <0,1.3,0>
  }

box{ <0.20,0,-1>,<0.80,0.95,-1.001>       //door
        texture { pigment
        { image_map
        { png "door1.png"
           map_type 0
         }     
         rotate <0,0,0>   
         translate <0.5,0,0>
        }  
        scale 0.5
        translate <0.5,0,0>
        }   
       


    }
    
            
     

               
CUBE(<-1,0,-1>,<2,1.3,1>,             //house
  texture { pigment
        { image_map
        { png "wood1.png"
           map_type 0
         }     
         rotate <90,0,90>
        }
        scale 2   
        },
 texture { T_Wood20
            finish { specular 0.15 roughness 0.15 ambient 0.3 }
            rotate <45, 10, 45>
            translate x*10
        },
 texture { T_Wood20
            finish { specular 0.15 roughness 0.15 ambient 0.3 }
            rotate <45, 10, 45>
            translate x*10
        },
 texture { T_Wood20
            finish { specular 0.15 roughness 0.15 ambient 0.3 }
            rotate <45, 10, 45>
            translate x*10
        },
 texture { T_Wood20
            finish { specular 0.15 roughness 0.15 ambient 0.3 }
            rotate <45, 10, 45>
            translate x*10
        },
 texture { pigment
        { image_map
        { png "wood1.png"
           map_type 0
         }     
         rotate <0,0,90>
        }          
            scale 2
        }
)
     
       
       
} 
               
box{ <-1.3,0,-1.3>,<2.3, -0.01, 1.3>   //base
   texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <90,0,0>
        }
        scale 2   
        }
     }       
     
     
box{ <-0.5,0,-1.3>,<1.5,-0.1,-1.4>    //escalon 1
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 2   
        }
            }     
            
 box{ <-0.5,-0.1,-1.4>,<1.5,-0.2,-1.5>    //escalon 2
    texture { pigment
        { image_map
        { png "wood3.png"
           map_type 0
         }     
         rotate <00,0,0>
        }
        scale 0.2   
        }
            }
     
cylinder{<2.2,0,1.2>,<2.2,-0.25,1.2>, 0.05
          texture { pigment
        { image_map
        { png "log1.png"
           map_type 0
         }     
         rotate <0,0,0>
        }
        scale 0.2   
        }
     }
        
        
 cylinder{<2.2,0,-1.2>,<2.2,-0.25,-1.2>, 0.05
          texture { pigment
        { image_map
        { png "log1.png"
           map_type 0
         }     
         rotate <0,0,0>
        }
        scale 2   
        }
        }
        
 cylinder{<-1.2,0,1.2>,<-1.2,-0.25,1.2>, 0.05
          texture { pigment
        { image_map
        { png "log1.png"
           map_type 0
         }     
         rotate <0,0,0>
        }
        scale 2   
        }
        }
        
 cylinder{<-1.2,0,-1.2>,<-1.2,-0.25,-1.2>, 0.05
          texture { pigment
        { image_map
        { png "log1.png"
           map_type 0
         }     
         rotate <0,0,0>
        }
        scale 2   
        }
        } 
        
   // termina la casa y se puede modificar
   translate <0,0,0>  
   rotate <0,0,0> 
   scale 1
        
} 



#version House_Temp;
#end