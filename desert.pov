#include "colors.inc"
#include "textures.inc"
#include "geomorph_txtr.inc"
#include "palm/palm.inc"
#include "realskies.inc"
#include "functions.inc"

// some users may want to un-comment and adjust the following line to suit the brightness of their monitor
//global_settings {  assumed_gamma 2.6}
//global_settings { max_trace_level 20}

#declare sand_color=<0.75,0.55,0.35>;

// Palm height
#declare HEIGHT = palm_13_height * 1.3;
#declare WIDTH = HEIGHT*400/600;

// Blur code : focal_point <0,5,-10> blur_samples 15 aperture .3
camera {  location <1, 6, -15> look_at <1,0,0> }
light_source { <30, 200, -150>, 1 }

// Sphere
// sphere { <0,5,-10>, 1 pigment {Red}}

#declare texClouds = texture{
  pigment{
    bozo
    turbulence .6  octaves 19 omega 0.7 lambda 2
    color_map {
      [0   rgb <0.5,0.5,0.5> ]
      [0.3 rgb <0.9,0.9,0.9> ]
      [0.5 rgbt <1,1,1,1>    ]                      
      [1   rgbt <1,1,1,1>    ]                      
    }
    scale 528      
  }
  finish {ambient 1 diffuse 0}  
}    


#declare Desert = height_field {
  png "sanddunes.png"
  smooth
  pigment{color Brown}
  translate <-0.5,0,-0.5>
  scale <80,10,80>  
}  

// Adding texture to desert
object  {Desert  texture {sand1 scale 0.1 rotate y*45} }



// Adding palm tree
union { 
  object { 
    palm_13_stems
    pigment {color rgb <144/255, 104/255, 78/255>} 
  }
  object { 
    palm_13_leaves
    texture { pigment {color rgb <0, 1, 0>} 
      finish { ambient 0.15 diffuse 0.8 }
    }
  }
  rotate 90*y 
  translate <22, 20, 2>
  scale .2
}

// Sky
sky_sphere { sky_realsky_04 translate -0.15*y}

// -+-+- Water -+-+-
// Taken from realskies.inc example file

merge {
  plane {
      y, 4.1
      material {
          texture {
              pigment {
                  color rgb <0.8, 0.9, 1>
              }
              finish {
                  ambient 0.0
                  diffuse 0.0

                  reflection {
                      0.2, 1.0
                      fresnel on
                  }

                  specular 0.4
                  roughness 0.003
              }
              normal {
                  function {
                      f_ridged_mf(x/9, y, z/5, 0.1, 3.0, 7, 0.7, 0.7, 2)
                  } 0.6
                  turbulence 2.5
                  scale 0.13
              }
          }
          interior { ior 1.3 }
      }
      bounded_by { box{<-2,4.2,30>, <13,4.2,-6>}}
  }
  object{Desert translate <0, -1, 0>}

}

  
  


// union 5
//     object {
//        quaking_aspen_13_stems
//        pigment { color rgb <144/255, 104/255, 78/255> } // brown 
//     }
//     object {
//        quaking_aspen_13_leaves
//        pigment { color rgb <0, 1, 0> } // green 
//     }
// }

//object{Desert rotate y*120 scale <12.5,9,10> translate <150,-1,240> texture{Sapphire_Agate scale 20}}        

// plane{ y, 1 texture{texWater}}

plane{y,500 hollow texture{texClouds scale 20 }} 