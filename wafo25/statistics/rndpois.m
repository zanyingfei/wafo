function R = rndpois(varargin)
%RNDPOIS Random matrices from a Poisson distribution
% 
% CALL:  R = rndpois(L,sz)
%        R = rndpois(phat,sz) 
%     
%        R = matrix of random numbers
%        L = mean of the Poissin distribution, L>0
%    phat = Distribution parameter struct
%             as returned from FITPOIS.  
%       sz = size(R)    (Default size(L))
%            sz can be a comma separated list or a vector 
%            giving the size of R (see zeros for options).
%
% The random numbers are generated by rejection sampling method. 
%
% Example:
%   R=rndpois(5,1,100);
%   phat=plotweib(R),shg    
%
% See also  pdfpois, cdfpois, invpois,  fitpois, mompois

%
%     This program is free software; you can redistribute it and/or modify
%     it under the terms of the GNU Lesser General Public License as published by
%     the Free Software Foundation; either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU Lesser General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.


% Reference:
% Joachim H. Ahrens, Ulrich Dieter (1982). "Computer Generation of Poisson
% Deviates". ACM Transactions on Mathematical Software 8 (2): 163--179.
%
% Wikipedia:
% URL: http://en.wikipedia.org/wiki/Poisson_distribution

% Tested on: Matlab 5.3
% History: 
% by pab 24.10.2007

error(nargchk(1,inf,nargin))
Np = 1;
options = struct; % default options
[params,options,rndsize] = parsestatsinput(Np,options,varargin{:});
if numel(options)>1
  error('Multidimensional struct of distribution parameter not allowed!')
end

L = params{1};

if isempty(rndsize),
  csize=size(L);
else
  [csize] = comnsize(L,zeros(rndsize{:}));
end 
if any(isnan(csize))
   error('L must be a scalar or comply to the size info given.');
end

L(L<=0) = nan;

if isscalar(L)
  R = zeros(csize);
  N = numel(R);
  R(:) = rndpoisScalarL(L,N);
else
  R = rndpoisVectorL(L);
end

function R = rndpoisVectorL(L)
R  = zeros(size(L));
k = find(L>1000);
if any(k)
  % For large values of L (>1000),
  % the normal distribution with mean = L and variance = L is
  % an excellent approximation to the Poisson distribution.
  R(k) = round( L(k) + sqrt(L(k))* randn(size(k)) );
end
limit1 = 15;
k1 = find(limit1<=L & L<=1000);
if any(k1)
  % Method of Ahrens and Dieter
  
  alpha = 7/8;
  Lk = L(k1);
  m = floor(alpha * Lk);
    
  % Generate m waiting times, all at once
  x = rndgam(m,1);
  k2= find(x <= Lk);
    
  if ~isempty(k2)
    % No overshoot: then the number of additional times
    % has a Poisson distribution with a smaller mean.
    R(k1(k2)) = m(k2) + rndpoisVectorL(Lk(k2)-x(k2));
  end
    
  k2= find(x > Lk);
  if ~isempty(k2)
    % Overshoot: then the times up to m-1 are uniformly
    % distributed on the interval to x, so the count of times less
    % than lambda has a binomial distribution.
    R(k1(k2)) = rndbin(m(k2)-1, Lk(k2)./x(k2));
  end
end
k2 = find(L<limit1);
if any(k2)
  Rk = zeros(size(k2));
  Lk = L(k2);
  t = -log(rand(size(k2)))./Lk;
  left = find(t<=1);
  while any(left)
    Rk(left) = Rk(left)+1;
    t(left) = t(left) - log(rand(size(left)))./Lk(left);
    left =  find((t <= 1));
  end
  R(k2) = Rk;
end

function R = rndpoisScalarL(L,N)
if L>1000
  % For sufficiently large values of lambda (lambda > 1000 say),
  % the normal distribution with mean lambda and variance lambda is
  % an excellent approximation to the Poisson distribution.
  R = round( L + sqrt(L)* randn(N,1) );
elseif L>=15
  % Method of Ahrens and Dieter
  R  = zeros(N,1);
  alpha = 7/8;
  
  m = floor(alpha * L);
    
  % Generate m waiting times, all at once
  x = rndgam(m,1,N,1);
  k2= find(x <= L);
    
  if ~isempty(k2)
    % If we did not overshoot, then the number of additional times
    % has a Poisson distribution with a smaller mean.
    R(k2) = m + rndpoisVectorL(L-x(k2));
  end
    
  k2= find(x > L);
  if ~isempty(k2)
    % If we did overshoot, then the times up to m-1 are uniformly
    % distributed on the interval to x, so the count of times less
    % than lambda has a binomial distribution.
    R(k2) = rndbin(m-1, L./x(k2));
  end
else
  R = zeros(N,1);
  t = -log(rand(N,1))./L;
  left = find(t<=1);
  while any(left)
    R(left) = R(left)+1;
    %N = sum(left);
    t(left) = t(left) - log(rand(size(left)))/L;
    left =  find(t <= 1);
  end
end