program LanguageTests;

{$I dws.inc}
{$IFDEF WINDOWS}
  {$SetPEFlags $0001}
{$ENDIF}

{$IFNDEF FPC}
{$IFNDEF VER200}
{.$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$ENDIF}
{$ENDIF}

uses
{$IFDEF FPC}
  {$IFDEF WINDOWS} Windows, {$ELSE} cthreads, cmem, {$ENDIF}
  LCLIntf, LCLType, LMessages, Interfaces,
{$ELSE}
  TestFrameWork, Windows,
{$ENDIF}
  Classes,
  Forms,
  GUITestRunner,
  SysUtils,
  dwsXPlatform,
  dwsMathComplexFunctions in '..\Source\dwsMathComplexFunctions.pas',
  dwsMath3DFunctions in '..\Source\dwsMath3DFunctions.pas',
  dwsDebugFunctions in '..\Source\dwsDebugFunctions.pas',
  dwsLinq,
  dwsLinqSql in '..\Libraries\LinqLib\dwsLinqSql.pas',
  dwsLinqJson in '..\Libraries\LinqLib\dwsLinqJson.pas',
  dwsDocBuilder in '..\Libraries\DocBuilder\dwsDocBuilder.pas',
  UScriptTests in 'UScriptTests.pas',
  UAlgorithmsTests in 'UAlgorithmsTests.pas',
  UdwsUnitTests in 'UdwsUnitTests.pas',
  UdwsUnitTestsStatic in 'UdwsUnitTestsStatic.pas',
  UHTMLFilterTests in 'UHTMLFilterTests.pas',
  UCornerCasesTests in 'UCornerCasesTests.pas',
  UdwsClassesTests in 'UdwsClassesTests.pas',
  dwsClasses in '..\Libraries\ClassesLib\dwsClasses.pas',
  UdwsFunctionsTests in 'UdwsFunctionsTests.pas',
  UTestDispatcher in 'UTestDispatcher.pas',
  UDebuggerTests in 'UDebuggerTests.pas',
  UdwsUtilsTests in 'UdwsUtilsTests.pas',
  UMemoryTests in 'UMemoryTests.pas',
  UBuildTests in 'UBuildTests.pas',
  USourceUtilsTests in 'USourceUtilsTests.pas',
  ULocalizerTests in 'ULocalizerTests.pas',
  dwsRTTIFunctions,
  UJSONTests in 'UJSONTests.pas',
  UJSONConnectorTests in 'UJSONConnectorTests.pas',
  UTokenizerTests in 'UTokenizerTests.pas',
  ULanguageExtensionTests in 'ULanguageExtensionTests.pas',
  UJITTests in 'UJITTests.pas',
{$IFDEF CPU32}
  {$IFDEF WINDOWS}
  UJITx86Tests in 'UJITx86Tests.pas',
  {$ENDIF}
{$ENDIF}
{$IFNDEF FPC}
  ULinqTests in 'ULinqTests.pas',
  UCOMConnectorTests in 'UCOMConnectorTests.pas',
  UdwsDataBaseTests in 'UdwsDataBaseTests.pas',
  UdwsCryptoTests in 'UdwsCryptoTests.pas',
{$ENDIF}
  dwsSymbolsLibModule in '..\Libraries\SymbolsLib\dwsSymbolsLibModule.pas',
  dwsExternalFunctions,
  dwsExternalFunctionJit,
  dwsExternalFunctionJitx86,
  UExternalFunctionTests in 'UExternalFunctionTests.pas',
  UdwsEncodingTests in 'UdwsEncodingTests.pas';  
  
{$IFDEF FPC} 
  begin
    Application.CreateForm(TGUITestRunner, TestRunner);
  end;
{$ENDIF}

  procedure PrepareApp;
  {$IFNDEF FPC}
  var
     procAffinity, systAffinity : {$IF RTLVersion >= 23} NativeUInt;{$ELSE}DWORD;{$IFEND}
  begin
     GetProcessAffinityMask(GetCurrentProcess, procAffinity, systAffinity);
     SetProcessAffinityMask(GetCurrentProcess, systAffinity);
     ReportMemoryLeaksOnShutdown:=True;
  end;
  {$ELSE}
  begin
  end;
  {$ENDIF}

begin
   DirectSet8087CW($133F);
   PrepareApp;
   SetDecimalSeparator('.');
   Application.Initialize;
   RunRegisteredTests;
   Application.Run;
end.