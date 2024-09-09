module H3_pot
implicit none
integer, parameter, private :: nat = 3
integer, parameter, private :: n1=3, n2=20, n3=20, n4=1
real(8) :: ylinear(2) 
real(8) :: xstandard(n1,2)
real(8) :: w(n1,n2), w1(n2,n3), w2(n3,n4)
real(8) :: b(n2), b1(n3), b2(n4)


!variable: input ; function: standard ; args: {}
data xstandard(1,:)/2.17133465e-01, 2.24539901e-01/
data xstandard(2,:)/5.70394791e-02, 8.87769668e-02/
data xstandard(3,:)/2.01653912e-02, 3.83597464e-02/

!variable: output ; function: linear ; args: {}
data ylinear(:)/1.42534187e-01, -1.74521789e-01/

data w(1,1:5)/2.02112859e+00,-9.21719633e-01,2.69089724e-02,1.38371737e+00,1.09553360e+00/
data w(1,6:10)/8.59137828e-01,-7.01457173e-01,-1.15628263e+00,9.36141337e-01,-1.40368350e+00/
data w(1,11:15)/8.41969792e-01,-3.69833703e+00,-3.16068290e-01,1.91013304e+00,1.16010382e-01/
data w(1,16:20)/-3.46370735e+00,-2.46179872e+00,6.23996141e+00,3.61247937e+00,-9.54661355e-01/

data w(2,1:5)/3.27244561e+00,-1.70576614e+00,-2.57753989e+00,-2.17885766e-01,-3.71582901e+00/
data w(2,6:10)/7.98318456e-01,-4.79262151e-01,-9.54814278e-01,1.42147526e+00,-3.17267711e-02/
data w(2,11:15)/5.39300926e-01,5.19378029e+00,-5.09172857e-01,2.40552867e+00,8.22772999e-01/
data w(2,16:20)/2.04758685e-01,1.38854782e+00,-5.84650766e+00,9.28947231e-01,2.93913152e+00/

data w(3,1:5)/-4.05885336e+00,-3.88967599e+00,-4.87367498e+00,2.84308734e+00,5.16988334e-01/
data w(3,6:10)/-1.04859193e+01,1.32155035e+00,4.45116926e+00,3.34967670e+00,4.83599660e+00/
data w(3,11:15)/2.44504261e+00,-2.77505897e+00,-6.78348273e+00,-6.54489042e+00,3.22862696e+00/
data w(3,16:20)/1.46704855e+00,-1.59493342e+00,1.99840526e+00,1.60088755e+00,4.07247063e-01/


data b(1)/2.06231759e+00/
data b(2)/-4.92129022e+00/
data b(3)/-5.22520277e+00/
data b(4)/2.37245842e+00/
data b(5)/-6.12925706e-01/
data b(6)/-4.70181840e+00/
data b(7)/-1.93848309e+00/
data b(8)/1.99286686e+00/
data b(9)/3.56578250e+00/
data b(10)/2.72168900e+00/
data b(11)/-1.65162665e-01/
data b(12)/2.89197746e+00/
data b(13)/-4.38510141e+00/
data b(14)/-4.15873991e+00/
data b(15)/6.22426716e+00/
data b(16)/7.57962021e+00/
data b(17)/-4.04909277e-01/
data b(18)/-5.90469101e+00/
data b(19)/3.72199102e+00/
data b(20)/1.25147533e+00/

data w1(1,1:5)/-9.30894962e-01,3.11739019e-01,1.84947389e-01,-1.25139557e+00,-4.20586798e-01/
data w1(1,6:10)/-6.12936202e-01,-1.32472337e+00,-4.43225907e+00,3.00497601e-02,-2.43355236e-01/
data w1(1,11:15)/-1.13517208e+00,-2.25062305e+00,-1.19695950e+00,-1.05722691e+00,3.86548729e-01/
data w1(1,16:20)/-1.89778967e+00,-1.37530035e-01,4.31349035e-01,-1.26246414e+00,5.93685659e-01/

