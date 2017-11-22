var a : array of string;

PrintLn(Length(StrJoin(a, '')));
PrintLn(Length(StrJoin(a, ',')));

a.Add('hello');

PrintLn(StrJoin(a, ''));
PrintLn(StrJoin(a, ','));

a.Add('world');

PrintLn(StrJoin(a, ''));
PrintLn(StrJoin(a, ','));
PrintLn('{'+StrJoin(a, '},{')+'}');

var i : Integer;
for i:=1 to 20 do
   a.Add(IntToStr(i));
   
PrintLn(StrJoin(a, ''));
PrintLn(StrJoin(a, ','));
PrintLn('{'+StrJoin(a, '},{')+'}');
