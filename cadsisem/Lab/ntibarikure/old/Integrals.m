function [I] = Integrals( kx1, ky1, kx2, ky2, step )
% Computes the mode integrals
% 
%  [IN]
%   kx1 = eigenvalue k along x in 1st waveguide
%   ky1 = eigenvalue k along y in 1st waveguide
%   kx2 = eigenvalue k along x in 2nd waveguide
%   ky2 = eigenvalue k along y in 2nd waveguide
%
%   step = step struct

a1 = step{1}.a;
b1 = step{1}.b;

a2 = step{2}.a;
b2 = step{2}.b;

c = abs((step{1}.xo - step{1}.a/2) - (step{2}.xo - step{2}.a/2));
d = abs((step{1}.yo - step{1}.b/2) - (step{2}.yo - step{2}.b/2));

if (abs(( ky1 - ky2 ) * 0.5 * b1) > eps)
    I(1) = 0.5*b1 * ...
        ( sin ( ( ky1 - ky2 ) * 0.5 * b1 ) ) / ( ( ky1 - ky2 ) * 0.5 * b1 ) * ...
        cos ( ( ky1 - ky2 ) * 0.5 * b1 - ky2*d );
else
    I(1) = 0.5*b1 * cos ( ( ky1 - ky2 ) * 0.5 * b1 - ky2*d );
end

if (abs(( ky1 + ky2 ) * 0.5 * b1) > eps)
    I(2) = 0.5*b1 * ...
        ( sin ( ( ky1 + ky2 ) * 0.5 * b1 ) ) / ( ( ky1 + ky2 ) * 0.5 * b1 ) * ...
        cos ( ( ky1 + ky2 ) * 0.5 * b1 + ky2*d );
else
    I(2) = 0.5*b1 * cos ( ( ky1 + ky2 ) * 0.5 * b1 + ky2*d );
end

if (abs(( kx1 - kx2 ) * 0.5 * a1) > eps)
    I(3) = 0.5*a1 * ...
        ( sin ( ( kx1 - kx2 ) * 0.5 * a1 ) ) / ( ( kx1 - kx2 ) * 0.5 * a1 ) * ...
        cos ( ( kx1 - kx2 ) * 0.5 * a1 - kx2*c );
else
    I(3) = 0.5*step{1}.a * cos ( ( kx1 - kx2 ) * 0.5 * step{1}.a - kx2*c );
end

if (abs(( kx1 + kx2 ) * 0.5 * a1) > eps)
    I(4) = 0.5*a1 * ...
        ( sin ( ( kx1 + kx2 ) * 0.5 * a1 ) ) / ( ( kx1 + kx2 ) * 0.5 * a1 ) * ...
        cos ( ( kx1 + kx2 ) * 0.5 * a1 + kx2*c );
else
    I(4) = 0.5*a1 * cos ( ( kx1 + kx2 ) * 0.5 * a1 + kx2*c );
end
    
