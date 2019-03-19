program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Analyze;

function AssertEqual(loc_i:Byte;Farr:tm;solve:tm):Boolean ;
var i, j :ShortInt;
    aft:tm;
    l1,l2,k:Byte;
begin
aft:=weight(loc_i,Farr);
l1:=Length(aft);
l2:=Length(solve);
k:=l1;
if l1 <> l2 then]
  begin
    writeln(False);
    Exit();
  end;
for i:=0 to l1 - 1 do
    for j:=0 to l2- 1 do
      if  solve[j,1] = aft[i,1] then
          if solve[j,2] <> aft[i,2] then
          begin
            writeln(False);
            Exit();
          end
          else
            begin
              solve[j,1]:=0;
              dec(k);
              break;
            end;
if k = 0 then
  writeln(True)
else writeln(False);
end;
begin


end.
 