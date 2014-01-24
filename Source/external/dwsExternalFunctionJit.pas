unit dwsExternalFunctionJit;

interface
uses
   SysUtils,
   dwsUtils, dwsSymbols;

type
   TFunctionCall = record
      call: nativeUInt;
      offset: integer;
   end;

   TFunctionCallList = TSimpleList<TFunctionCall>;
   TFunctionCallArray = array of TFunctionCall;


   IExternalFunctionJit = interface
      procedure BeginProcedure(paramCount: integer);
      procedure BeginFunction(retval: TTypeSymbol; paramCount: integer);
      procedure PassParam(param: TParamSymbol);
      procedure Call;
      procedure PostCall;
      function GetBytes: TBytes;
      function GetCalls: TFunctionCallArray;
   end;

implementation

end.