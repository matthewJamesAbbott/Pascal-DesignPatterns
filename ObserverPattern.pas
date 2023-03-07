{$mode objfpc}
{$M+}


program ObserverPattern;

type
  TObserver = class
    procedure Update(value: Integer); virtual; abstract;
  end;

  TSubject = class
  private
    state: Integer;
    observers: array of TObserver;
  public
    constructor Create;
    procedure Attach(observer: TObserver);
    procedure Detach(observer: TObserver);
    procedure Notify;
    procedure SetState(value: Integer);
  end;

  TConcreteObserverA = class(TObserver)
    procedure Update(value: Integer); override;
  end;

  TConcreteObserverB = class(TObserver)
    procedure Update(value: Integer); override;
  end;

  TConcreteObserverC = class(TObserver)
    procedure Update(value: Integer); override;
  end;

constructor TSubject.Create;
begin
  state := 0;
end;

procedure TSubject.Attach(observer: TObserver);
begin
  SetLength(observers, Length(observers) + 1);
  observers[High(observers)] := observer;
end;

procedure TSubject.Detach(observer: TObserver);
var
  i, j: Integer;
begin
  j := -1;
  for i := Low(observers) to High(observers) do
  begin
    if observers[i] = observer then
      j := i;
  end;
  if j >= 0 then
  begin
    for i := j to High(observers) - 1 do
    begin
      observers[i] := observers[i + 1];
    end;
    SetLength(observers, Length(observers) - 1);
  end;
end;

procedure TSubject.Notify;
var
  i: Integer;
begin
  for i := Low(observers) to High(observers) do
  begin
    observers[i].Update(state);
  end;
end;

procedure TSubject.SetState(value: Integer);
begin
  state := value;
  Notify;
end;

procedure TConcreteObserverA.Update(value: Integer);
begin
  Writeln('ConcreteObserverA received update with value ', value);
end;

procedure TConcreteObserverB.Update(value: Integer);
begin
  Writeln('ConcreteObserverB received update with value ', value);
end;

procedure TConcreteObserverC.Update(value: Integer);
begin
  Writeln('ConcreteObserverC received update with value ', value);
end;

var
  observerA: TObserver;
  observerB: TObserver;
  observerC: TObserver;
  subject: TSubject;
begin
  observerA := TConcreteObserverA.Create;
  observerB := TConcreteObserverB.Create;
  observerC := TConcreteObserverC.Create;

  subject := TSubject.Create;
  subject.Attach(observerA);
  subject.Attach(observerB);
  subject.Attach(observerC);

  subject.SetState(42);
end.

