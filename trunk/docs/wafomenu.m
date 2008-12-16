function wafomenu(kind)
% WAFOMENU displays a user interface to the documentation files of WAFO
%
% CALL:  wafomenu(kind)
%
%    kind = 0, displays a point and click menu (default)
%           1, displays a text driven menu
%

% See also  docs

%history
% revised pab 21.01.2000
% - added kind
% - changed h1 line and ordering of menu
% - added aboutwafo
% By pab 17.12.1999

if nargin<1|isempty(kind)
  kind=0;
end

header = 'WAFO Documentation files';
labels =str2mat(...
    ' 1)  Installation description of WAFO Toolbox', ...
    ' 2)  About WAFO',...
    ' 3)  What is new',...
    ' 4)  Ideas for getting started with WAFO',...
    ' 5)  How To Add New Features to WAFO',...
    ' 6)  WAFO known limitations',...
    ' 7)  Bug Report Form for WAFO',...
    ' 8)  Spectrum, covariance function and density (pdf) structures',... 
    ' 9)  Level v crossing definitions and nomenclature',...
    '10)  Turning points definitions and numenclature',...
    '11)  Wave definitions and nomenclature',...
    '12)  Wave heights and amplitude definitions and nomenclature',...
    '13)  Wave periods (lengths) definitions and nomenclature' ) ;
filenames = str2mat(...
    'install', ...
      'aboutwafo', ...
      fullfile(waforoot,'Readme'),...
      'getstart',....
      'addfeatr',....
      'limitations',....
      'bugreport',....
      'datastructures',....
      'crossdef',....
      'tpdef',....
      'wavedef',...
      'ampdef',....
      'perioddef');

Noptions=size(filenames,1);
if kind==1, % text driven menu
  r=1;
  while ~isempty(r) & ~strcmpi(r,'q')
    clc
    disp(header)
    disp('  ')
    disp(labels)
    disp('  ')
    r=input(['Enter your choice 1,2,...,' num2str(Noptions-1),' or ' ...
	  num2str(Noptions) '.  ']);
    if ~isempty(r)
      clc
      r=round(r);
      if ((1<=r) & (r<=Noptions))
	more on,
	help(filenames(r,:))
	more off,
	pause
      end  
    end % if r
  end % while
  
else % point and click menu
  callbacks = [ repmat('helpwin ',Noptions,1) filenames]; 
  choices('DOCS',header,labels,callbacks);
end % kind

return

