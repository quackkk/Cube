unit Phys_analyze;

interface
uses Analyze;

const
    HUp=1;
    HDown=1;
    HHor=1;
    HGrab=1;
    HDrop=1;
function Calc_Len_Road(const arr_sost:tm;const arr_move:tm;const n_p_h:byte):byte;
function Move(const arr_sost:tm;const arr_move:tm):tm;
//function Rgen(n: ShortInt): tm;

implementation

function Is_Road_Clear(const arr_sost:tm; start, fin: byte): Boolean;
var i: byte;
begin
    //swap if start coord > end coord

    if start > fin then
    begin
        Inc(fin, start);
        start:= fin - start;
        Dec(fin,start);
    end;

    //main func

    result:= True;
    for i:= start  to fin - 2 do
        if arr_sost[i,1] <> 0 then
            result:= False;
end;

function Calc_Len_Road(const arr_sost:tm;const arr_move:tm;const n_p_h:byte):byte;
var lvl, position: array[1..3] of Byte;        // 1- start, 2- end, 3- hand
    n: Integer;
    i: Integer;

begin
    n:= Length(arr_sost)-1;

//transforming to more usable for me coordinates

    for i:= 1 to 2 do
        if arr_move[0,i] <= n then
        begin
            lvl[i]:= 1;
            position[i]:= arr_move[0,i];
        end
        else
        begin
            lvl[i]:= 2;
            position[i]:= arr_move[0,i]-n;
        end;
    if n_p_h <= n then
    begin
        lvl[3]:= 1;
        position[3]:= n_p_h;
    end
    else
    begin
        lvl[3]:= 2;
        position[3]:= n_p_h-n;
    end;

//calcuating full road length
    // hand to start position + grab + lvl change
    Inc(Result, Abs(position[3] - position[1]) * HHor + HGrab);
    if lvl[1] < lvl[3] then
        Inc(Result, HDown);
    if lvl[1] > lvl[3] then
        Inc(Result, HUp);

    // start position to end position + drop + lvl change
    inc(Result, Abs(position[1] - position[2]) * HHor + HDrop);
    if lvl[1] < lvl[2] then
        Inc(Result, HUp);
    if lvl[1] > lvl[2] then
        Inc(Result, HDown);
    if (lvl[1] + lvl[2] = 2) and not Is_Road_Clear(arr_sost, position[1], position[2]) then
        Inc(Result, HUp + HDown);
end;

function Move( const arr_sost:tm; const arr_move:tm):tm;
var n, buf: Integer;
    i, j: Integer;
    lvl, position: array[1..2] of Byte;
    b: boolean;
begin
    n:= Length(arr_sost);
    SetLength(Result, n);

//transforming to more usable for me coordinates
    for i:= 1 to 2 do
        if arr_move[0,i] <= n-1 then
        begin
            lvl[i]:= 1;
            position[i]:= arr_move[0,i] - 1;
        end
        else
        begin
            lvl[i]:= 2;
            position[i]:= arr_move[0,i] - n;
        end;
//rewriting arr_sost in result
    for i:= 0 to n-1 do
        for j:= 1 to 2 do
            Result[i,j]:= arr_sost[i,j];
//main things
    Result[position[2], lvl[2]]:= Result[position[1], lvl[1]];
    Result[position[1], lvl[1]]:= 0;
    b:= False;
    for i:= 0 to n-2 do
    begin
        if i <> Result[i,1] then
        begin
            b:= True;
            j:= i-1;
            Break;
        end;
    end;
    if not b then
        if i = n-1 then j:= i-1
                   else j:= i;
    Result[n-1, 1]:= j + 1;

     b:= False;
    for i:= n-2 downto 0 do
    begin
        if i <> Result[i,1] then
        begin
            b:= True;
            j:= i+1;
            Break;
        end;
    end;
    if not b then
        if i = n-1 then j:= i-1
                   else j:= i;
    j:= (n - 2) - j;
    Result[n-1, 2]:= j ;





end;

end.