data w1(2,1:5)/-1.20595069e+00,-1.19971917e+00,-1.14566077e+00,-9.50167484e-01,-1.38416542e+00/
data w1(2,6:10)/5.29897587e-01,-6.41196427e-01,5.38343825e+00,-1.40502391e+00,-1.29554258e+00/
data w1(2,11:15)/-1.12518090e+00,-3.93340539e-01,-4.00806815e-01,-9.63148017e-01,-1.05490440e+00/
data w1(2,16:20)/-3.91781325e-01,-4.02018163e-02,3.81090443e-01,3.63993716e-02,6.31376142e-02/

data w1(3,1:5)/-1.22476126e+00,-1.49274199e+00,-1.24149968e+00,-1.31520811e+00,-1.70096580e+00/
data w1(3,6:10)/8.86220400e-01,-5.43099755e-01,6.56208370e+00,-1.57154282e+00,-1.28711974e+00/
data w1(3,11:15)/-1.02169254e+00,-3.76652288e-01,-2.59404309e-01,-1.16718957e+00,-1.54805568e+00/
data w1(3,16:20)/-4.98929948e-01,-3.54639118e-01,8.67787670e-02,-3.96995318e-02,7.17405087e-01/

data w1(4,1:5)/-6.13418022e-01,-5.59094299e-02,-3.04447610e-01,-5.82930702e-01,-5.67444047e-01/
data w1(4,6:10)/-1.45457015e+00,1.18228389e-01,-1.08907535e+00,-5.96529894e-03,-2.93371747e-01/
data w1(4,11:15)/-9.31512933e-01,1.67818944e-01,1.31651414e-01,-7.58814841e-01,-1.51126264e-02/
data w1(4,16:20)/1.21350885e+00,-1.23150472e+00,-9.28005408e-01,-1.38139999e+00,-2.36517019e+00/

data w1(5,1:5)/-8.77630832e-01,-8.48977115e-01,-7.73713439e-01,-7.05466859e-01,-1.42694381e+00/
data w1(5,6:10)/-5.04965183e-01,7.92078611e-01,4.10653241e+00,-5.48387753e-01,-6.16479758e-01/
data w1(5,11:15)/-7.33596811e-01,-1.72621508e-01,-3.22762791e-01,-7.95890108e-01,-1.35624436e+00/
data w1(5,16:20)/3.22071011e+00,8.10637337e-01,-2.07769931e+00,-6.52979728e-01,-7.68066142e-01/

data w1(6,1:5)/-1.21190286e+00,-1.26663853e+00,-1.18312917e+00,-6.43131944e-01,-5.83133693e-02/
data w1(6,6:10)/-5.94679051e-02,-6.67528707e-02,1.04447447e+01,-6.44393198e-01,-1.11635246e+00/
data w1(6,11:15)/-1.11310798e+00,4.89712619e-01,-7.61720292e-01,-1.24160597e+00,-5.73832357e-01/
data w1(6,16:20)/-4.45602932e+00,-1.53412465e+00,4.37802243e-01,-2.50061874e-01,5.48495603e-01/

data w1(7,1:5)/-8.78101893e-01,-3.40709028e+00,-2.42998747e+00,-6.19203799e-01,-4.46985906e+00/
data w1(7,6:10)/-5.49323120e-01,1.40988098e+00,2.63573064e+00,-2.26012276e+00,-2.04831327e+00/
data w1(7,11:15)/-3.51640711e-01,3.40529665e+00,2.52848107e+00,-5.85547273e-01,-4.06252074e+00/
data w1(7,16:20)/1.76931920e-01,-4.40623421e+00,8.94545946e-02,8.41102557e-01,-9.08450690e-01/

