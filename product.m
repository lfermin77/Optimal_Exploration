function [out] = product (a, b)
  
  semiprod = 4*(a*b + b*a)/( trace(a)*trace(b) );
#  semiprod/=trace(a)*trace(b)/4
  
  semisum = 2*(a)/trace(a)+ 2*b/trace(b)
  
  out = semisum - semiprod
  
  inner_prod=trace(a*b)/( trace(a)*trace(b) )

  
  selec=2-4*trace(a*b)/(trace(a)*trace(b) )
#  out=2*out/trace(out);
#  out=out/(2-trace(a*b));

  out=out/selec;

  out=out * (trace(a)*trace(b) )/4;