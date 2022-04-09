//
//  UtilityFunctions.swift
//  StarWarsStarships
//
//  Created by Midori Verdouw on 9/4/2022.
//

import Foundation

func formatDouble(_ value: Double) -> FloatingPointFormatStyle<Double>.FormatOutput {
    return value.formatted(.number.precision(.significantDigits(2)))
}