data w1(8,1:5)/-6.51709217e-01,-2.87717491e-01,-1.74678408e-01,-5.39187316e-01,-1.68884061e+00/
data w1(8,6:10)/-1.11132475e+00,-3.64833494e-01,-1.48439959e+00,2.14571794e-02,-2.84138886e-01/
data w1(8,11:15)/-9.34078005e-01,-3.72438206e-01,-3.47071179e-01,-7.09278997e-01,3.69031833e-01/
data w1(8,16:20)/3.05620494e+00,-1.07843238e+00,5.91109584e-01,-1.01742030e+00,-1.72535263e+00/

data w1(9,1:5)/-6.46643210e-01,-2.17781697e-01,1.35710047e-02,-4.18219877e-01,-1.06037119e+00/
data w1(9,6:10)/-1.60383278e+00,-1.93706659e-01,-1.98472741e+00,1.06629269e-01,-1.24860636e-01/
data w1(9,11:15)/-6.81104866e-01,-4.72246611e-01,-6.01682059e-01,-5.72677242e-01,-5.57795749e-02/
data w1(9,16:20)/7.11168528e-01,-1.48390408e+00,-5.75031824e-01,-1.26465818e+00,-1.39086745e+00/

data w1(10,1:5)/-8.17163016e-01,-3.86126563e-01,-1.72594072e-01,-4.70694866e-01,-1.97971001e+00/
data w1(10,6:10)/-1.28979574e+00,-4.40174272e-01,-2.18560068e+00,4.53129898e-03,-9.26816137e-02/
data w1(10,11:15)/-9.85660179e-01,-5.99811843e-01,-5.23146765e-01,-7.76142008e-01,-1.99024066e-01/
data w1(10,16:20)/1.94506304e+00,-1.06409852e+00,4.55529012e-01,-7.69373543e-01,-1.41874510e+00/

data w1(11,1:5)/-6.39159080e-01,-8.11809790e-02,-4.89422977e-01,-9.06431568e-01,-1.29782600e-01/
data w1(11,6:10)/-1.38714122e+00,3.12087273e-01,7.02541823e-01,-1.42700453e-01,-3.33451519e-01/
data w1(11,11:15)/-8.48823650e-01,7.69906299e-02,1.50106720e-01,-7.35817339e-01,1.60926200e-01/
data w1(11,16:20)/1.02765186e+00,-6.20524845e-01,-1.22946617e+00,-1.02626532e+00,-1.68843586e+00/

data w1(12,1:5)/-9.75567693e-01,6.06890120e-01,2.30508639e-01,-1.03878970e+00,3.62173133e+00/
data w1(12,6:10)/-4.87302467e-01,-1.58802376e+00,-2.03012638e+00,3.80168081e-01,1.15906880e-01/
data w1(12,11:15)/-1.52163549e+00,-1.54507852e+00,-1.98956918e+00,-9.58385546e-01,1.85783690e+00/
data w1(12,16:20)/-2.25674548e+00,8.19100457e-01,1.74082895e+00,-9.12476646e-01,-3.89040494e-01/

data w1(13,1:5)/-9.70227902e-01,-1.10865958e+00,-1.54269859e+00,-1.11572146e+00,-1.54930720e+00/
data w1(13,6:10)/4.47933488e-01,-6.86627645e-01,5.37557775e+00,-1.58553301e+00,-1.37608793e+00/
data w1(13,11:15)/-9.03208069e-01,-2.71585281e-01,-6.57278872e-01,-1.17498248e+00,-1.18969398e+00/
data w1(13,16:20)/-1.97770395e+00,-5.27530803e-01,7.56115239e-01,-1.37356960e-01,3.30920721e-01/

data w1(14,1:5)/-8.67389188e-01,-1.48462166e+00,-1.40556852e+00,-1.14538904e+00,-9.42365664e-01/
data w1(14,6:10)/3.75200425e-01,-4.96457767e-01,6.19339317e+00,-1.37083227e+00,-1.42736932e+00/
data w1(14,11:15)/-9.50434577e-01,-1.74877886e-01,-7.34313151e-01,-9.44464015e-01,-4.04074568e-01/
data w1(14,16:20)/-2.69918681e+00,-8.17383939e-01,9.36189979e-02,-2.71094926e-01,9.08895393e-01/

