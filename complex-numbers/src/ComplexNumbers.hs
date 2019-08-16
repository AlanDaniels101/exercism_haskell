module ComplexNumbers
(Complex,
 conjugate,
 abs,
 exp,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs, exp)
import qualified Prelude as Pre (exp)

-- Data definition -------------------------------------------------------------
data Complex a = a :+: a deriving(Eq, Show)

complex :: (a, a) -> Complex a
complex (r, im) = r :+: im

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate (r :+: im) = r :+: (-im)

abs :: Floating a => Complex a -> a
abs (r :+: im) = (r**2 + im**2)**(0.5)

real :: Num a => Complex a -> a
real (r :+: _) = r

imaginary :: Num a => Complex a -> a
imaginary (_ :+: im) = im

exp :: Floating a => Complex a -> Complex a
exp (r :+: im) = ((Pre.exp r) * cos im) :+: ((Pre.exp r) * sin im)

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul (r1 :+: im1) (r2 :+: im2) = (r1 * r2 - im1 * im2) :+: (im1 * r2 + r1 * im2) 

add :: Num a => Complex a -> Complex a -> Complex a
add (r1 :+: im1) (r2 :+: im2) = (r1 + r2) :+: (im1 + im2)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (r1 :+: im1) (r2 :+: im2) = (r1 - r2) :+: (im1 - im2)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (r1 :+: im1) (r2 :+: im2) = ((r1 * r2 + im1 * im2) / (r2^^2 + im2^^2)) :+: ((im1 * r2 - r1 * im2) / (r2^^2 + im2^^2))
