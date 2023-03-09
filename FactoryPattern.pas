{$mode objfpc}
{$M+}

program FactoryPattern;

type
  Product = class
    public
      procedure use(); virtual; abstract;
  end;

  ConcreteProductA = class(Product)
    public
      procedure use(); override;
  end;

  ConcreteProductB = class(Product)
    public
      procedure use(); override;
  end;

  Factory = class
    public
      function createProduct(productType: string): Product;
  end;

function Factory.createProduct(productType: string): Product;
begin
  if productType = 'A' then
    result := ConcreteProductA.Create()
  else if productType = 'B' then
    result := ConcreteProductB.Create()
  else
    result := nil;
end;

procedure ConcreteProductA.use();
begin
  WriteLn('Using Concrete Product A');
end;

procedure ConcreteProductB.use();
begin
  WriteLn('Using Concrete Product B');
end;

var
  factoryVar: Factory;
  productVar: Product;
begin
  factoryVar := Factory.Create();
  productVar := factoryVar.createProduct('A');
  productVar.use();
  productVar := factoryVar.createProduct('B');
  productVar.use();
end.