data w1(15,1:5)/-9.13326692e-01,-3.85450068e-01,-7.42572343e-01,-1.16146001e+00,-1.08680689e+00/
data w1(15,6:10)/-1.07447154e+00,4.21048865e-02,-2.33326387e+00,-3.82198126e-01,-8.86573065e-01/
data w1(15,11:15)/-1.19530323e+00,-8.42569495e-01,-3.53369370e-01,-8.47771339e-01,9.81288886e-01/
data w1(15,16:20)/2.57071582e+00,-2.75667496e-01,4.08066500e-01,-4.90822962e-01,-7.13076291e-01/

data w1(16,1:5)/-1.46407484e+00,-1.14313927e+00,-1.34800601e+00,-1.06503141e+00,-2.73434669e+00/
data w1(16,6:10)/-4.95725575e-01,-1.57287992e+00,-5.95318989e+00,-1.22350399e+00,-1.34455190e+00/
data w1(16,11:15)/-1.01323087e+00,-2.30994688e+00,-5.60030073e-01,-1.21027924e+00,-1.13725225e+00/
data w1(16,16:20)/9.87639415e-01,-4.07003360e-01,2.52898207e+00,-5.61402268e-01,-5.73470676e-01/

data w1(17,1:5)/-1.22207633e+00,-1.27234014e+00,-1.18102819e+00,-5.14990090e-01,-1.70931726e+00/
data w1(17,6:10)/1.63230691e-01,-1.60616829e+00,-1.85710962e+00,-1.29101445e+00,-1.19132429e+00/
data w1(17,11:15)/-8.95243033e-01,-1.13889169e+00,-1.12334375e+00,-1.06360407e+00,-1.25246985e+00/
data w1(17,16:20)/-2.11770221e+00,-1.09498878e-01,1.58201243e+00,-4.52902572e-01,-2.33735094e-02/

data w1(18,1:5)/-8.60991459e-01,-7.26057580e-02,-3.89726661e-01,-1.55217336e+00,-2.18233341e+00/
data w1(18,6:10)/-3.00970346e-01,2.30030702e+00,1.18304478e+01,-9.35148156e-01,-6.78861546e-01/
data w1(18,11:15)/-7.21346276e-01,1.49289791e+00,7.88586677e-01,-8.93617154e-01,3.45405099e-01/
data w1(18,16:20)/-6.94409456e-01,-1.71362829e+00,-2.46318806e+00,-9.10744347e-01,-7.97694581e-01/

data w1(19,1:5)/-8.48645989e-01,-4.80415209e-01,-2.00377262e-01,-5.04699837e-02,-1.57440455e+00/
data w1(19,6:10)/-1.80806750e+00,6.33963047e-01,-4.87399916e-01,-4.94404945e-01,-4.08469349e-01/
data w1(19,11:15)/-1.09200673e+00,1.67204885e-01,1.47620177e-01,-1.03804800e+00,-1.57665180e+00/
data w1(19,16:20)/7.51619563e-01,-1.67365833e+00,-7.79865208e-01,-1.01910909e+00,-2.37742734e+00/

data w1(20,1:5)/-9.32874617e-01,-7.30137469e-01,-8.26555389e-01,-8.30304134e-01,-2.58705031e-01/
data w1(20,6:10)/-2.28208351e-01,-1.04175219e+00,-1.92262848e+00,-7.38829881e-01,-9.23451534e-01/
data w1(20,11:15)/-1.00406966e+00,-2.88616734e-01,-3.79784154e-01,-1.17993534e+00,7.15342086e-01/
data w1(20,16:20)/-1.73273096e+00,-1.50492156e+00,2.57733703e+00,-5.41884834e-01,-1.16438942e-01/


