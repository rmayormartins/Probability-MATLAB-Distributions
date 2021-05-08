function [pdf_out, x_out] = mpdf1(in,bin,titulo,tipo,cor)

% PDF ......... computes and plots the sample probability density function.
%
%mpdf1(in,bin,titulo,tipo,cor)

global START_OK;
global BELL;
global WARNING;

%------------------------------------------------------------------------
%	Define parameters
%------------------------------------------------------------------------
nx_default = 100;
axis_default = 1;

%------------------------------------------------------------------------
%	Prepare absicca vector and other parameters
%------------------------------------------------------------------------
  
if (nargin == 1)
    nx    = nx_default;
    max_x = nx_default;
    titulo = '';
    tipo = '-';
    cor = 'k';
else
    if (nargin == 2)
        nx    = bin;
        max_x = nx_default;
        titulo = '';
        tipo = '-';
        cor = 'k'; 
    else if (nargin == 3)
             nx    = bin;
             max_x = nx_default;
             cor = 'k'; 
             tipo = '-';
        else if (nargin == 4)
                 nx    = bin;
                 max_x = nx_default;
                 cor = 'k'; 
            else
                 nx    = bin;
                 max_x = nx_default;
            end
        end
    end
end
    
cortipo = strcat(cor,tipo);

max_y = length(in);
[out,x] = hist(in,nx);
nx_aug  = [x,x(length(x))+(x(length(x))-x(length(x)-1))];

if ( length(out(out~=0)) <= 10 )	% Discrete distribution
    out  = out/max_y ;
    flag = 'discrete';
else					% Continuous distribution
    out  = (out ./ diff(nx_aug))/max_y ;
    flag = 'continuous';
end
%------------------------------------------------------------------------
%	Output routines
%------------------------------------------------------------------------
if (nargout == 0)
    %axis_default = (max(x) - min(x))/2;
    %xmin = min(x)-axis_default; xmax = max(x) + axis_default;
    if  strcmp(flag, 'discrete')
	   delta = max(diff(x));
	   nbin  = length(x);
	   xa = [ (x(1)-delta/2), (x+delta/2) ];
	   oa = [ out(1), 0, out(2:nbin) ];
	   stairs(xa,oa), ...
	   grid on,       ...
       if( strcmp(axis('state'),'auto') ),  ...
	     axis auto  %axis([xmin xmax 0 1.5*max(out)]);
       end; ...
	   title(titulo)
    elseif  strcmp(flag, 'continuous')
	   plot(x,out,cortipo),   ...
	   grid on,       ...
       if( strcmp(axis('state'),'auto') ),  ...
	       axis auto %axis([xmin xmax 0 1.5*max(out)]); 
       end; ...
	   title(titulo)
    end
elseif (nargout == 1)
    pdf_out = out;
else
    pdf_out = out;
    x_out   = x;
end

