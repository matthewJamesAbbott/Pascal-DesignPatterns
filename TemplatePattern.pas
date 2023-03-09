{$mode objfpc}
{$M+}

program TemplateMethod;

type
  AbstractClass = class abstract
    public
      procedure TemplateMethod; // the template method
      procedure PrimitiveOperation1; virtual; abstract;
      procedure PrimitiveOperation2; virtual; abstract;
  end;

  ConcreteClass1 = class(AbstractClass)
    public
      procedure PrimitiveOperation1; override;
      procedure PrimitiveOperation2; override;
  end;

  ConcreteClass2 = class(AbstractClass)
    public
      procedure PrimitiveOperation1; override;
      procedure PrimitiveOperation2; override;
  end;

procedure AbstractClass.TemplateMethod;
begin
  PrimitiveOperation1;
  PrimitiveOperation2;
end;

procedure ConcreteClass1.PrimitiveOperation1;
begin
  writeln('ConcreteClass1.PrimitiveOperation1');
end;

procedure ConcreteClass1.PrimitiveOperation2;
begin
  writeln('ConcreteClass1.PrimitiveOperation2');
end;

procedure ConcreteClass2.PrimitiveOperation1;
begin
  writeln('ConcreteClass2.PrimitiveOperation1');
end;

procedure ConcreteClass2.PrimitiveOperation2;
begin
  writeln('ConcreteClass2.PrimitiveOperation2');
end;

var
  ac1, ac2: AbstractClass;
begin
  ac1 := ConcreteClass1.Create;
  ac2 := ConcreteClass2.Create;

  ac1.TemplateMethod;
  writeln('');

  ac2.TemplateMethod;
end.

