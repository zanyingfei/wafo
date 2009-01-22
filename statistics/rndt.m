function R = rndt(varargin)
%RNDT  Random matrices from a Student's T distribution
%
% CALL:  R = rndt(dfn,sz)
%
%        R = matrix of random numbers
%       df = degrees of freedom
%       sz = size(R)    (Default size(df))
%            sz can be a comma separated list or a vector 
%            giving the size of R (see zeros for options)
%
% The random numbers are generated by the inverse method. 
%
% Examples:
%   R  = rndt(1,1,100);
%   R2 = rndt(1:10);
%   R3 = rndt(4,[2 2 3])
%  
% See also  pdft,  cdft, invt, fitt, momt


% Tested on: Matlab 5.3
% History: 
% revised pab 23.10.2000
%  - added comnsize + nargchk
%  - added greater flexibility on the sizing of R
%       Anders Holtsberg, 18-11-93
%       Copyright (c) Anders Holtsberg

error(nargchk(1,inf,nargin))

Np = 1;
options = struct; % default options
[params,options,rndsize] = parsestatsinput(Np,options,varargin{:});
if numel(options)>1
  error('Multidimensional struct of distribution parameter not allowed!')
end

df = params{1};


if isempty(rndsize)
 csize = size(df);
else
  csize = comnsize(df,zeros(rndsize{:}));
  if any(isnan(csize))
    error('df must be a scalar or of corresponding size as given by m and n.');
  end
end
R = invt(rand(csize),df);


