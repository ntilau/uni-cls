function SingleS = ExtractSingleS(Stot, Sinfo, outPort, inPort,...
    outType, outM, outN, inType, inM, inN)
% example :
% S11_h10 = ExtractSingleS(Sf{nf},Sinfo,1,1,'h',1,0,'h',1,0);

SeleDim = [ (length(Sinfo{outPort}.mh)+length(Sinfo{outPort}.me)), ...
    (length(Sinfo{inPort}.nh)+length(Sinfo{inPort}.ne)) ];

S = ExtractPortS(Stot, SeleDim, outPort, inPort);
i = 1;
j = 1;
% input port related index
if(inType == 'h')
    while(Sinfo{inPort}.nh(i)~=inN | Sinfo{outPort}.mh(i)~=inM)
        i=i+1;
    end
elseif(inType == 'e')
    while(Sinfo{inPort}.ne(i)~=inN | Sinfo{outPort}.me(i)~=inM)
        i=i+1;
    end
    i=i+length(Sinfo{inPort}.nh);
else 
    Error.fatal = 'Sintax error in ExtracSingleS';
    if (DumpError('|  +--+>',Error))
        return;
    end
end
% output port related index
if(outType == 'h')
    while(Sinfo{inPort}.nh(j)~=outN | Sinfo{outPort}.mh(j)~=outM)
        j=j+1;
    end
elseif(outType == 'e')
    while(Sinfo{inPort}.ne(j)~=outN | Sinfo{outPort}.me(j)~=outM)
        j=j+1;
    end
    j=j+length(Sinfo{inPort}.nh);
else 
    Error.fatal = 'Sintax error in ExtracSingleS';
    if (DumpError('|  +--+>',Error))
        return;
    end
end

SingleS = S(j,i);

