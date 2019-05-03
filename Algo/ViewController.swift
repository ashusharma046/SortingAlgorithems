//
//  ViewController.swift
//  Algo
//
//  Created by Ashu Sharma 3 on 4/12/19.
//  Copyright © 2019 Ashu Sharma 3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let unsortedArray = [1,3,9,2,6,4,89,12,1,99,6,10,15,25]
        let sortedArray = selectionSort(unsortedArray)
        
        print("sortedArray  \(sortedArray)")
       
    }


    func selectionSort(_ sourceArray:Array<Int>) -> Array<Int>{
        var resultArray = sourceArray
        for index in 0..<resultArray.count-1 {
            var indexLowest = index
            for forwardIndex in (index+1..<resultArray.count-1) {
                if(resultArray[forwardIndex] < resultArray[indexLowest] ){
                    indexLowest = forwardIndex
                }
            }

            resultArray.swapAt(index, indexLowest)
        }
        return resultArray
    }
    
    func insertionSort(_ sourceArray:Array<Int>) -> Array<Int>{
         var resultArray = sourceArray
         for sortedIndex in 1..<resultArray.count{
            var backIndex = sortedIndex
            while backIndex > 0 && resultArray[backIndex] < resultArray[backIndex-1] {
                resultArray.swapAt(backIndex, backIndex-1)
                backIndex = backIndex - 1
            }
         }
         return resultArray
    }
    
    func bubbleSort(_ sourceArray:Array<Int>) -> Array<Int>{
        var resultArray = sourceArray
        for index in 0..<resultArray.count {
            for forwardIndex in 0..<resultArray.count - index-1{
                if(resultArray[forwardIndex] > resultArray[forwardIndex+1])
                {
                    resultArray.swapAt(forwardIndex, forwardIndex + 1)
                }
            }
        }
        return resultArray
    }
    
    
    func quickSort(_ sourceArray:Array<Int>) -> Array<Int>{
        var resultArray = sourceArray
        guard resultArray.count > 1 else {
            return resultArray
        }
        let pivotIndex = resultArray.count/2
        let pivotElemnt = resultArray[pivotIndex]
        let lessElementArray = resultArray.filter { (item) -> Bool in
            item < pivotElemnt
        }
        let graterElementsArray = resultArray.filter { (item) -> Bool in
            item > pivotElemnt
        }
        let equalElemtsArray = resultArray.filter { (item) -> Bool in
            item == pivotElemnt
        }
        let mergedArray = quickSort(lessElementArray) + equalElemtsArray + quickSort(graterElementsArray)
        return mergedArray
    }
    
    
  
    
    
    func mergeSort(sourceArray:Array<Int>)->Array<Int> {
        if(sourceArray.count == 1) {
            return sourceArray
        }
        let midpoint = sourceArray.count / 2
        let firstHalf = Array(sourceArray[..<midpoint])
        let secondHalf = Array(sourceArray[midpoint...])
        var firstSortedArray = mergeSort(sourceArray: firstHalf)
        var secondSortedArray = mergeSort(sourceArray: secondHalf)
        return merge(leftArray: &firstSortedArray, rightArray: &secondSortedArray)
    }
   
    
    func merge (leftArray:inout Array<Int>, rightArray:inout Array<Int>)->Array<Int> {
        var mergedArray = Array<Int>()
     
        while (leftArray.count > 0 && rightArray.count > 0 ) {
            if ( leftArray[0] > rightArray[0] ){
                mergedArray.append(leftArray[0])
                 leftArray = Array(leftArray.dropFirst())
            }
            else {
                 mergedArray.append(rightArray[0])
                 rightArray = Array(rightArray.dropFirst())
            }
        }
        
        while leftArray.count > 0 {
            mergedArray.append(leftArray[0])
            leftArray = Array(leftArray.dropFirst())
        }
        while rightArray.count > 0 {
            mergedArray.append(rightArray[0])
            rightArray = Array(rightArray.dropFirst())
        }
        
        return mergedArray
    }
    
   
}
