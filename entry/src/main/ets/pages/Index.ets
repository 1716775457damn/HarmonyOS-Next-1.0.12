@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State testResult: string = ''

  build() {
    Column() {
      Text('TypeScript Demo')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin(20)

      Text(this.testResult)
        .fontSize(16)
        .margin(10)
        .width('90%')

      Button('Test Generic Function')
        .onClick(() => {
          let result = this.genericFunction<string>('Hello TypeScript')
          this.testResult = `Generic Result: ${result}`
        })
        .margin(10)

      Button('Test Array Length')
        .onClick(() => {
          let arr = [1, 2, 3, 4, 5]
          this.getLength(arr)
        })
        .margin(10)

      Button('Test Multiple Types')
        .onClick(() => {
          this.multipleTypes('name', 25)
        })
        .margin(10)
    }
  }

  // 简单泛型函数
  private genericFunction<T>(value: T): T {
    return value
  }

  // 数组长度检查
  private getLength<T>(arr: T[]): void {
    this.testResult = `Array length is: ${arr.length}`
  }

  // 多类型参数函数
  private multipleTypes<T, U>(name: T, value: U): void {
    this.testResult = `Name: ${name}, Value: ${value}`
  }
}