data b1(1)/-8.70832610e-01/
data b1(2)/-6.87118584e-01/
data b1(3)/-6.60090167e-01/
data b1(4)/-7.69366439e-01/
data b1(5)/-1.47034772e+00/
data b1(6)/-3.86257878e-01/
data b1(7)/1.34013769e-01/
data b1(8)/3.26884778e+00/
data b1(9)/-7.87364831e-01/
data b1(10)/-9.08669347e-01/
data b1(11)/-9.51585885e-01/
data b1(12)/-4.57661637e-01/
data b1(13)/-1.46403771e-01/
data b1(14)/-8.68069436e-01/
data b1(15)/-4.46478380e-02/
data b1(16)/6.52029249e-01/
data b1(17)/-8.78274642e-01/
data b1(18)/-3.15801212e-01/
data b1(19)/-4.24378007e-01/
data b1(20)/-3.39812826e-01/

data w2(1,1:1)/-2.54784992e-02/
data w2(2,1:1)/-1.47812041e-01/
data w2(3,1:1)/-7.64781491e-02/
data w2(4,1:1)/-9.40634179e-03/
data w2(5,1:1)/-2.77208550e-01/
data w2(6,1:1)/7.22719634e-01/
data w2(7,1:1)/1.89287890e+00/
data w2(8,1:1)/1.10714473e+01/
data w2(9,1:1)/1.61236165e-02/
data w2(10,1:1)/-7.54489900e-02/
data w2(11,1:1)/-9.73779424e-03/
data w2(12,1:1)/1.68532340e+00/
data w2(13,1:1)/1.01235614e+00/
data w2(14,1:1)/-1.80068850e-02/
data w2(15,1:1)/-1.00105041e+00/
data w2(16,1:1)/-4.76700000e+00/
data w2(17,1:1)/-4.29008117e+00/
data w2(18,1:1)/-3.47348758e-01/
data w2(19,1:1)/1.26519331e-01/
data w2(20,1:1)/3.30462990e+00/

data b2(1)/4.72101426e+00/

contains

subroutine NN_VH3(r1,r2,r3,pot, der)
implicit none
real(8), intent(in) :: r1, r2, r3 
real(8), dimension(3), intent(out) :: der
real(8), intent(out) :: pot 
real(8), dimension(n1) :: input, tmp
integer :: i,j

! Derivatives:
real(8), dimension(n1,3) :: input_der
real(8), dimension(n1) :: d_ener

der = 0e0
tmp = (/r1,r2,r3/)
call generate_input(tmp, input, input_der)

!Evaluate NN
call NN(n1,n2,n3,n4, input, pot, d_ener)

do i=1,3
   do j=1,n1
      der(i) = der(i) + d_ener(j) * input_der(j,i)
   enddo
enddo

! Rescale energy
pot = 5e-1 * (pot + 1e0) * (ylinear(1) - ylinear(2)) + ylinear(2)
der = der * 5e-1 * (ylinear(1) - ylinear(2))

endsubroutine


subroutine NN(n1,n2,n3,n4, input, ener, d_ener)
implicit none
integer, intent(in) :: n1, n2, n3, n4
real(8), dimension(n1), intent(in) :: input
real(8), intent(out) :: ener
real(8), dimension(n1), intent(out) :: d_ener
real(8), dimension(n2) :: h1, aux1 
real(8), dimension(n3) :: h2, aux2
real(8), dimension(n4) :: aener
real(8) :: derl1(n1,n2), derl2(n2,n3), derl3(n3,n4)

call step(n1, n2, input, h1, w, b, derl1,.TRUE.)
call step(n2, n3, h1, h2, w1, b1, derl2,.TRUE.)
call step(n3, n4, h2, aener, w2, b2,derl3,.FALSE.)
call total_der_NN(derl1, derl2, derl3, d_ener)
ener = aener(1)
endsubroutine

