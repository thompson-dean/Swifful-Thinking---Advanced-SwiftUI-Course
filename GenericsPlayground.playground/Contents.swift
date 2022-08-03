

let intArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]

let letterArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

func findIndex<T: Comparable>(array: [T], key: T) -> Int? {
    for (index, item) in array.enumerated() {
        if key == item {
            return index
        }
    }
        return nil
}

findIndex(array: letterArray, key: "c")
findIndex(array: intArray, key: 1)
