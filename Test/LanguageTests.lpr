program LanguageTests;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

{$SetPEFlags $0001}

uses
{$IFNDEF FPC}
  TestFrameWork, Windows,
{$ELSE}
  {$IFDEF WINDOWS} Windows, {$ELSE} cthreads, {$ENDIF} 
  LCLIntf, LCLType, LMessages, Interfaces,
{$ENDIF}
  Classes,
  Forms,
  GUITestRunner,
  SysUtils,
  dwsXPlatform,
  dwsMathComplexFunctions in '..\Source\dwsMathComplexFunctions.pas',
  dwsMath3DFunctions in '..\Source\dwsMath3DFunctions.pas',
  dwsDebugFunctions in '..\Source\dwsDebugFunctions.pas',
  UScriptTests in 'UScriptTests.pas',
  UAlgorithmsTests in 'UAlgorithmsTests.pas',
  UdwsUnitTests in 'UdwsUnitTests.pas',
  UdwsUnitTestsStatic in 'UdwsUnitTestsStatic.pas',
  UHTMLFilterTests in 'UHTMLFilterTests.pas',
  UCornerCasesTests in 'UCornerCasesTests.pas',
  UdwsClassesTests in 'UdwsClassesTests.pas',
  dwsClasses in '..\Libraries\ClassesLib\dwsClasses.pas',
//  UdwsDataBaseTests in 'UdwsDataBaseTests.pas',
  UdwsFunctionsTests in 'UdwsFunctionsTests.pas',
//  UCOMConnectorTests in 'UCOMConnectorTests.pas',
  UTestDispatcher in 'UTestDispatcher.pas',
  UDebuggerTests in 'UDebuggerTests.pas',
  UdwsUtilsTests in 'UdwsUtilsTests.pas',
  UMemoryTests in 'UMemoryTests.pas',
  UBuildTests in 'UBuildTests.pas',
  USourceUtilsTests in 'USourceUtilsTests.pas',
//  ULocalizerTests in 'ULocalizerTests.pas',
//  dwsRTTIFunctions,
//  UJSONTests in 'UJSONTests.pas',
//  UJSONConnectorTests in 'UJSONConnectorTests.pas',
//  UTokenizerTests in 'UTokenizerTests.pas',
//  ULanguageExtensionTests in 'ULanguageExtensionTests.pas',
  dwsSuggestions in '..\Source\SourceUtils\dwsSuggestions.pas'
//  UJITTests in 'UJITTests.pas',
//  UJITx86Tests in 'UJITx86Tests.pas',
//  ULinqTests in 'ULinqTests.pas',
//  ULinqJsonTests in 'ULinqJsonTests.pas'
;

{.$R *.res}

var
   procAffinity, systAffinity : NativeUInt;
begin
   DirectSet8087CW($133F);
   SetDecimalSeparator('.');
//   ReportMemoryLeaksOnShutdown:=True;
   Application.Initialize;
   Application.CreateForm(TGUITestRunner, TestRunner);
   Application.Run
end.

