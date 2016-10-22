#include "colors.inc"
#include "textures.inc"
#include "geomorph_txtr.inc"

// some users may want to un-comment and adjust the following line to suit the brightness of their monitor
//global_settings {  assumed_gamma 2.6}
//global_settings { max_trace_level 20}

#declare sand_color=<0.75,0.55,0.35>;


camera {  location <1, 6, -15> look_at <1,0,0> focal_point <0,5,-10> blur_samples 15 aperture .3 }
light_source { <30, 200, -150>, 1 }

sphere { <0,5,-10>, 1 pigment {Red}}

sky_sphere {pigment{color rgb<0.19,0.3,0.8>}}


#declare texWater = texture{
                      pigment{rgb <.2,.2,.2>}
                      normal{
                        crackle 0.15
                        turbulence 0.3              
                        scale 0.2
                      }                      
                      finish{
                        ambient 0.15
                        diffuse 0.55
                        brilliance 6.0
                        phong 0.8
                        phong_size 120
                        reflection 0.6
                      }
                    }

#declare HFTex = texture{
                   pigment{
                     gradient y
                     color_map{  
                       [0 color Yellow]
                       [0.1 color Green]  
                       [0.35 color Gray]
                       [0.5 rgb 1]
                       [0.6 rgb 1]
                     }
                   }
                 }  
    

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


#declare Island = height_field {
  png "sanddunes.png"
  smooth
  pigment{color Brown}
  translate <-0.5,0,-0.5>
  scale <80,10,80>  
}  

object  {Island  texture {sand1 scale 0.1 rotate y*45} }


object{Island translate <0, -1, 0>}

//object{Island rotate y*120 scale <12.5,9,10> translate <150,-1,240> texture{Sapphire_Agate scale 20}}        

// plane{ y, 1 texture{texWater}}

plane{y,500 hollow texture{texClouds scale 20 }} 