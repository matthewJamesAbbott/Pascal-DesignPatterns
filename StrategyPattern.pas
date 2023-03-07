{$mode objfpc}
{$M+}

program StrategyPattern;

uses
  SysUtils;

type
  IStrategy = interface
    function Execute: string;
  end;

  TStrategyA = class(TInterfacedObject, IStrategy)
    function Execute: string;
  end;

  TStrategyB = class(TInterfacedObject, IStrategy)
    function Execute: string;
  end;

  TContext = class
  private
    FStrategy: IStrategy;
  public
    constructor Create(AStrategy: IStrategy);
    procedure SetStrategy(AStrategy: IStrategy);
    function ExecuteStrategy: string;
  end;

{ TStrategyA }

function TStrategyA.Execute: string;
begin
  Result := 'Executing Strategy A';
end;

{ TStrategyB }

function TStrategyB.Execute: string;
begin
  Result := 'Executing Strategy B';
end;

{ TContext }

constructor TContext.Create(AStrategy: IStrategy);
begin
  FStrategy := AStrategy;
end;

procedure TContext.SetStrategy(AStrategy: IStrategy);
begin
  FStrategy := AStrategy;
end;

function TContext.ExecuteStrategy: string;
begin
  Result := FStrategy.Execute;
end;

var
  Context: TContext;
  StrategyA: IStrategy;
  StrategyB: IStrategy;
  Swap: Char;
begin
  StrategyA := TStrategyA.Create;
  StrategyB := TStrategyB.Create;
  Context := TContext.Create(StrategyA);

  try
    while True do
    begin
      Writeln(Context.ExecuteStrategy);
      Write('Enter "A" to swap to Strategy A, "B" to swap to Strategy B, or "Q" to quit: ');
      Readln(Swap);

      case Swap of
        'A': Context.SetStrategy(StrategyA);
        'B': Context.SetStrategy(StrategyB);
        'Q': Break;
      else
        WriteLn('Invalid option.');
      end;
    end;
  finally
    Context.Free;
    StrategyA := nil;
    StrategyB := nil;
  end;
end.

