 

function [w hist]=plog(hist, X,do,title, varargin)

% function [w hist]=plog(hist, X,do,title, varargin)
% hist..cellarray to store data , otherwise set hist={}
% X ... data cellarry ,numeric or char -->see do
% do: 
%    [-1] attach only : valid classes of X: numeric| char| numeric-/char-ord mixed-cellARRAY
%    [ 0] format      : valid classes of X: numeric| char| numeric-/char-ord mixed-cellARRAY
%    [ 1] format2     : X must be defined as cellaray with 3 inputs {rows, labels, data}, 
%     were length of rows and labels must match size of X; and data must be
%     numeric or  numeric-/char-ord mixed-cellARRAY
% title... title or set []
% addit. options
% cr..set carriageReturn   'cr=1]-->default CR is printed'
% s.. addit. spacer between columns  's=5]'
% d..decimal values;  'd=2]'
% see examples in plog
if 0
    hist={}
    
    [w hist]=plog(hist, 'Holla') %add string
    [w hist]=plog(hist, 'Nummer2') %add string
    
    %%[1] MIXED CELLARRAY 
    codeX={50.34 'schoko' 1.4534;
            70.77 'tomate' 21.34     }
    [s hist]=plog(hist,codeX,-1,'condition')%ATTACH cells only
    [s hist]=plog(hist,codeX, 0,'myTITLE') %FORMAT and attach cell 
    
    %%[1] MIXED CELLARRAY  & addit. OPTIONS
    %[cr=0] no cariageReturn; [s=3]3 spaces; [d=1]4 decimals 
    [s hist]=plog(hist,codeX, 0,'myTITLE','cr=0','s=3','d=4') ;  %FORMAT and attach cell 
    
     %% STRINGCELL 
    codeX={'ss' 'ssa';'heute' 'morgen'}
     [s hist]=plog(hist,codeX, 0,[],'cr=1') %%FORMAT and attach cell 
     
     %% CHAR
       codeX='guten Tage'
       [s hist]=plog(hist,codeX, 0,'condition')   
    
       [s hist]=plog(hist,codeX, -1,'condition','cr=0') %attach  only
       [s hist]=plog(hist,codeX, 0,'condition','cr=1') %format and attach  
       [s hist]=plog(hist,codeX, 0, [],'cr=1') ;%same but no title
       
       %%[2a ] NUMERIC MATRIX    no cariageReturn[cr=0]; [s=0]no spaces; [d=2]2 decimals 
       [s hist]=plog(hist,rand(3,5), 0,'condition','cr=0','s=0','d=2')
       
       %%[3a ]NUMERIC MATRIX WITH CASES AND LABELS
       la={'heute' 'morgen' '�morgen'}
       cas={'er' 'ddf' 'dfe' 'wer'}
       codeX=rand(4,3)
        [s hist]=plog(hist,{cas la codeX  }, 1,'condition','cr=1','s=1','d=3')
        
        %%[3b ] MIXED MATRIX WITH CASES AND LABELS
         la={'heute' 'morgen' '�morgen' 'gender' 'whatsoever'}
       cas={'pb1' 'pb2' 'pb3' 'subjects99'}
       ax=num2cell(rand(4,3)) ; 
       bx=repmat({'male';'female'},[2 1]); 
       cx=cellstr(char(round((rand(4,5))*10)+60))
       codeX=[ax bx cx ]
      [s hist]=plog(hist,{cas la codeX  }, 1,'condition','cr=1','s=1','d=3')  
        
      %no cases-->set first Cellelement empty ''
      [s hist]=plog(hist,{'' la codeX  }, 1,'condition','cr=1','s=1','d=3')  
      
       %no labels-->set 2nd Cellelement empty ''
      [s hist]=plog(hist,{cas '' codeX  }, 1,'condition','cr=1','s=1','d=3') 
      
      %no cases no labels -->set 1st and 2nd Cellelement empty ''
      [s hist]=plog(hist,{'' '' codeX  }, 1,'condition','cr=1','s=1','d=3') 
      
      
end

for i=1:length(varargin)
    eval([varargin{i} ';']);
    
end




if  exist('hist')~=1 ;     hist={''}; end
if  exist('title')~=1 ;     title=''; end

if  exist('do')~=1 ;      do=0; end %'dec'

%  isempty(title)
%  title
if  isempty(title)==1 ;   
    title=''; else; 
%     title=['��� ' title ' ���'] ;
end

if  exist('d')~=1 ;    dec=3; else; dec=d; end %'dec'
if  exist('s')~=1 ;    spacer=4; else; spacer=s;end%'spacer'
if  exist('cr')~=1 ;   cariageReturn=1; else; cariageReturn=cr;end%'cariageReturn'

if ischar(X)
   cariageReturn=0;
end
if cariageReturn==1
%     hist{end+1,1} =sprintf('\n');
    hist{end+1,1} ='';
