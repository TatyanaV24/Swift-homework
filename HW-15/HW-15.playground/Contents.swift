import Foundation

// 3. Отсортируйте массив чисел по возрастанию, используя функцию Sorted.
var number = [15, 4, 67, 34, 8, 10, 13, 54, 38]

let sort = number.sorted { $0 > $1 }
sort

// 4. Переведите массив чисел в массив строк с помощью функции Map.

let transfer = number.map{String(Int($0))}
transfer

//5. Переведите массив строк с именами людей в одну строку, содержащую все эти имена, с помощью функции Reduce.

var name = ["Ульяна","Александр","Валентина","Ольга","Николай","Игорь","Ярослав","Екатерина","Сергей","Павел",]
let str = name.reduce(" "){$0 + " " + $1}
str

//6. Напишите функцию, которая принимает в себя функцию c типом (Void) -&gt; Void, которая будет вызвана с задержкой в две секунды.

func voidFunc() -> String {
    return "Функциональное программирование"
}

func printVoid(void: () -> String){
    
    sleep(2)
    print("\(void())")
    }


//7. Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции.

// первая функция
func additionTwoInts(a: Int, b: Int) -> Int {
    return a+b
}
// вторая функция
func subtractionTwoInts (a: Int, b: Int) -> Int {
    return a-b
}

func multifunc(add: (Int, Int) -> Int, sub: (Int, Int) -> Int, a: Int, b: Int)->() -> (Int){
    
    // выполняет первые две функции
    func allFunc() -> (Int) {
        let result = additionTwoInts(a: a, b: b) - subtractionTwoInts(a: a, b: b)
        return result
    }
    return allFunc
}

let num = multifunc(add: additionTwoInts, sub:subtractionTwoInts, a: 3, b: 6)()

//8. Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берёт на вход два числа, возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму.

func comparing(a:Int, b:Int) -> Bool {
    return a > b
}
func arraySorted(array:[Int], comp: (Int, Int) -> Bool) -> [Int] {
    let reversedArray = array.sorted(by: comparing)
    return reversedArray
    }
let reversedArray = arraySorted(array: [2, 15, 3, 87,4,90,7], comp: comparing)

// 9. Напишите своими словами, что такое infix-, suffix-, prefix-операторы.
// На сколько я понимаю, модификаторы используются для создания пользовательских операторов, т.е. я самостоятельно могу создавать операторы используя ключевое слово operator с добавлением модификатора infix-, suffix-, prefix.
// Так при спользовании модификатора infix-оператора указывает на то, что данный оператор устанавливается к двум величинам (например, 2 + 3). ставятся между двумя величинами. Suffix- оператор - такого я не нашла в документации и туториалах, предпологаю, что речь идет о postfix- операторе, который указывает что оператор указывается сразу за величиной(например, c!). Prefix-оператор устанавливается сразу перед величиной(например, !c)

