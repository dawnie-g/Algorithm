import Foundation

struct Operation {
  let command: Command
  let number: Int
}

enum Command: String {
  case insert = "I"
  case delete = "D"
}

struct DoublePriorityQueue {
  private var _elements = [Int]()

  mutating func insert(_ number: Int) {
    _elements.append(number)
  }

  mutating func deleteMaximum() {
    guard !_elements.isEmpty else { return }
    let max = _elements.max()!
    let index = _elements.firstIndex { $0 == max }
    _elements.remove(at: index!)
  }

  mutating func deleteMinimum() {
    guard !_elements.isEmpty else { return }
    let min = _elements.min()!
    let index = _elements.firstIndex { $0 == min }
    _elements.remove(at: index!)
  }

  var elements: [Int] {
    if _elements.isEmpty {
      return [0, 0]
    } else {
      let maximum = _elements.max()!
      let minimum = _elements.min()!
      return [maximum, minimum]
    }
  }
}

func solution(_ operations:[String]) -> [Int] {
  var operationStructs = [Operation]()
  for operation in operations {
    let splitted = operation.components(separatedBy: " ")
    let command = Command(rawValue: splitted[0])!
    let number = Int(splitted[1])!
    let operationStruct = Operation(command: command, number: number)
    operationStructs.append(operationStruct)
  }

  var queue = DoublePriorityQueue()

  for operationStruct in operationStructs {
    switch operationStruct.command {
    case .insert:
      queue.insert(operationStruct.number)
    case .delete:
      if operationStruct.number == 1 {
        queue.deleteMaximum()
      } else {
        queue.deleteMinimum()
      }
    }
  }

  return queue.elements
}