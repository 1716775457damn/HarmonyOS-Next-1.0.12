//定义接口并使用
interface IAnimal {
  name: string;
  age: number;
}

interface ICat extends IAnimal {
  hair: string;
}

interface IDog extends IAnimal {
  color: string;
}

let dog1: IDog = {
  name: '小黑',
  age: 3,
  color: '黑色'
};


///////////////////////////////////////////////////////////////
//实现接口的类
interface IDog {
  name: string;
  age: number;
  jump: () =&gt; void;
}

class Dog implements IDog {
  name: string;
  age: number;
  desc: string;

  constructor(name: string, age: number, desc: string) {
    this.name = name;
    this.age = age;
    this.desc = desc;
  }

  jump() {
    console.log(`${this.name} is jumping.`);
  }
}

let dog: Dog = new Dog('小飞', 2, '是一只非常帅气的二哈');
dog.jump();



////////////////////////////////////////////
//泛型函数
function fn<t>(param: T): T {
  return param;
}

fn<string>('Hello');
fn<number>(123);
fn<boolean>(true);
fn<number[]>([1, 2, 3, 4, 5]);



///////////////////////////////////////////////////////////
//泛型约束
interface ILength {
  length: number;
}

function fn<t extends ilength>(param: T) {
  console.log(param.length);
}

fn<string>('abc');
fn<number[]>([1, 2, 3]);

//多个泛型变量
function fn<t1, t2>(param1: T1, param2: T2) {
  console.log('参数1', param1);
  console.log('参数2', param2);
}

fn<string, boolean>('Hello', true);
fn<number, string>(123, 'abc');

//泛型接口
interface IdFunc<t> {
  id: (value: T) =&gt; T;
  ids: () =&gt; T[];
}

let obj: IdFunc<number> = {
  id(value: number) {
    return value;
  },
  ids() {
    return [1, 2, 3];
  }
};

//泛型类
class Person<t> {
  id: T;
  constructor(id: T) {
    this.id = id;
  }
  getId(): T {
    return this.id;
  }
}

let p: Person<number> = new Person<number>(10);
let p2: Person<string> = new Person<string>('abc');