end


if do==-1
    w=X;
    w2={};
    if isnumeric(w)
      w= num2cell(w) ;
    end
    if iscell(w)

        for i=1:size(w,1)
            dum='';
            for j=1:size(w,2)
                if isnumeric(w{i,j})
                    w{i,j}= num2str(w{i,j});
                end
                dum=[dum '  '  w{i,j} ];

                w2(i,1)={dum};
            end
        end
    elseif ischar(w)
        w2={w};
    end
    if ~isempty(title)
        w2=[{title};w2]
    end
    
%     if cariageReturn==1
% %         hist{end+1,1} =sprintf('\n');
%             hist{end+1,1} ='';
%     end
    hist=[hist; w2 ];
    
    return
elseif do==0
    labs='';
    down='';
    islabs=0;
else
    if iscell(X)
        if size(X,2)==3
            down= X{1};down=down(:);
            labs= X{2};labs=labs(:)';
            X= X{3};
            if ~iscell(X)
                X=num2cell(X);
            end
            if isempty(down); down=repmat({' '},[size(X,1)             1] ),end
            if isempty(labs); labs=repmat({' '},[1            size(X,2) ] ), islabs=0;else; islabs=1; end
        else
            w=X;
%             if cariageReturn==1
% %                 hist{end+1,1} =sprintf('\n');
%                     hist{end+1,1} ='';
%             end
            hist=[hist; w ];
            return

        end
    end
end


[N,M]=size(X);
try
    ff = ceil(log10(max(max(abs(X)))))+dec+3;
catch
    dum=X(:); dum=cell2mat(dum(cellfun(@isnumeric,dum)));
    ff=ceil(log10(max(max(dum))))+dec+3;
    %     ff=6;
    %     X=char(X);
    % end
end

if ischar(X)
    ff=0;
    X={X};
    plotlines=0;
else
    plotlines=1;
end



if ~iscell(X)
    e=[' ' labs(:)'];
    try
    e=[e; down num2cell(X)];
    catch
     e=   num2cell(X);
    end
else
    e=X;
end

if do==1
    if  iscell(X)==1
        try
            e=[' ' labs(:)'];
            e=[e; down X ];
        end
    elseif isnumeric(X)
        try
            e=[' ' labs(:)'];
            e=[e; down num2cell(X)];
        end
    end
end

[N,M]=size(e);

for i=1:N %CODE DECIMALS AND DISTANCES
    d1='';
    for j=1:M
        if ischar(e{i,j})
            e{i,j} =[   sprintf(['%#',num2str(ff-dec-1), 's '],e{i,j}) ];
        else
            if round(e{i,j})==e{i,j}
                e{i,j} =[   sprintf(['%#',num2str(ff-dec-1), 'd '],e{i,j}) ];
            else
                e{i,j} =[   sprintf(['%#',num2str(ff),'.',num2str(dec),'f '],e{i,j}) ];
                if dec==0
                   e{i,j}= regexprep(e{i,j},'\.','') ;
                end
            end
        end
    end
end


for i=1:M;%add spacer and middleOrientation
    si=size(char(e(:,i)),2)+spacer;
    for j=1:N
        if length(e{j,i})~=si
            sic=(si-length(e{j,i}))/2 ;

            e{j,i}= [repmat(' ',[1  floor(sic)])    e{j,i}   repmat(' ',[1  ceil(sic)])  ];
        end
    end
end

s={};
for i=1:N
    d1='';
    for j=1:M
        d1=[d1 e{i,j}];
    end
    s{end+1,1} = d1;
end

rep1={repmat( '�'  ,[1 size(s{1,:},2)])};
rep2=rep1;
% rep2={repmat( '_'  ,[1 size(s{1,:},2)])};
rep3={regexprep(s{1,:},'\S','�')};

sizt=(size(s{1,:},2)-length(title))/2;
title2={    [repmat(' ',[1  floor(sizt)])    upper(title)  repmat(' ',[1  ceil(sizt)])  ] ;  };

% if ~isempty(title2)
%     title2={[' ## ' title2{1}]};
% end

if isempty(title); title2='' ;end

if do==0
    if plotlines==1
    w=[rep2; title2 ;  rep1 ;  ;s ;rep2];
    else
      w=[ s ];
    end
else

    if islabs==1
        w=[rep2; title2 ; s(1,:);rep2 ;  ;s(2:end,:) ;rep1];
    else
        w=[rep2; title2 ;rep2 ;  ;s(2:end,:) ;rep1];
    end
    % char(w)
    % pwrite2file('mist4.txt',w)

end


hist=[hist; w ];

% fprintf('\n');
% for i=1:N,
%     fprintf(['%#',num2str(ff),'.',num2str(dec),'f\t'],X(i,:));
%     fprintf('\n');
% end
