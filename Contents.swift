//: Playground - noun: a place where people can play

import UIKit

func mergeSort(unsortedarray: inout [Int])
{
    let n = unsortedarray.count
    if n < 2
    {
        return
    }
    let mid = n/2
    var leftArray:[Int] = []
    var rightArray:[Int] = []
    var i = 0
    var j = mid
    while i <= (mid - 1) {
        leftArray.insert(unsortedarray[i], at: i)
        i = i + 1
    }
    var k = 0
    while j <= (n - 1) {
        rightArray.insert(unsortedarray[j], at: k)
        j = j + 1
        k = k + 1
    }
    mergeSort(unsortedarray: &leftArray)
    mergeSort(unsortedarray: &rightArray)
    merge(leftArray: leftArray, rightArray:rightArray, unsortedArray:&unsortedarray)
}

func merge(leftArray: [Int],rightArray: [Int],unsortedArray: inout [Int])
{
    var i = 0
    var j = 0
    var k = 0
    while i < leftArray.count &&  j < rightArray.count {
        if leftArray[i] < rightArray[j]
        {
            unsortedArray[k] = leftArray[i]
            i = i + 1
        }
        else
        {
            unsortedArray[k] = rightArray[j]
            j = j + 1
        }
        k = k + 1
    }
    
    while i < leftArray.count {
        unsortedArray[k] = leftArray [i]
        i = i + 1
        k = k + 1
    }
    
    while j < rightArray.count {
        unsortedArray[k] = rightArray [j]
        j = j + 1
        k = k + 1
    }
}

var unSortedArray = [80,78,12,3,2]
mergeSort(unsortedarray:&unSortedArray)
print(unSortedArray)

func partition(unsortedarray: inout [Int],startIndex:Int,endIndex:Int) -> Int
{
    let pivot = unsortedarray[endIndex]
    var pIndex = 0
    var i = 0
    while i < endIndex {
        if unsortedarray[i] <= pivot
        {
            let temp = unsortedarray[i]
            unsortedarray[i] = unsortedarray[pIndex]
            unsortedarray[pIndex] = temp
            pIndex = pIndex + 1
        }
        i = i + 1
    }
    let temp = unsortedarray[pIndex]
    unsortedarray[pIndex] = pivot
    unsortedarray[endIndex] = temp
    return pIndex
}

func randomPartitionIndex(unsortedarray: inout [Int],startIndex:Int,endIndex:Int) -> Int
{
    let pivotIndex = arc4random_uniform(UInt32(endIndex))
    let pivotIndexValue = unsortedarray[Int(pivotIndex)]
    let lastIndexValue = unsortedarray[endIndex]
    
    unsortedarray[endIndex] = pivotIndexValue
    unsortedarray[Int(pivotIndex)] = lastIndexValue
    
    return partition(unsortedarray: &unsortedarray, startIndex: startIndex, endIndex: endIndex)
    
}

func quickSort(unsortedArray:inout [Int],startIndex:Int,endIndex:Int)
{
    if startIndex < endIndex
    {
        let partitionIndex = partition(unsortedarray: &unsortedArray, startIndex: startIndex, endIndex: endIndex)
        quickSort(unsortedArray: &unsortedArray, startIndex: startIndex, endIndex: partitionIndex-1)
        quickSort(unsortedArray: &unsortedArray, startIndex: partitionIndex+1, endIndex: endIndex)
    }
}

var newArray = [9,3,4,1,12,8,2,5,8,65756,56,56,5656563,345]
quickSort(unsortedArray: &newArray,startIndex: 0,endIndex: 13)

