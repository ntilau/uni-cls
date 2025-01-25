function [ FrequencySweep, Error ] = FrequencySweepValidate( FrequencySweep )
% Checks a FrequencySweep, eventually adding a uniform sweep
% Outputs error
% V 1.0 - 03 Oct. 2007
% V 2.0 - 21 Nov. 2008 - Ported to MultuiPortDevices
% ------------------------------------------------------------------------
% [IN]
%   FrequencySweep = FrequencySweep structure
%   
% [OUT]
%   FrequencySweep = FrequenctySweep, checked and possibly expanded
%   Error          = Error structure
%                      

% What is needed is the .f array...
Error = struct();

if (isfield(FrequencySweep,'f'))
    if (~isfloat(FrequencySweep.f))
        Error.fatal = '[ERROR 0120] FrequencySweep has an "f" field which is not an array';
        return
    else
        flag = 0;
        for i=1:length(FrequencySweep.f)
            if (FrequencySweep.f(i)<eps)
                flag = i;
            end
        end
        if (flag>0)
            Error.fatal = sprintf('[ERROR 0121] FrequencySweep "f" field %d entry <0',flag);
            return
        end
    end
    FrequencySweep.N = length(FrequencySweep.f);
else
    % If there is NOT a .f array we must build it... 
    if (isfield(FrequencySweep,'N'))
        N = FrequencySweep.N;
    else
        Error.fatal = '[ERROR 0122] FrequencySweep has no "N" field';
        return
    end

    if (isfield(FrequencySweep,'start'))
        fstart = FrequencySweep.start;
    else
        Error.fatal = '[ERROR 0123] FrequencySweep has no "start" field';
        return
    end

    if (isfield(FrequencySweep,'end'))
        fend = FrequencySweep.end;
    else
        Error.fatal = '[ERROR 0122] FrequencySweep has no "end" field';
        return
    end

    if(FrequencySweep.N>=2)
        for nf=1:N
            FrequencySweep.f(nf) = (fend - fstart)*(nf-1)/(N-1)+ fstart;
        end
        Error.warning{1} = '[INFO 0820] Built equispaced frequency sweep';
    else
        FrequencySweep.f(1)=FrequencySweep.start;
        Error.warning{1} = '[NFO 0821] Single frequency point';
    end
end


        
        
            