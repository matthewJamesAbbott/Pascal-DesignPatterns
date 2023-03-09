{$mode objfpc}
{$M+}

program DecoratorPattern;

type
  Component = class abstract
    public
      procedure operation; virtual; abstract;
  end;

  ConcreteComponent = class(Component)
    public
      procedure operation; override;
  end;

  Decorator = class abstract(Component)
    protected
      component: Component;
    public
      constructor Create(c: Component);
  end;

  ConcreteDecoratorA = class(Decorator)
    public
      constructor Create(c: Component);
      procedure operation; override;
  end;

  ConcreteDecoratorB = class(Decorator)
    public
      constructor Create(c: Component);
      procedure operation; override;
  end;

procedure ConcreteComponent.operation;
begin
  writeln('ConcreteComponent operation');
end;

constructor Decorator.Create(c: Component);
begin
  component := c;
end;

constructor ConcreteDecoratorA.Create(c: Component);
begin
  inherited Create(c);
end;

constructor ConcreteDecoratorB.Create(c: Component);
begin
  inherited Create(c);
end;

procedure ConcreteDecoratorA.operation;
begin
  writeln('ConcreteDecoratorA before operation');
  component.operation;
  writeln('ConcreteDecoratorA after operation');
end;

procedure ConcreteDecoratorB.operation;
begin
  writeln('ConcreteDecoratorB before operation');
  component.operation;
  writeln('ConcreteDecoratorB after operation');
end;

var
  componentVar, decoratedComponentA, decoratedComponentB: Component;
begin
  componentVar := ConcreteComponent.Create;

  decoratedComponentA := ConcreteDecoratorA.Create(componentVar);
  decoratedComponentB := ConcreteDecoratorB.Create(decoratedComponentA);

  writeln('Calling operation on decoratedComponentB:');
  decoratedComponentB.operation;
end.