subroutine total_der_NN(derl1, derl2, derl3, d_ener)
implicit none
real(8), dimension(n1,n2), intent(in) :: derl1 
real(8), dimension(n2,n3), intent(in) :: derl2
real(8), dimension(n3,n4), intent(in) :: derl3
real(8), dimension(n1), intent(out) :: d_ener

real(8), dimension(n2) :: aux1
integer :: i,j,k

aux1 = 0d0
d_ener = 0d0

do k=1,n3
   do j=1,n2
      aux1(j) = aux1(j) + derl2(j,k) * derl3(k,1)
   enddo
enddo

do k=1,n2
   do j=1,n1
      d_ener(j) = d_ener(j) + derl1(j,k) * aux1(k)
   enddo
enddo
endsubroutine

subroutine generate_input(d, input, input_der)
implicit none
real(8), dimension(n1), intent(in) :: d 
real(8), dimension(n1), intent(out) :: input
real(8), dimension(n1,3), intent(out) :: input_der
real(8), dimension(3) :: d_exp
real(8), parameter :: alpha =7e-1

!Derivatives on distances or input.
real(8), dimension(3) :: der_d_exp, der_d_sym_rc
real(8), dimension(n1) :: der_lin
real(8), dimension(3,3) :: fi_der

call exponential(3,alpha, d, d_exp, der_d_exp)
call fi_a3(d_exp, input,fi_der) 
call StandardScale(n1, input, xstandard(:,1), xstandard(:,2), der_lin)
call total_derivative(der_d_exp, fi_der, der_lin, input_der)
endsubroutine

subroutine total_derivative(d_exp, fi_der, der_lin, input_der)
implicit none
real(8), dimension(n1), intent(in) :: d_exp
real(8), dimension(n1), intent(in) :: der_lin
real(8), dimension(n1,n1), intent(in) :: fi_der
real(8), dimension(n1,n1), intent(out) :: input_der

integer :: i,j,k
real(8) :: aux2(n1,n1), aux3(n1,3)

aux2 = 0d0
do j=1,n1
   do i=1,n1
      input_der(i,j) = der_lin(i) * fi_der(i,j) * d_exp(j)
   enddo
enddo
endsubroutine

subroutine fi_a3(r,p,der)
! compute the fundamental invariants
! atom order : A A A
! r (input) real(kind=8) the internuclear distances
! p (output) real(kind=8) the fundamental invariants
implicit none
real(kind=8),intent(in) :: r(3)
real(kind=8),intent(out) :: p(3)
real(8), dimension(3,3), intent(out) :: der
p(1)=r(1)+r(2)+r(3) 
p(2)=r(1)**2+r(2)**2+r(3)**2 
p(3)=r(1)**3+r(2)**3+r(3)**3 

der(1,1) = 1e0
der(1,2) = 1e0
der(1,3) = 1e0

der(2,1) = 2e0 * r(1)
der(2,2) = 2e0 * r(2)
der(2,3) = 2e0 * r(3)

der(3,1) = 3e0 * r(1)**2
der(3,2) = 3e0 * r(2)**2
der(3,3) = 3e0 * r(3)**2
end subroutine fi_a3

subroutine exponential(n,alpha,d,d_exp,der_d_exp)
implicit none
integer, intent(in) :: n
real(8), intent(in) :: alpha
real(8), dimension(n), intent(in) :: d
real(8), dimension(n), intent(out) :: d_exp, der_d_exp

d_exp = exp(-alpha * d)
der_d_exp = -alpha * d_exp
end subroutine

subroutine StandardScale(n, dat, mean, std, der)
! Standarize the data removing the mean of the data and dividing by the standard deviation.
! This is used in training to set mean of data in 0 with std=1.
implicit none
integer, intent(in) :: n
real(8), dimension(n), intent(in) :: mean, std
real(8), dimension(n), intent(inout) :: dat
real(8), dimension(n), intent(out) :: der

der = 0e0
dat = (dat - mean) / std
der = 1e0 / std
end subroutine

endmodule
