/*
OpenCL RandomForestClassifier
classifier_class_name = ObjectClassifier
feature_specification = area
num_ground_truth_dimensions = 1
num_classes = 3
num_features = 1
max_depth = 2
num_trees = 10
apoc_version = 0.5.9
*/
__kernel void predict (IMAGE_in0_TYPE in0, IMAGE_out_TYPE out) {
 sampler_t sampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
 const int x = get_global_id(0);
 const int y = get_global_id(1);
 const int z = get_global_id(2);
 float i0 = READ_IMAGE(in0, sampler, POS_in0_INSTANCE(x,y,z,0)).x;
 float s0=0;
 float s1=0;
 float s2=0;
if(i0<379.5){
 s2+=2.0;
} else {
 if(i0<668.0){
  s0+=2.0;
  s1+=5.0;
 } else {
  s0+=3.0;
 }
}
if(i0<382.0){
 s2+=5.0;
} else {
 if(i0<565.0){
  s1+=2.0;
 } else {
  s0+=5.0;
 }
}
if(i0<427.0){
 s2+=7.0;
} else {
 s0+=5.0;
}
if(i0<382.0){
 s2+=7.0;
} else {
 if(i0<580.5){
  s1+=2.0;
 } else {
  s0+=3.0;
 }
}
if(i0<427.0){
 s2+=8.0;
} else {
 if(i0<634.0){
  s0+=1.0;
 } else {
  s0+=1.0;
  s1+=2.0;
 }
}
if(i0<379.5){
 s2+=6.0;
} else {
 if(i0<565.0){
  s1+=1.0;
 } else {
  s0+=4.0;
  s1+=1.0;
 }
}
if(i0<382.0){
 s2+=4.0;
} else {
 if(i0<565.0){
  s1+=1.0;
 } else {
  s0+=6.0;
  s1+=1.0;
 }
}
if(i0<357.5){
 s2+=5.0;
} else {
 if(i0<668.0){
  s0+=1.0;
  s1+=3.0;
 } else {
  s0+=3.0;
 }
}
if(i0<565.0){
 if(i0<382.0){
  s2+=4.0;
 } else {
  s1+=3.0;
 }
} else {
 s0+=5.0;
}
if(i0<382.0){
 s2+=6.0;
} else {
 if(i0<668.0){
  s1+=3.0;
 } else {
  s0+=3.0;
 }
}
 float max_s=s0;
 int cls=1;
 if (max_s < s1) {
  max_s = s1;
  cls=2;
 }
 if (max_s < s2) {
  max_s = s2;
  cls=3;
 }
 WRITE_IMAGE (out, POS_out_INSTANCE(x,y,z,0), cls);
}
